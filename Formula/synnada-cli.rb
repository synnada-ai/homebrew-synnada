# Formula/synnada-cli.rb
class SynnadaCli < Formula
  desc "Synnada CLI tool"
  homepage "https://github.com/synnada-ai/cli"
  url "https://synnada-ai.github.io/homebrew-synnada/releases/cli/cli-v0.0.35.zip"
  sha256 "de279d3be6054f692884ddcc2dfe75cb8c408ee62406d7df470a4fa83788f1cd"
  license "MIT"

  def install
    # Install the prebuilt CLI binary
    bin.install "cli" => "synnada"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/synnada --version")
  end
end
