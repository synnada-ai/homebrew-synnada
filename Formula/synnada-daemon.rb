class SynnadaDaemon < Formula
    desc "Synnada daemon"
    homepage "https://github.com/synnada-ai/daemon"
    url "https://synnada-ai.github.io/homebrew-synnada/releases/daemon/synnadad-v0.0.1.zip"
    sha256 "<AUTO-BUMPED_SHA256>"
    license "MIT"
  
    def install
      bin.install "synnadad"
    end
  
    test do
      # e.g. check exit code or version
      assert_match version.to_s, shell_output("#{bin}/synnadad --version")
    end
  end
  