class Agency < Formula
  include Language::Python::Virtualenv

  desc "Agency CLI runtime host"
  homepage "https://github.com/synnada-ai/agency-cli-dist"
  url "https://github.com/synnada-ai/agency-cli-dist/releases/download/v0.1.0-rc2/agency_cli-0.1.0-py3-none-any.whl"
  sha256 "5a01ba2060d685ea12fca3092a20305203545ac244555da00e85275951ee5ca0"
  license "Proprietary"

  depends_on "python@3.14"

  def install
    wheel = buildpath/"agency_cli-0.1.0-py3-none-any.whl"
    cp cached_download, wheel

    venv = virtualenv_create(libexec, Formula["python@3.14"].opt_bin/"python3.14")
    system venv.root/"bin/pip", "install", wheel
    bin.install_symlink libexec/"bin/agency"
  end

  test do
    assert_match "Usage: agency", shell_output("#{bin}/agency --help")
  end
end
