# Formula/synnada-cli.rb
class SynnadaCli < Formula
  desc "Synnada CLI tool"
  homepage "https://github.com/synnada-ai/cli"
  url "https://synnada-ai.github.io/homebrew-synnada/releases/cli/cli-v0.0.31.zip"
  sha256 "223a5ca772839a1e38f0ad6fa67706a62439c89819efd6e235f6023d233ab61a"
  license "MIT"

  def install
    # Install the prebuilt CLI binary
    bin.install "cli" => "synnada"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/synnada --version")
  end
end
