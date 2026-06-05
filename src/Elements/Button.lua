local Root    = script.Parent.Parent
local Creator = require(Root.Creator)
local New     = Creator.New

local Button = {}
Button.__index = Button
Button.__type  = "Button"

function Button:New(_, config)
	assert(config.Title, "Button - Missing Title")
	config.Callback = config.Callback or function() end
	local lib = self.Library

	local el = require(Root.Components.Element)(config.Title, config.Description, self.Container, true)

	local iconData = config.Icon and lib:GetIcon(config.Icon)
	local imgId    = "rbxassetid://10709791437"
	local rectOff  = Vector2.new()
	local rectSz   = Vector2.new()
	if iconData then
		if type(iconData) == "table" then
			imgId   = iconData.Image           or imgId
			rectOff = iconData.ImageRectOffset or rectOff
			rectSz  = iconData.ImageRectSize   or rectSz
		else
			imgId = tostring(iconData)
		end
	end

	New("ImageLabel", {
		Image                = imgId,
		ImageRectOffset      = rectOff,
		ImageRectSize        = rectSz,
		Size                 = UDim2.fromOffset(16, 16),
		AnchorPoint          = Vector2.new(1, 0.5),
		Position             = UDim2.new(1, -10, 0.5, 0),
		BackgroundTransparency = 1,
		Parent               = el.Frame,
		ThemeTag             = { ImageColor3 = "Text" },
	})

	Creator.AddSignal(el.Frame.MouseButton1Click, function()
		lib:SafeCallback(config.Callback)
	end)

	function el:SetDesc(text)
		el.DescLabel.Text    = text or ""
		el.DescLabel.Visible = text ~= nil and text ~= ""
	end

	return el
end

return Button
