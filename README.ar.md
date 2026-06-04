<img src="Assets/logodark.png#gh-dark-mode-only" alt="fluent">
<img src="Assets/logolight.png#gh-light-mode-only" alt="fluent">
<img src="Assets/Theme 2.png" alt="fluent">
<img src="Assets/Theme1.png" alt="fluent">


# FluentModded

نسخة معدّلة من مكتبة واجهة المستخدم [Fluent](https://github.com/dawid-scripts/Fluent) لـ Roblox، مُوسَّعة بثيمات إضافية، ودعم حزم أيقونات متعددة، وتحسينات عملية متنوعة.

---

## البدء السريع

```lua
local Fluent = loadstring(game:HttpGet(
    "https://github.com/StyearX/Fluent-Modded/releases/download/Fluent/FluentPro"
))()

local Window = Fluent:CreateWindow({
    Title       = "My Hub",
    SubTitle    = "by me",
    TabWidth    = 160,
    Size        = UDim2.fromOffset(500, 480),
    Acrylic     = true,
    Theme       = "AMOLED",
    MinimizeKey = Enum.KeyCode.LeftControl,
    Search      = true,
})

local Tab = Window:AddTab({ Title = "Main", Icon = "solar/home-bold" })
```

---

## العناصر

تُضاف جميع العناصر عبر `Tab:AddElementType(id, config)`.

| الوظيفة | الوصف |
|---|---|
| `AddToggle` | مفتاح تشغيل/إيقاف |
| `AddSlider` | شريط تمرير رقمي |
| `AddInput` | حقل إدخال نصي |
| `AddDropdown` | قائمة منسدلة أحادية أو متعددة الاختيار |
| `AddColorpicker` | منتقي الألوان مع الشفافية |
| `AddKeybind` | اختصار لوحة المفاتيح/الفأرة |
| `AddButton` | زر قابل للنقر |
| `AddParagraph` | كتلة نص للقراءة فقط |
| `AddCode` | زر النسخ |
| `AddSpace` | مسافة فارغة |
| `AddGroup` | تجميع عناصر أخرى |
| `Addimage` | صورة داخل النافذة، تدعم HttpGet و rbxassetid |
| `AddDivider` | فاصل |
| `AddVideo` | فيديو داخل النافذة، يدعم rbxassetid |
| `AddAudio` | صوت داخل النافذة، يدعم HttpGet / http url و rbxassetid |

---

## الثيمات المخصصة

سجّل ثيماً مخصصاً قبل استدعاء `CreateWindow`.

```lua
Fluent:RegisterCustomTheme("MyTheme", {
    Accent      = Color3.fromRGB(96, 205, 255),
    AcrylicMain = Color3.fromRGB(20, 20, 30),
    Text        = Color3.fromRGB(240, 240, 255),
    -- ... (راجع الثيمات المدمجة لمعرفة جميع الحقول)
    IconColor   = Color3.fromRGB(96, 205, 255), -- تلوين جميع الأيقونات
    IconSize    = 18,                            -- حجم الأيقونة بالبكسل
})

-- تغيير الثيم أثناء التشغيل
Fluent:SetTheme("MyTheme")
```

### الثيمات المدمجة

`AMOLED` · `Ash Gray` · `Blood Red` · `Cyanic` · `Amber Glow` · `Deep Violet` · `Neon Cyber` · `Neon Purple` · `Royal Blue` · `Deep Ocean` · `RGB` · `Orange` · `Charcoal` · `Pearl White` · `Midnight Blue` · `Galaxy Purple` · `Cosmic Violet` · `Cotton Candy`

---

## حزم الأيقونات

تُحمَّل جميع حزم الأيقونات عند الطلب. استخدم صيغة `prefix/اسم-الأيقونة` في أي مكان يقبل خاصية `Icon`.

| الحزمة | البادئة | المستودع |
|---|---|---|
| Solar | `solar/` | https://github.com/StyearX/Icons/tree/main/solar |
| Gravity | `gravity/` | https://github.com/StyearX/Icons/tree/main/gravity |
| Lucide | `lucide/` | https://github.com/StyearX/Icons/tree/main/lucide |
| Craft | `craft/` | https://github.com/StyearX/Icons/tree/main/craft |
| Geist | `geist/` | https://github.com/StyearX/Icons/tree/main/geist |
| SF Symbols | `sfsymbols/` | https://github.com/StyearX/Icons/tree/main/sfsymbols |
| Heroicons | `hero/` | https://github.com/StyearX/Icons/blob/main/hero |
| Google Material Icons | `gmi/` | https://github.com/StyearX/Icons/blob/main/GoogleMaterialIcons |

```lua
-- مثال على الاستخدام
Tab:AddButton({ Title = "Home", Icon = "solar/home-bold", Callback = function() end })
Tab:AddButton({ Title = "Archive", Icon = "gravity/archive", Callback = function() end })
```

---

## SaveManager & InterfaceManager

```lua
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

InterfaceManager:SetFolder("MyHub")
SaveManager:SetFolder("MyHub/Config")

InterfaceManager:BuildInterfaceSection(SettingsTab)
SaveManager:BuildConfigSection(SettingsTab)

SaveManager:IgnoreThemeSettings()
SaveManager:LoadAutoloadConfig()
```

---

## سجل التغييرات

### v1.4.0 إعادة هيكلة شاملة
- إضافة DropdownOutsideWindow
- إصلاح Floating Button manager (لأنه كان يُغيّر زاوية الواجهة)
- إعادة كتابة الكود الأصلي للعناصر بالكامل بشكل مبسّط مع الحفاظ على الوظائف والواجهة

### v1.3.0
- إزالة نظام اللغات (معطوب)
- إضافة عنصر جديد `AddAudio`
- إصلاح عدم ظهور الصور في النافذة عبر AddImages
- إصلاح عدم ظهور الفيديو في النافذة عبر AddVideo
- إزالة دعم http url للفيديو

### v1.2.9
- إضافة نظام اللغات (معطوب)
- إضافة تعطيل BackgroundImages (يعمل بالكامل، يمكن تفعيله أو تعطيله في Interface manager)
- إضافة عناصر جديدة `AddCode`، `AddImage` (غير مكتمل)، `AddVideo` (لا يعمل)، `AddDivider`، `AddSpace`، `AddGroup` — يمكن تفعيلها عبر NameSection:AddElementName
- إصلاح التحميل التلقائي في FBM
- إصلاح التحميل التلقائي في Save manager
- إصلاح Outline/UIStroke على شريط تمرير السلايدر
- إصلاح عدم القدرة على تعديل UserInfoSubtitle و UserInfoTitle في UserInfo

### v1.2.0
- إصلاح ظهور ثيم Orange كـ Ash Gray (خطأ في اسم المفتاح)
- تغيير الثيم الافتراضي إلى AMOLED

### v1.1.0
- إزالة بعض الثيمات بسبب مشاكل التأخر مع إضافة الثيمات المخصصة
- إضافة نظام أيقونات متعدد الحزم (Solar, Gravity, Lucide, Craft, Geist, SF Symbols)
- إضافة `RegisterCustomTheme` مع دعم `IconColor` و `IconSize`
- المحتفظ بها: AMOLED, RGB, Neon Cyber, Neon Purple, Royal Blue, Deep Ocean, Orange, Charcoal, Pearl White, Midnight Blue, Galaxy Purple, Cosmic Violet, Cotton Candy

---

## الرخصة

MIT — راجع [مستودع Fluent الأصلي](https://github.com/dawid-scripts/Fluent) لتفاصيل الرخصة.

---

## الاعتمادات

- [dawid-scripts/Fluent](https://github.com/dawid-scripts/Fluent) — المكتبة الأصلية
- [richie0866/remote-spy](https://github.com/richie0866/remote-spy) — أصول الواجهة والكود
- [violin-suzutsuki/LinoriaLib](https://github.com/violin-suzutsuki/LinoriaLib) — كود العناصر، save manager
- [7kayoh/Acrylic](https://github.com/7kayoh/Acrylic) — منفذ تأثير الضبابية الأكريلية بلغة Lua
- [Latte Softworks & Kotera](https://discord.gg/rMMByr4qas) — أداة التجميع

## المساهمون

- **StyearX** — المطور الرئيسي
- **Era** — مساهم
- **EvilFishess** — مساهم
