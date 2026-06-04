<img src="Assets/logodark.png#gh-dark-mode-only" alt="fluent">
<img src="Assets/logolight.png#gh-light-mode-only" alt="fluent">
<img src="Assets/Theme 2.png" alt="fluent">
<img src="Assets/Theme1.png" alt="fluent">


# FluentModded

Una versión modificada de la librería UI [Fluent](https://github.com/dawid-scripts/Fluent) para Roblox, extendida con temas adicionales, soporte de multi-pack de iconos y mejoras de calidad de uso.

---

## Inicio Rápido

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

## Elementos

Todos los elementos se agregan mediante `Tab:AddElementType(id, config)`.

| Método | Descripción |
|---|---|
| `AddToggle` | Interruptor on/off |
| `AddSlider` | Deslizador de rango numérico |
| `AddInput` | Caja de texto |
| `AddDropdown` | Desplegable de selección simple o múltiple |
| `AddColorpicker` | Selector de color con transparencia |
| `AddKeybind` | Atajo de teclado/ratón |
| `AddButton` | Botón clicable |
| `AddParagraph` | Bloque de texto solo lectura |
| `AddCode` | Botón de copiar |
| `AddSpace` | Espacio |
| `AddGroup` | Agrupar otros elementos |
| `Addimage` | Imagen en la ventana, soporta HttpGet y rbxassetid |
| `AddDivider` | Divisor |
| `AddVideo` | Video en la ventana, soporta rbxassetid |
| `AddAudio` | Audio en la ventana, soporta HttpGet / http url y rbxassetid |

---

## Temas Personalizados

Registra un tema personalizado antes de llamar a `CreateWindow`.

```lua
Fluent:RegisterCustomTheme("MyTheme", {
    Accent      = Color3.fromRGB(96, 205, 255),
    AcrylicMain = Color3.fromRGB(20, 20, 30),
    Text        = Color3.fromRGB(240, 240, 255),
    -- ... (ver temas integrados para todos los campos)
    IconColor   = Color3.fromRGB(96, 205, 255), -- tinte para todos los iconos
    IconSize    = 18,                            -- tamaño del icono en px
})

-- Cambiar tema en tiempo de ejecución
Fluent:SetTheme("MyTheme")
```

### Temas Integrados

`AMOLED` · `Ash Gray` · `Blood Red` · `Cyanic` · `Amber Glow` · `Deep Violet` · `Neon Cyber` · `Neon Purple` · `Royal Blue` · `Deep Ocean` · `RGB` · `Orange` · `Charcoal` · `Pearl White` · `Midnight Blue` · `Galaxy Purple` · `Cosmic Violet` · `Cotton Candy`

---

## Packs de Iconos

Todos los packs de iconos se cargan bajo demanda. Usa el formato `prefix/nombre-icono` donde sea que se acepte la propiedad `Icon`.

| Pack | Prefijo | Repositorio |
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
-- Ejemplo de uso
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

## Registro de Cambios

### v1.4.0 Revisión General
- Añadir DropdownOutsideWindow
- Corregir Floating Button manager (porque cambiaba la esquina de la UI)
- Refactorización completa del código original de los elementos, simplificado pero manteniendo la función y la UI

### v1.3.0
- Eliminar sistema de idiomas (roto)
- Añadir nuevo elemento `AddAudio`
- Corregir AddImages que no mostraba imágenes en la ventana
- Corregir AddVideo que no mostraba videos en la ventana
- Eliminar soporte de http url para video

### v1.2.9
- Añadir sistema de idiomas (roto)
- Añadir opción para deshabilitar BackgroundImages (funcional, activable/desactivable en el Interface manager)
- Añadir nuevos elementos `AddCode`, `AddImage` (aún no completamente funcional), `AddVideo` (no funciona), `AddDivider`, `AddSpace`, `AddGroup` — se pueden desbloquear con NameSection:AddElementName
- Corregir Auto load en FBM
- Corregir Auto Load en Save manager
- Corregir Outline/UIStroke en el pulgar del slider
- Corregir imposibilidad de cambiar UserInfoSubtitle y UserInfoTitle en UserInfo

### v1.2.0
- Corregido el tema Orange que se mostraba como Ash Gray (bug de clave incorrecta)
- Cambiado el tema predeterminado a AMOLED

### v1.1.0
- Eliminar algunos temas por problemas de lag, pero añadir Temas Personalizados
- Añadido sistema de iconos multi-pack (Solar, Gravity, Lucide, Craft, Geist, SF Symbols)
- Añadido `RegisterCustomTheme` con soporte de `IconColor` e `IconSize`
- Conservados: AMOLED, RGB, Neon Cyber, Neon Purple, Royal Blue, Deep Ocean, Orange, Charcoal, Pearl White, Midnight Blue, Galaxy Purple, Cosmic Violet, Cotton Candy

---

## Licencia

MIT — consulta el [repositorio original de Fluent](https://github.com/dawid-scripts/Fluent) para detalles de la licencia.

---

## Créditos

- [dawid-scripts/Fluent](https://github.com/dawid-scripts/Fluent) — librería original
- [richie0866/remote-spy](https://github.com/richie0866/remote-spy) — activos de UI y código
- [violin-suzutsuki/LinoriaLib](https://github.com/violin-suzutsuki/LinoriaLib) — código de elementos, save manager
- [7kayoh/Acrylic](https://github.com/7kayoh/Acrylic) — puerto de blur acrílico en Lua
- [Latte Softworks & Kotera](https://discord.gg/rMMByr4qas) — bundler

## Colaboradores

- **StyearX** — Desarrollador Principal
- **Era** — Colaborador
- **EvilFishess** — Colaborador
