class Sqz < Formula
  desc "Universal context intelligence layer for compressing LLM context"
  homepage "https://github.com/ojuschugh1/sqz"
  version "1.5.0"
  license "Elastic-2.0"

  on_macos do
    on_arm do
      url "https://github.com/ojuschugh1/sqz/releases/download/v1.5.0/sqz-v1.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "445488733d9ac91c1972d04ebd25f0ec91ecac6c7af1f0308db6eff8008097ec"

      resource "sqz-mcp" do
        url "https://github.com/ojuschugh1/sqz/releases/download/v1.5.0/sqz-mcp-v1.5.0-aarch64-apple-darwin.tar.gz"
        sha256 "83557955104924031261fe3e90637c5a5c556bed29bb1db403d07cc938a39bd7"
      end
    end

    on_intel do
      url "https://github.com/ojuschugh1/sqz/releases/download/v1.5.0/sqz-v1.5.0-x86_64-apple-darwin.tar.gz"
      sha256 "adedab2e02852bf702cffc43855cd8a6c96aff3d91ed59015a481268ceeab30e"

      resource "sqz-mcp" do
        url "https://github.com/ojuschugh1/sqz/releases/download/v1.5.0/sqz-mcp-v1.5.0-x86_64-apple-darwin.tar.gz"
        sha256 "947d014e38cd466bf0a39b33e619c891f0b1429e99146f31cdf88efb2ed593c2"
      end
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ojuschugh1/sqz/releases/download/v1.5.0/sqz-v1.5.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "a9a9f16d22b1c85543340a34dba29154d239121618124d7b3e49bfc510b35a2f"

      resource "sqz-mcp" do
        url "https://github.com/ojuschugh1/sqz/releases/download/v1.5.0/sqz-mcp-v1.5.0-aarch64-unknown-linux-musl.tar.gz"
        sha256 "15eba7b992be5b657ab332ee08ea43115d652571366bb7777e3a9eb6b1a7ea67"
      end
    end

    on_intel do
      url "https://github.com/ojuschugh1/sqz/releases/download/v1.5.0/sqz-v1.5.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "0b7a80254761ba173a6046dee7d142146e4aae879029ac3bd47a647d2051b3c5"

      resource "sqz-mcp" do
        url "https://github.com/ojuschugh1/sqz/releases/download/v1.5.0/sqz-mcp-v1.5.0-x86_64-unknown-linux-musl.tar.gz"
        sha256 "aecb805a4ff43e5c5990c988f1ae5221008121c9efccf1f1f8dba2438bc6244a"
      end
    end
  end

  def install
    bin.install "sqz"

    resource("sqz-mcp").stage do
      bin.install "sqz-mcp"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sqz --version")
    assert_predicate bin/"sqz-mcp", :executable?
  end
end
