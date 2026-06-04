<img src="Assets/logodark.png#gh-dark-mode-only" alt="fluent">
<img src="Assets/logolight.png#gh-light-mode-only" alt="fluent">
<img src="Assets/Theme 2.png" alt="fluent">
<img src="Assets/Theme1.png" alt="fluent">


# FluentModded

[Fluent](https://github.com/dawid-scripts/Fluent) UI 库的 Roblox 修改版本，新增额外主题、多图标包支持以及多项体验改进。

---

## 快速开始

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

## 元素

所有元素均通过 `Tab:AddElementType(id, config)` 添加。

| 方法 | 描述 |
|---|---|
| `AddToggle` | 开/关切换 |
| `AddSlider` | 数值范围滑块 |
| `AddInput` | 文本输入框 |
| `AddDropdown` | 单选或多选下拉框 |
| `AddColorpicker` | 带透明度的颜色选择器 |
| `AddKeybind` | 键盘/鼠标快捷键 |
| `AddButton` | 可点击按钮 |
| `AddParagraph` | 只读文本块 |
| `AddCode` | 复制按钮 |
| `AddSpace` | 空白间距 |
| `AddGroup` | 分组其他元素 |
| `Addimage` | 窗口内图片，支持 HttpGet 和 rbxassetid |
| `AddDivider` | 分隔线 |
| `AddVideo` | 窗口内视频，支持 rbxassetid |
| `AddAudio` | 窗口内音频，支持 HttpGet / http url 和 rbxassetid |

---

## 自定义主题

在调用 `CreateWindow` 之前注册自定义主题。

```lua
Fluent:RegisterCustomTheme("MyTheme", {
    Accent      = Color3.fromRGB(96, 205, 255),
    AcrylicMain = Color3.fromRGB(20, 20, 30),
    Text        = Color3.fromRGB(240, 240, 255),
    -- ... (所有字段请参考内置主题)
    IconColor   = Color3.fromRGB(96, 205, 255), -- 为所有图标着色
    IconSize    = 18,                            -- 图标大小（px）
})

-- 运行时切换主题
Fluent:SetTheme("MyTheme")
```

### 内置主题

`AMOLED` · `Ash Gray` · `Blood Red` · `Cyanic` · `Amber Glow` · `Deep Violet` · `Neon Cyber` · `Neon Purple` · `Royal Blue` · `Deep Ocean` · `RGB` · `Orange` · `Charcoal` · `Pearl White` · `Midnight Blue` · `Galaxy Purple` · `Cosmic Violet` · `Cotton Candy`

---

## 图标包

所有图标包均按需加载。在任何接受 `Icon` 属性的地方使用 `前缀/图标名称` 格式。

| 图标包 | 前缀 | 仓库 |
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
-- 使用示例
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

## 更新日志

### v1.4.0 大改版
- 新增 DropdownOutsideWindow
- 修复 Floating Button manager（因其会改变 UI 圆角）
- 全面重构元素代码，简化代码的同时保持功能与界面不变

### v1.3.0
- 移除语言系统（存在问题）
- 新增元素 `AddAudio`
- 修复 AddImages 在窗口中不显示图片的问题
- 修复 AddVideo 在窗口中不显示视频的问题
- 移除视频的 http url 支持

### v1.2.9
- 新增语言系统（存在问题）
- 新增禁用背景图片功能（完全可用，可在 Interface manager 中开关）
- 新增元素 `AddCode`、`AddImage`（尚未完整）、`AddVideo`（暂不可用）、`AddDivider`、`AddSpace`、`AddGroup` — 可通过 NameSection:AddElementName 解锁
- 修复 FBM 自动加载
- 修复 Save manager 自动加载
- 修复滑块滑块上的 Outline/UIStroke 问题
- 修复 UserInfo 中无法修改 UserInfoSubtitle 和 UserInfoTitle 的问题

### v1.2.0
- 修复 Orange 主题显示为 Ash Gray 的问题（键名不匹配 bug）
- 将默认主题更改为 AMOLED

### v1.1.0
- 因卡顿问题移除部分主题，同时新增自定义主题
- 新增多包图标系统（Solar、Gravity、Lucide、Craft、Geist、SF Symbols）
- 新增支持 `IconColor` 和 `IconSize` 的 `RegisterCustomTheme`
- 保留：AMOLED、RGB、Neon Cyber、Neon Purple、Royal Blue、Deep Ocean、Orange、Charcoal、Pearl White、Midnight Blue、Galaxy Purple、Cosmic Violet、Cotton Candy

---

## 许可证

MIT — 许可证详情请参见原始 [Fluent 仓库](https://github.com/dawid-scripts/Fluent)。

---

## 致谢

- [dawid-scripts/Fluent](https://github.com/dawid-scripts/Fluent) — 原始库
- [richie0866/remote-spy](https://github.com/richie0866/remote-spy) — UI 资产与代码
- [violin-suzutsuki/LinoriaLib](https://github.com/violin-suzutsuki/LinoriaLib) — 元素代码、存档管理器
- [7kayoh/Acrylic](https://github.com/7kayoh/Acrylic) — Lua 亚克力模糊移植
- [Latte Softworks & Kotera](https://discord.gg/rMMByr4qas) — 打包工具

## 贡献者

- **StyearX** — 主要开发者
- **Era** — 贡献者
- **EvilFishess** — 贡献者
