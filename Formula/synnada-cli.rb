# Formula/synnada-cli.rb
class SynnadaCli < Formula
  desc "Synnada CLI tool"
  homepage "https://github.com/synnada-ai/cli"
  url "https://synnada-ai.github.io/homebrew-synnada/releases/cli/cli-v#{version}.zip"
  sha256 "<AUTO-BUMPED_SHA256>"
  license "MIT"

  def install
    # Install the prebuilt CLI binary
    bin.install "cli" => "synnada"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/synnada --version")
  end
end
