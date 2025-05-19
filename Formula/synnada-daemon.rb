class SynnadaDaemon < Formula
    desc "Synnada daemon"
    homepage "https://github.com/synnada-ai/daemon"
  url "https://synnada-ai.github.io/homebrew-synnada/releases/daemon/synnadad-v0.1.5.zip"
  sha256 "db7fadd8fac2b0690dde444b7f722473271ef45cb38db19e91bd6f4ba9a0dc85"
    license "MIT"
  
    def install
      bin.install "synnadad"
    end
  
    test do
      # e.g. check exit code or version
      assert_match version.to_s, shell_output("#{bin}/synnadad --version")
    end
  end
  