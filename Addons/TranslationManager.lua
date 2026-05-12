local TranslationManager = {}
TranslationManager.Folder = "FluentSettings"
TranslationManager.Language = "en"
TranslationManager.Source = "en"
TranslationManager.Cache = {}
TranslationManager.Pending = {}
TranslationManager.Registered = {}
TranslationManager.Library = nil
TranslationManager.Options = nil

TranslationManager.Languages = {
	{code="af",name="Afrikaans"},{code="sq",name="Albanian"},{code="am",name="Amharic"},
	{code="ar",name="Arabic"},{code="hy",name="Armenian"},{code="az",name="Azerbaijani"},
	{code="eu",name="Basque"},{code="be",name="Belarusian"},{code="bn",name="Bengali"},
	{code="bs",name="Bosnian"},{code="bg",name="Bulgarian"},{code="ca",name="Catalan"},
	{code="ceb",name="Cebuano"},{code="zh",name="Chinese (Simplified)"},{code="zh-TW",name="Chinese (Traditional)"},
	{code="co",name="Corsican"},{code="hr",name="Croatian"},{code="cs",name="Czech"},
	{code="da",name="Danish"},{code="nl",name="Dutch"},{code="en",name="English"},
	{code="eo",name="Esperanto"},{code="et",name="Estonian"},{code="fi",name="Finnish"},
	{code="fr",name="French"},{code="fy",name="Frisian"},{code="gl",name="Galician"},
	{code="ka",name="Georgian"},{code="de",name="German"},{code="el",name="Greek"},
	{code="gu",name="Gujarati"},{code="ht",name="Haitian Creole"},{code="ha",name="Hausa"},
	{code="haw",name="Hawaiian"},{code="iw",name="Hebrew"},{code="hi",name="Hindi"},
	{code="hmn",name="Hmong"},{code="hu",name="Hungarian"},{code="is",name="Icelandic"},
	{code="ig",name="Igbo"},{code="id",name="Indonesian"},{code="ga",name="Irish"},
	{code="it",name="Italian"},{code="ja",name="Japanese"},{code="jw",name="Javanese"},
	{code="kn",name="Kannada"},{code="kk",name="Kazakh"},{code="km",name="Khmer"},
	{code="rw",name="Kinyarwanda"},{code="ko",name="Korean"},{code="ku",name="Kurdish"},
	{code="ky",name="Kyrgyz"},{code="lo",name="Lao"},{code="la",name="Latin"},
	{code="lv",name="Latvian"},{code="lt",name="Lithuanian"},{code="lb",name="Luxembourgish"},
	{code="mk",name="Macedonian"},{code="mg",name="Malagasy"},{code="ms",name="Malay"},
	{code="ml",name="Malayalam"},{code="mt",name="Maltese"},{code="mi",name="Maori"},
	{code="mr",name="Marathi"},{code="mn",name="Mongolian"},{code="my",name="Myanmar"},
	{code="ne",name="Nepali"},{code="no",name="Norwegian"},{code="ny",name="Nyanja"},
	{code="or",name="Odia"},{code="ps",name="Pashto"},{code="fa",name="Persian"},
	{code="pl",name="Polish"},{code="pt",name="Portuguese"},{code="pa",name="Punjabi"},
	{code="ro",name="Romanian"},{code="ru",name="Russian"},{code="sm",name="Samoan"},
	{code="gd",name="Scots Gaelic"},{code="sr",name="Serbian"},{code="st",name="Sesotho"},
	{code="sn",name="Shona"},{code="sd",name="Sindhi"},{code="si",name="Sinhala"},
	{code="sk",name="Slovak"},{code="sl",name="Slovenian"},{code="so",name="Somali"},
	{code="es",name="Spanish"},{code="su",name="Sundanese"},{code="sw",name="Swahili"},
	{code="sv",name="Swedish"},{code="tl",name="Filipino"},{code="tg",name="Tajik"},
	{code="ta",name="Tamil"},{code="tt",name="Tatar"},{code="te",name="Telugu"},
	{code="th",name="Thai"},{code="tr",name="Turkish"},{code="tk",name="Turkmen"},
	{code="uk",name="Ukrainian"},{code="ur",name="Urdu"},{code="ug",name="Uyghur"},
	{code="uz",name="Uzbek"},{code="vi",name="Vietnamese"},{code="cy",name="Welsh"},
	{code="xh",name="Xhosa"},{code="yi",name="Yiddish"},{code="yo",name="Yoruba"},
	{code="zu",name="Zulu"},
}

local HttpService = game:GetService("HttpService")

local function urlEncode(s)
	s = tostring(s or "")
	s = s:gsub("\n", "\r\n")
	s = s:gsub("([^%w%-%.%_%~ ])", function(c) return ("%%%02X"):format(string.byte(c)) end)
	s = s:gsub(" ", "+")
	return s
end

local function cacheKey(text, from, to)
	return from..":"..to..":"..text
end

local function fetchTranslation(text, from, to, callback)
	if from == to or not text or text == "" then callback(text) return end
	local k = cacheKey(text, from, to)
	if TranslationManager.Cache[k] then callback(TranslationManager.Cache[k]) return end
	if TranslationManager.Pending[k] then
		table.insert(TranslationManager.Pending[k], callback)
		return
	end
	TranslationManager.Pending[k] = {callback}
	task.spawn(function()
		local result = text
		local ok, raw = pcall(game.HttpGet, game,
			"https://api.mymemory.translated.net/get?q="..urlEncode(text)
			.."&langpair="..urlEncode(from.."|"..to), true)
		if ok and raw then
			local jok, data = pcall(HttpService.JSONDecode, HttpService, raw)
			if jok and data and data.responseData then
				local t = data.responseData.translatedText
				if t and #t > 0 and not t:find("MYMEMORY WARNING") then
					result = t
				end
			end
		end
		TranslationManager.Cache[k] = result
		local cbs = TranslationManager.Pending[k]
		TranslationManager.Pending[k] = nil
		for _, cb in ipairs(cbs or {}) do task.spawn(cb, result) end
	end)
end

local function scanAndReplace(root, original, translated)
	if not root or not root:IsA("Instance") then return end
	for _, d in ipairs(root:GetDescendants()) do
		if (d:IsA("TextLabel") or d:IsA("TextButton")) and d.Text == original then
			d.Text = translated
		end
	end
end

function TranslationManager:SetLibrary(lib)
	self.Library = lib
	self.Options = lib.Options
end

function TranslationManager:SetFolder(folder)
	self.Folder = folder
	self:BuildFolderTree()
end

function TranslationManager:BuildFolderTree()
	if not isfolder(self.Folder) then makefolder(self.Folder) end
	if not isfolder(self.Folder.."/settings") then makefolder(self.Folder.."/settings") end
end

function TranslationManager:SaveSettings()
	local ok, enc = pcall(HttpService.JSONEncode, HttpService, {Language = self.Language})
	if ok then pcall(writefile, self.Folder.."/translation.json", enc) end
end

function TranslationManager:LoadSettings()
	local path = self.Folder.."/translation.json"
	if isfile(path) then
		local ok, dec = pcall(HttpService.JSONDecode, HttpService, readfile(path))
		if ok and dec and dec.Language then self.Language = dec.Language end
	end
end

function TranslationManager:GetLanguageNames()
	local t = {}
	for _, l in ipairs(self.Languages) do table.insert(t, l.name) end
	return t
end

function TranslationManager:GetCodeFromName(name)
	for _, l in ipairs(self.Languages) do if l.name == name then return l.code end end
	return "en"
end

function TranslationManager:GetNameFromCode(code)
	for _, l in ipairs(self.Languages) do if l.code == code then return l.name end end
	return "English"
end

function TranslationManager:Register(text, callback)
	if not text or text == "" then return end
	if not self.Registered[text] then self.Registered[text] = {} end
	table.insert(self.Registered[text], callback)
	fetchTranslation(text, self.Source, self.Language, callback)
end

function TranslationManager:SetLanguage(code)
	self.Language = code
	self:SaveSettings()
	for origText, callbacks in pairs(self.Registered) do
		local cbs = callbacks
		fetchTranslation(origText, self.Source, code, function(translated)
			for _, cb in ipairs(cbs) do task.spawn(cb, translated) end
		end)
	end
end

function TranslationManager:TranslateElement(el, origTitle, origDesc)
	if not el then return end
	if origTitle and origTitle ~= "" then
		self:Register(origTitle, function(t)
			pcall(function() el:SetTitle(t) end)
			if self.Library and self.Library.GUI then
				pcall(scanAndReplace, self.Library.GUI, origTitle, t)
			end
		end)
	end
	if origDesc and origDesc ~= "" then
		self:Register(origDesc, function(t)
			pcall(function() el:SetDesc(t) end)
			if self.Library and self.Library.GUI then
				pcall(scanAndReplace, self.Library.GUI, origDesc, t)
			end
		end)
	end
end

function TranslationManager:PatchSection(section)
	if not section or section.__tm_patched then return end
	section.__tm_patched = true
	local _self = self
	local types = {"Toggle","Slider","Dropdown","Button","Input","Keybind","Colorpicker","Paragraph"}
	for _, etype in ipairs(types) do
		local methodName = "Add"..etype
		local orig = section[methodName]
		if type(orig) == "function" then
			section[methodName] = function(sec, idOrOpts, opts)
				local el = orig(sec, idOrOpts, opts)
				local o = (type(idOrOpts) == "table" and idOrOpts) or (type(opts) == "table" and opts) or {}
				if el then _self:TranslateElement(el, o.Title, o.Description) end
				return el
			end
		end
	end
end

function TranslationManager:PatchTab(tab)
	if not tab or tab.__tm_patched then return end
	tab.__tm_patched = true
	local origAddSection = tab.AddSection
	if type(origAddSection) ~= "function" then return end
	local _self = self
	tab.AddSection = function(t, title)
		local section = origAddSection(t, title)
		if title and title ~= "" and section then
			_self:Register(title, function(translated)
				pcall(function()
					if section.Frame then scanAndReplace(section.Frame, title, translated) end
					if _self.Library and _self.Library.GUI then
						scanAndReplace(_self.Library.GUI, title, translated)
					end
				end)
			end)
		end
		_self:PatchSection(section)
		return section
	end
end

-- Call this immediately after CreateWindow, before any AddTab
function TranslationManager:PatchWindow(window)
	if not window or window.__tm_patched then return end
	window.__tm_patched = true
	local origAddTab = window.AddTab
	if type(origAddTab) ~= "function" then return end
	local _self = self
	window.AddTab = function(w, opts)
		local o = opts or {}
		local tab = origAddTab(w, o)
		if o.Title and o.Title ~= "" and tab then
			local origTitle = o.Title
			_self:Register(origTitle, function(translated)
				pcall(function()
					if tab.Button then scanAndReplace(tab.Button, origTitle, translated) end
					if _self.Library and _self.Library.GUI then
						scanAndReplace(_self.Library.GUI, origTitle, translated)
					end
				end)
			end)
		end
		_self:PatchTab(tab)
		return tab
	end
end

function TranslationManager:BuildTranslationSection(tab)
	assert(self.Library, "TranslationManager: call SetLibrary(Fluent) first")
	self:LoadSettings()

	local section = tab:AddSection("Translation")

	local langNames   = self:GetLanguageNames()
	local currentName = self:GetNameFromCode(self.Language)

	local dropdown = section:AddDropdown("TranslationLanguage", {
		Title       = "Language",
		Description = "Translate the entire interface",
		Icon        = "solar/global-bold",
		Values      = langNames,
		Default     = currentName,
		Callback    = function(selectedName)
			local code = self:GetCodeFromName(selectedName)
			self:SetLanguage(code)
			if self.Library then
				self.Library:Notify({Title = "Translation", Content = "Language set to "..selectedName, Duration = 4})
			end
		end,
	})

	dropdown:SetValue(currentName)

	section:AddButton({
		Title    = "Reset to English",
		Icon     = "solar/refresh-bold",
		Callback = function()
			self:SetLanguage("en")
			dropdown:SetValue("English")
			if self.Library then
				self.Library:Notify({Title = "Translation", Content = "Reset to English", Duration = 3})
			end
		end,
	})

	section:AddButton({
		Title       = "Clear Cache",
		Icon        = "solar/trash-bin-trash-bold",
		Description = "Force re-fetch all translations",
		Callback    = function()
			self.Cache = {}
			if self.Library then
				self.Library:Notify({Title = "Translation", Content = "Cache cleared", Duration = 3})
			end
		end,
	})
end

TranslationManager:BuildFolderTree()

return TranslationManager
