<img src="Assets/logodark.png#gh-dark-mode-only" alt="fluent">
<img src="Assets/logolight.png#gh-light-mode-only" alt="fluent">
<img src="Assets/Theme 2.png" alt="fluent">
<img src="Assets/Theme1.png" alt="fluent">


# FluentModded

Модифицированная версия UI-библиотеки [Fluent](https://github.com/dawid-scripts/Fluent) для Roblox с дополнительными темами, поддержкой нескольких наборов иконок и улучшениями удобства использования.

---

## Быстрый Старт

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

## Элементы

Все элементы добавляются через `Tab:AddElementType(id, config)`.

| Метод | Описание |
|---|---|
| `AddToggle` | Переключатель вкл/выкл |
| `AddSlider` | Ползунок числового диапазона |
| `AddInput` | Поле ввода текста |
| `AddDropdown` | Выпадающий список одиночного или множественного выбора |
| `AddColorpicker` | Выбор цвета с прозрачностью |
| `AddKeybind` | Горячая клавиша клавиатуры/мыши |
| `AddButton` | Кликабельная кнопка |
| `AddParagraph` | Блок текста только для чтения |
| `AddCode` | Кнопка копирования |
| `AddSpace` | Пространство |
| `AddGroup` | Группировка других элементов |
| `Addimage` | Изображение в окне, поддерживает HttpGet и rbxassetid |
| `AddDivider` | Разделитель |
| `AddVideo` | Видео в окне, поддерживает rbxassetid |
| `AddAudio` | Аудио в окне, поддерживает HttpGet / http url и rbxassetid |

---

## Пользовательские Темы

Зарегистрируйте пользовательскую тему перед вызовом `CreateWindow`.

```lua
Fluent:RegisterCustomTheme("MyTheme", {
    Accent      = Color3.fromRGB(96, 205, 255),
    AcrylicMain = Color3.fromRGB(20, 20, 30),
    Text        = Color3.fromRGB(240, 240, 255),
    -- ... (см. встроенные темы для всех полей)
    IconColor   = Color3.fromRGB(96, 205, 255), -- окраска всех иконок
    IconSize    = 18,                            -- размер иконки в px
})

-- Переключение темы во время выполнения
Fluent:SetTheme("MyTheme")
```

### Встроенные Темы

`AMOLED` · `Ash Gray` · `Blood Red` · `Cyanic` · `Amber Glow` · `Deep Violet` · `Neon Cyber` · `Neon Purple` · `Royal Blue` · `Deep Ocean` · `RGB` · `Orange` · `Charcoal` · `Pearl White` · `Midnight Blue` · `Galaxy Purple` · `Cosmic Violet` · `Cotton Candy`

---

## Наборы Иконок

Все наборы иконок загружаются по требованию. Используйте формат `prefix/имя-иконки` везде, где принимается свойство `Icon`.

| Набор | Префикс | Репозиторий |
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
-- Пример использования
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

## История Изменений

### v1.4.0 Полная Переработка
- Добавлен DropdownOutsideWindow
- Исправлен Floating Button manager (менял угол интерфейса)
- Полная переработка оригинального кода элементов: упрощён, но сохраняет функциональность и внешний вид

### v1.3.0
- Удалена система языков (нерабочая)
- Добавлен новый элемент `AddAudio`
- Исправлено: AddImages не отображал изображения в окне
- Исправлено: AddVideo не отображал видео в окне
- Удалена поддержка http url для видео

### v1.2.9
- Добавлена система языков (нерабочая)
- Добавлено отключение BackgroundImages (полностью работает, включается/выключается в Interface manager)
- Добавлены новые элементы `AddCode`, `AddImage` (ещё не полностью работает), `AddVideo` (не работает), `AddDivider`, `AddSpace`, `AddGroup` — разблокируются через NameSection:AddElementName
- Исправлена автозагрузка в FBM
- Исправлена автозагрузка в Save manager
- Исправлен Outline/UIStroke на ползунке слайдера
- Исправлена невозможность изменить UserInfoSubtitle и UserInfoTitle в UserInfo

### v1.2.0
- Исправлено: тема Orange отображалась как Ash Gray (несоответствие ключей)
- Тема по умолчанию изменена на AMOLED

### v1.1.0
- Удалены некоторые темы из-за проблем с производительностью, добавлены пользовательские темы
- Добавлена система иконок с несколькими наборами (Solar, Gravity, Lucide, Craft, Geist, SF Symbols)
- Добавлен `RegisterCustomTheme` с поддержкой `IconColor` и `IconSize`
- Сохранены: AMOLED, RGB, Neon Cyber, Neon Purple, Royal Blue, Deep Ocean, Orange, Charcoal, Pearl White, Midnight Blue, Galaxy Purple, Cosmic Violet, Cotton Candy

---

## Лицензия

MIT — подробности лицензии см. в оригинальном [репозитории Fluent](https://github.com/dawid-scripts/Fluent).

---

## Благодарности

- [dawid-scripts/Fluent](https://github.com/dawid-scripts/Fluent) — оригинальная библиотека
- [richie0866/remote-spy](https://github.com/richie0866/remote-spy) — UI-ресурсы и код
- [violin-suzutsuki/LinoriaLib](https://github.com/violin-suzutsuki/LinoriaLib) — код элементов, save manager
- [7kayoh/Acrylic](https://github.com/7kayoh/Acrylic) — порт акрилового размытия на Lua
- [Latte Softworks & Kotera](https://discord.gg/rMMByr4qas) — сборщик

## Участники

- **StyearX** — Главный Разработчик
- **Era** — Участник
- **EvilFishess** — Участник
