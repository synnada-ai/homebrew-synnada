class SynnadaDaemon < Formula
    desc "Synnada daemon"
    homepage "https://github.com/synnada-ai/daemon"
  url "https://synnada-ai.github.io/homebrew-synnada/releases/daemon/synnadad-v0.1.7.zip"
  sha256 "9c576cdf1fc6ba6030479cf63a70429aa9705a9f6ac485f0da4ed9dd4f38256a"
    license "MIT"
  
    # Runtime dependencies:
    depends_on "python@3.11"
    depends_on "librdkafka"
  
    def install
      bin.install "synnadad"
  
      # Rewrite the embedded Python.framework path to point at Homebrew's version
      python_framework = "#{Formula["python@3.11"].opt_prefix}/Frameworks/Python.framework/Versions/3.11/Python"
      odie "Missing Homebrew Python framework!" unless File.exist?(python_framework)
  
      system "install_name_tool", "-change",
             "/Library/Frameworks/Python.framework/Versions/3.13/Python",
             python_framework,
             bin/"synnadad"
    end
  
    test do
      assert_match version.to_s, shell_output("#{bin}/synnadad --version")
    end
  end
  