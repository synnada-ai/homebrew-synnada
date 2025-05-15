class SynnadaCli < Formula
  desc "Synnada CLI tool"
  homepage "https://github.com/synnada-ai/cli"
  url "https://synnada-ai.github.io/homebrew-synnada/releases/cli/cli-v0.0.24.tar.gz"
  sha256 "3f94eee2426c121c2ef2976e4eaf5b9ee3fce90064ae9a385fcd58808ecd69dd"
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