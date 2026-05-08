# FluentModded

A modified version of the [Fluent](https://github.com/dawid-scripts/Fluent) UI library for Roblox, extended with extra themes, WindUI-inspired elements, multi-pack icon support, and quality-of-life improvements.

---

## Quick Start

```lua
local Fluent = loadstring(game:HttpGet(
    "https://github.com/StyearX/Fluent-Modded/releases/download/FluentBeta/FluentLiteTest"
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

## Elements

All elements are added via `Tab:AddElementType(id, config)`.

| Method | Description |
|---|---|
| `AddToggle` | On/off switch |
| `AddSlider` | Numeric range slider |
| `AddInput` | Text input box |
| `AddDropdown` | Single or multi-select dropdown |
| `AddColorpicker` | Color picker with transparency |
| `AddKeybind` | Keyboard/mouse keybind |
| `AddButton` | Clickable button |
| `AddParagraph` | Read-only text block |

### WindUI-Inspired Elements

These are accessed via `Fluent.Elements.*` and accept a section as the first argument.

```lua
-- Horizontal rule divider
Fluent.Elements.AddDivider(section, {})

-- Vertical spacing
Fluent.Elements.AddSpace(section, { Height = 12 })

-- Image (rbxassetid or HTTP url)
Fluent.Elements.AddImage(section, {
    Image       = "rbxassetid://123456789",
    AspectRatio = "16:9",
    Radius      = 8,
})

-- Video (rbxassetid or HTTP url)
Fluent.Elements.AddVideo(section, {
    Video       = "rbxassetid://123456789",
    AspectRatio = "16:9",
    Looped      = true,
    AutoPlay    = true,
})

-- Group (side-by-side layout)
local group = Fluent.Elements.AddGroup(section, { Columns = 2, Gap = 6 })
local col1  = group:AddElement({})
local col2  = group:AddElement({})
```

---

## Custom Themes

Register a custom theme before calling `CreateWindow`.

```lua
Fluent:RegisterCustomTheme("MyTheme", {
    Accent      = Color3.fromRGB(96, 205, 255),
    AcrylicMain = Color3.fromRGB(20, 20, 30),
    Text        = Color3.fromRGB(240, 240, 255),
    -- ... (see built-in themes for all fields)
    IconColor   = Color3.fromRGB(96, 205, 255), -- tint all icons
    IconSize    = 18,                            -- icon size in px
})

-- Switch theme at runtime
Fluent:SetTheme("MyTheme")
```

### Built-in Themes

`AMOLED` · `Ash Gray` · `Blood Red` · `Cyanic` · `Amber Glow` · `Deep Violet` · `Neon Cyber` · `Neon Purple` · `Royal Blue` · `Deep Ocean` · `RGB` · `Orange` · `Charcoal` · `Pearl White` · `Midnight Blue` · `Galaxy Purple` · `Cosmic Violet` · `Cotton Candy`

---

## Icon Packs

All icon packs are loaded on demand. Use the `prefix/icon-name` format anywhere an `Icon` property is accepted.

| Pack | Prefix | Repository |
|---|---|---|
| Solar | `solar/` | https://github.com/StyearX/Icons/tree/main/solar |
| Gravity | `gravity/` | https://github.com/StyearX/Icons/tree/main/gravity |
| Lucide | `lucide/` | https://github.com/StyearX/Icons/tree/main/lucide |
| Craft | `craft/` | https://github.com/StyearX/Icons/tree/main/craft |
| Geist | `geist/` | https://github.com/StyearX/Icons/tree/main/geist |
| SF Symbols | `sfsymbols/` | https://github.com/StyearX/Icons/tree/main/sfsymbols |

```lua
-- Usage example
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

## Changelog

### v1.2.0
- Fixed Orange theme rendering as Ash Gray (key mismatch bug)
- Changed default theme to AMOLED
- Added `AddImage` element — supports `rbxassetid://` and HTTP URLs
- Added `AddVideo` element — supports `rbxassetid://` and HTTP URLs
- Added `AddGroup` element — side-by-side column layout
- Removed decorative header comments from library file
- Updated Example.lua to 3 tabs with clean comments only

### v1.1.0
- Added WindUI-inspired `AddDivider` and `AddSpace` elements
- Added multi-pack icon system (Solar, Gravity, Lucide, Craft, Geist, SF Symbols)
- Added `RegisterCustomTheme` with `IconColor` and `IconSize` support
- Added new themes: AMOLED, RGB, Neon Cyber, Neon Purple, Royal Blue, Deep Ocean,
  Orange, Charcoal, Pearl White, Midnight Blue, Galaxy Purple, Cosmic Violet, Cotton Candy

---

## License

MIT — see the original [Fluent repository](https://github.com/dawid-scripts/Fluent) for license details.

---

## Credits

- [dawid-scripts/Fluent](https://github.com/dawid-scripts/Fluent) — original library
- [richie0866/remote-spy](https://github.com/richie0866/remote-spy) — UI assets and code
- [violin-suzutsuki/LinoriaLib](https://github.com/violin-suzutsuki/LinoriaLib) — element code, save manager
- [7kayoh/Acrylic](https://github.com/7kayoh/Acrylic) — Lua acrylic blur port
- [Latte Softworks & Kotera](https://discord.gg/rMMByr4qas) — bundler

## Contributors

- **StyearX** — Main Developer
- **Era** — Contributor
- **EvilFishess** — Contributor
