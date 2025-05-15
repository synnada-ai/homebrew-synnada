# Formula/synnada-cli.rb
class SynnadaCli < Formula
  desc "Synnada CLI tool"
  homepage "https://github.com/synnada-ai/cli"
  url "https://synnada-ai.github.io/homebrew-synnada/releases/cli/cli-v0.0.24.tar.gz"
  sha256 "3f94eee2426c121c2ef2976e4eaf5b9ee3fce90064ae9a385fcd58808ecd69dd"
  license "MIT"

  def install
    # Install the prebuilt CLI binary
    bin.install "cli" => "synnada"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/synnada --version")
  end
end
