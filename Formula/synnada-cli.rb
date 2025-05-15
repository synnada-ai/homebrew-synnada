class SynnadaCli < Formula
  desc "Synnada CLI tool"
  homepage "https://github.com/synnada-ai/cli"
  url "https://synnada-ai.github.io/homebrew-synnada/releases/cli/cli-v0.0.16.tar.gz"
  sha256 "<NEW_SHA256>"
  license "MIT"

  depends_on "rust" => :build

  def install
    # Build from source
    system "cargo", "build", "--release"
    # The crate’s binary is named `cli`; install it as `synnada`
    bin.install "target/release/cli" => "synnada"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/synnada --version")
  end
end