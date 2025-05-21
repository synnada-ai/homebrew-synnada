cask "synnada-desktop-electron" do
    version "0.0.0"
    sha256 "<AUTO-BUMPED_SHA256>"
  
    url "https://synnada-ai.github.io/homebrew-synnada/releases/ui/ui-#{version}.zip"
    name "Synnada Desktop"
    desc "Electron Desktop UI for Synnada Notebook"
    homepage "https://github.com/synnada-ai/notebook/tree/main/apps/desktop-electron"
  
    container type: :zip, nested: "Synnada.app"
  
    app "Synnada.app"
  
    zap trash: [
      "~/Library/Application Support/Synnada",
      "~/Library/Preferences/com.synnada.desktop-electron.plist",
    ]
  end
  