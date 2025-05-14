class SynnadaCli < Formula
    desc "Synnada CLI tool"
    homepage "https://github.com/your-org/synnada-cli"
    url "https://github.com/your-org/synnada-cli/archive/v0.1.0.tar.gz"
    sha256 "<INSERT_SHA256>"
    license "MIT"
  
    depends_on "rust" => :build
  
    def install
      system "cargo", "install", *std_cargo_args(path: ".")
    end
  
    test do
      assert_match "synnada-cli", shell_output("#{bin}/synnada-cli --version")
    end
  end
  