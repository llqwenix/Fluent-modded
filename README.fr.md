<img src="Assets/logodark.png#gh-dark-mode-only" alt="fluent">
<img src="Assets/logolight.png#gh-light-mode-only" alt="fluent">
<img src="Assets/Theme 2.png" alt="fluent">
<img src="Assets/Theme1.png" alt="fluent">


# FluentModded

Une version modifiée de la bibliothèque UI [Fluent](https://github.com/dawid-scripts/Fluent) pour Roblox, enrichie de thèmes supplémentaires, d'un support multi-pack d'icônes et d'améliorations pratiques.

---

## Démarrage Rapide

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

## Éléments

Tous les éléments sont ajoutés via `Tab:AddElementType(id, config)`.

| Méthode | Description |
|---|---|
| `AddToggle` | Interrupteur on/off |
| `AddSlider` | Curseur de plage numérique |
| `AddInput` | Zone de saisie de texte |
| `AddDropdown` | Liste déroulante à sélection simple ou multiple |
| `AddColorpicker` | Sélecteur de couleur avec transparence |
| `AddKeybind` | Raccourci clavier/souris |
| `AddButton` | Bouton cliquable |
| `AddParagraph` | Bloc de texte en lecture seule |
| `AddCode` | Bouton de copie |
| `AddSpace` | Espace |
| `AddGroup` | Grouper d'autres éléments |
| `Addimage` | Image dans la fenêtre, supporte HttpGet et rbxassetid |
| `AddDivider` | Séparateur |
| `AddVideo` | Vidéo dans la fenêtre, supporte rbxassetid |
| `AddAudio` | Audio dans la fenêtre, supporte HttpGet / http url et rbxassetid |

---

## Thèmes Personnalisés

Enregistrez un thème personnalisé avant d'appeler `CreateWindow`.

```lua
Fluent:RegisterCustomTheme("MyTheme", {
    Accent      = Color3.fromRGB(96, 205, 255),
    AcrylicMain = Color3.fromRGB(20, 20, 30),
    Text        = Color3.fromRGB(240, 240, 255),
    -- ... (voir les thèmes intégrés pour tous les champs)
    IconColor   = Color3.fromRGB(96, 205, 255), -- teinte toutes les icônes
    IconSize    = 18,                            -- taille des icônes en px
})

-- Changer de thème à l'exécution
Fluent:SetTheme("MyTheme")
```

### Thèmes Intégrés

`AMOLED` · `Ash Gray` · `Blood Red` · `Cyanic` · `Amber Glow` · `Deep Violet` · `Neon Cyber` · `Neon Purple` · `Royal Blue` · `Deep Ocean` · `RGB` · `Orange` · `Charcoal` · `Pearl White` · `Midnight Blue` · `Galaxy Purple` · `Cosmic Violet` · `Cotton Candy`

---

## Packs d'Icônes

Tous les packs d'icônes sont chargés à la demande. Utilisez le format `préfixe/nom-icône` partout où une propriété `Icon` est acceptée.

| Pack | Préfixe | Dépôt |
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
-- Exemple d'utilisation
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

## Journal des Modifications

### v1.4.0 Refonte
- Ajout de DropdownOutsideWindow
- Correction du Floating Button manager (modifiait le coin de l'UI)
- Refactorisation complète du code original des éléments, simplifié tout en conservant la fonction et l'interface

### v1.3.0
- Suppression du système de langue (défaillant)
- Ajout du nouvel élément `AddAudio`
- Correction de AddImages qui n'affichait pas les images dans la fenêtre
- Correction de AddVideo qui n'affichait pas les vidéos dans la fenêtre
- Suppression du support des url http pour la vidéo

### v1.2.9
- Ajout du système de langue (défaillant)
- Ajout de la désactivation des BackgroundImages (pleinement fonctionnel, activable/désactivable dans l'Interface manager)
- Ajout des nouveaux éléments `AddCode`, `AddImage` (pas encore entièrement fonctionnel), `AddVideo` (ne fonctionne pas), `AddDivider`, `AddSpace`, `AddGroup` — débloquable avec NameSection:AddElementName
- Correction du chargement automatique dans FBM
- Correction du chargement automatique dans Save manager
- Correction du Outline/UIStroke sur le curseur du slider
- Correction de l'impossibilité de modifier UserInfoSubtitle et UserInfoTitle dans UserInfo

### v1.2.0
- Correction du thème Orange affiché comme Ash Gray (bug de clé incorrecte)
- Thème par défaut changé en AMOLED

### v1.1.0
- Suppression de certains thèmes en raison de problèmes de lag, mais ajout des thèmes personnalisés
- Ajout du système d'icônes multi-pack (Solar, Gravity, Lucide, Craft, Geist, SF Symbols)
- Ajout de `RegisterCustomTheme` avec support `IconColor` et `IconSize`
- Conservés : AMOLED, RGB, Neon Cyber, Neon Purple, Royal Blue, Deep Ocean, Orange, Charcoal, Pearl White, Midnight Blue, Galaxy Purple, Cosmic Violet, Cotton Candy

---

## Licence

MIT — voir le [dépôt Fluent original](https://github.com/dawid-scripts/Fluent) pour les détails de la licence.

---

## Crédits

- [dawid-scripts/Fluent](https://github.com/dawid-scripts/Fluent) — bibliothèque originale
- [richie0866/remote-spy](https://github.com/richie0866/remote-spy) — assets UI et code
- [violin-suzutsuki/LinoriaLib](https://github.com/violin-suzutsuki/LinoriaLib) — code des éléments, save manager
- [7kayoh/Acrylic](https://github.com/7kayoh/Acrylic) — port du flou acrylique en Lua
- [Latte Softworks & Kotera](https://discord.gg/rMMByr4qas) — bundler

## Contributeurs

- **StyearX** — Développeur Principal
- **Era** — Contributeur
- **EvilFishess** — Contributeur
