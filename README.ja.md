<img src="Assets/logodark.png#gh-dark-mode-only" alt="fluent">
<img src="Assets/logolight.png#gh-light-mode-only" alt="fluent">
<img src="Assets/Theme 2.png" alt="fluent">
<img src="Assets/Theme1.png" alt="fluent">


# FluentModded

Roblox向けUIライブラリ [Fluent](https://github.com/dawid-scripts/Fluent) の改造版。追加テーマ、マルチアイコンパック対応、使い勝手の向上などを実装しています。

---

## クイックスタート

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

## 要素

すべての要素は `Tab:AddElementType(id, config)` で追加します。

| メソッド | 説明 |
|---|---|
| `AddToggle` | オン/オフスイッチ |
| `AddSlider` | 数値範囲スライダー |
| `AddInput` | テキスト入力ボックス |
| `AddDropdown` | 単一または複数選択ドロップダウン |
| `AddColorpicker` | 透明度付きカラーピッカー |
| `AddKeybind` | キーボード/マウスキーバインド |
| `AddButton` | クリック可能なボタン |
| `AddParagraph` | 読み取り専用テキストブロック |
| `AddCode` | コピーボタン |
| `AddSpace` | スペース |
| `AddGroup` | 他の要素をグループ化 |
| `Addimage` | ウィンドウ内画像、HttpGetおよびrbxassetid対応 |
| `AddDivider` | 区切り線 |
| `AddVideo` | ウィンドウ内動画、rbxassetid対応 |
| `AddAudio` | ウィンドウ内音声、HttpGet / http url および rbxassetid 対応 |

---

## カスタムテーマ

`CreateWindow` を呼び出す前にカスタムテーマを登録してください。

```lua
Fluent:RegisterCustomTheme("MyTheme", {
    Accent      = Color3.fromRGB(96, 205, 255),
    AcrylicMain = Color3.fromRGB(20, 20, 30),
    Text        = Color3.fromRGB(240, 240, 255),
    -- ... (全フィールドは組み込みテーマを参照)
    IconColor   = Color3.fromRGB(96, 205, 255), -- 全アイコンの色を変更
    IconSize    = 18,                            -- アイコンサイズ（px）
})

-- 実行中にテーマを切り替える
Fluent:SetTheme("MyTheme")
```

### 組み込みテーマ

`AMOLED` · `Ash Gray` · `Blood Red` · `Cyanic` · `Amber Glow` · `Deep Violet` · `Neon Cyber` · `Neon Purple` · `Royal Blue` · `Deep Ocean` · `RGB` · `Orange` · `Charcoal` · `Pearl White` · `Midnight Blue` · `Galaxy Purple` · `Cosmic Violet` · `Cotton Candy`

---

## アイコンパック

すべてのアイコンパックはオンデマンドで読み込まれます。`Icon` プロパティが使用できる場所では `prefix/アイコン名` の形式を使用してください。

| パック | プレフィックス | リポジトリ |
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
-- 使用例
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

## 変更履歴

### v1.4.0 オーバーホール
- DropdownOutsideWindow を追加
- Floating Button manager を修正（UIコーナーを変更する問題）
- コードを全面的に刷新。機能とUIを維持しながら簡略化

### v1.3.0
- 言語システムを削除（不具合あり）
- 新要素 `AddAudio` を追加
- AddImages がウィンドウ内で画像を表示しない問題を修正
- AddVideo がウィンドウ内で動画を表示しない問題を修正
- 動画のhttp url対応を削除

### v1.2.9
- 言語システムを追加（不具合あり）
- BackgroundImages の無効化を追加（Interface managerで有効/無効切り替え可能）
- 新要素 `AddCode`、`AddImage`（未完全）、`AddVideo`（動作しない）、`AddDivider`、`AddSpace`、`AddGroup` を追加 — NameSection:AddElementName で解放可能
- FBM の自動読み込みを修正
- Save manager の自動読み込みを修正
- スライダーサムのOutline/UIStrokeを修正
- UserInfo で UserInfoSubtitle と UserInfoTitle が変更できない問題を修正

### v1.2.0
- Orangeテーマが Ash Gray として表示されるバグを修正（キーの不一致）
- デフォルトテーマを AMOLED に変更

### v1.1.0
- ラグ問題のためいくつかのテーマを削除、カスタムテーマを追加
- マルチパックアイコンシステムを追加（Solar、Gravity、Lucide、Craft、Geist、SF Symbols）
- `IconColor` および `IconSize` 対応の `RegisterCustomTheme` を追加
- 維持: AMOLED、RGB、Neon Cyber、Neon Purple、Royal Blue、Deep Ocean、Orange、Charcoal、Pearl White、Midnight Blue、Galaxy Purple、Cosmic Violet、Cotton Candy

---

## ライセンス

MIT — ライセンスの詳細については元の [Fluent リポジトリ](https://github.com/dawid-scripts/Fluent) をご覧ください。

---

## クレジット

- [dawid-scripts/Fluent](https://github.com/dawid-scripts/Fluent) — オリジナルライブラリ
- [richie0866/remote-spy](https://github.com/richie0866/remote-spy) — UIアセットとコード
- [violin-suzutsuki/LinoriaLib](https://github.com/violin-suzutsuki/LinoriaLib) — 要素コード、セーブマネージャー
- [7kayoh/Acrylic](https://github.com/7kayoh/Acrylic) — Lua アクリルブラーポート
- [Latte Softworks & Kotera](https://discord.gg/rMMByr4qas) — バンドラー

## コントリビューター

- **StyearX** — メイン開発者
- **Era** — コントリビューター
- **EvilFishess** — コントリビューター
