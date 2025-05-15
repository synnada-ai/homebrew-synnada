# Formula/synnada-cli.rb
class SynnadaCli < Formula
  desc "Synnada CLI tool"
  homepage "https://github.com/synnada-ai/cli"
  url "https://synnada-ai.github.io/homebrew-synnada/releases/cli/cli-v0.0.28.tar.gz"
  sha256 "b9a6091096c49a78aca55b02fae376130383685ea3faf4856bb7cd67851f4b21"
  license "MIT"

  def install
    # Install the prebuilt CLI binary
    bin.install "cli" => "synnada"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/synnada --version")
  end
end
