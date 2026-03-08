class Agency < Formula
  desc "Agency CLI runtime host bootstrap"
  homepage "https://github.com/synnada-ai/agency-cli-dist"
  url "https://github.com/synnada-ai/agency-cli-dist/releases/download/v0.1.0-rc3/install.sh"
  sha256 "b50d484197f039e596544bbd9739b41e97a8d20fd1dcc5741168e03565a2e07e"
  license "Proprietary"

  depends_on "python@3.14"

  def install
    (bin/"agency").write <<~BASH
      #!/usr/bin/env bash
      set -euo pipefail

      brew_python="#{Formula["python@3.14"].opt_bin}/python3.14"
      if [ -x "$brew_python" ]; then
        PYTHON_BIN="${PYTHON_BIN:-$brew_python}"
      else
        PYTHON_BIN="${PYTHON_BIN:-python3}"
      fi
      user_agency="$("$PYTHON_BIN" - <<'PY'
      import site
      from pathlib import Path
      print(Path(site.getuserbase()) / "bin" / "agency")
      PY
      )"

      if [ -x "$user_agency" ]; then
        exec "$user_agency" "$@"
      fi

      export AGENCY_VERSION="${AGENCY_VERSION:-v0.1.0-rc3}"
      curl -fsSL "https://github.com/synnada-ai/agency-cli-dist/releases/download/${AGENCY_VERSION}/install.sh" | \
        AGENCY_VERSION="$AGENCY_VERSION" PYTHON_BIN="$PYTHON_BIN" bash

      if [ -x "$user_agency" ]; then
        exec "$user_agency" "$@"
      fi

      echo "agency was installed but executable not found at: $user_agency" >&2
      exit 1
    BASH

    chmod 0755, bin/"agency"
  end

  test do
    assert_match "agency-cli-dist", (bin/"agency").read
  end
end
