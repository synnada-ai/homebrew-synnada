class SynnadaCli < Formula
  desc "Synnada CLI tool"
  homepage "https://github.com/synnada-ai/cli"
  url "https://synnada-ai.github.io/homebrew-synnada/releases/cli/cli-v0.0.21.tar.gz"
  sha256 "b620507312c5e97566a3c6cfaf99144fefc18a0da7d941401dfa0f5f58fb0368"
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