class SynnadaCli < Formula
  desc "Synnada CLI tool"
  homepage "https://github.com/synnada-ai/synnada-cli"
  url "https://synnada-ai.github.io/homebrew-synnada/releases/cli/cli-v0.0.16.tar.gz"
  sha256 "1b8bcfbf694333d5a9a068406e5df3feed5d259fc8797e410bf7c9d9c6b3d440"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: ".")
  end

  test do
    assert_match "synnada-cli", shell_output("#{bin}/synnada-cli --version")
  end
end