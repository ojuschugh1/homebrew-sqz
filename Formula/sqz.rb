class Sqz < Formula
  desc "Universal context intelligence layer for compressing LLM context"
  homepage "https://github.com/ojuschugh1/sqz"
  version "1.4.0"
  license "Elastic-2.0"

  on_macos do
    on_arm do
      url "https://github.com/ojuschugh1/sqz/releases/download/v1.4.0/sqz-v1.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "e06eb74b4c53586c2c48e44847fd4c1120973248401c33d08e448e642938f8c6"

      resource "sqz-mcp" do
        url "https://github.com/ojuschugh1/sqz/releases/download/v1.4.0/sqz-mcp-v1.4.0-aarch64-apple-darwin.tar.gz"
        sha256 "f299f757e3c84917b8023a2c4fb0e71b0342707876afa05bf460e8f64104e2ba"
      end
    end

    on_intel do
      url "https://github.com/ojuschugh1/sqz/releases/download/v1.4.0/sqz-v1.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "e1d4d3a04d391b04c94f5d7a93fa6bc0696590e7f50b4a094de215e44b48cf41"

      resource "sqz-mcp" do
        url "https://github.com/ojuschugh1/sqz/releases/download/v1.4.0/sqz-mcp-v1.4.0-x86_64-apple-darwin.tar.gz"
        sha256 "4c9262cc5ca0884a3284a990f889d24a8a0f99bdb7da4907c037cbbf6dd8b383"
      end
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ojuschugh1/sqz/releases/download/v1.4.0/sqz-v1.4.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "44b4b8aa47f6b69e7f94d7ee730c4515171e0813b2a7003b2e4ea26ca7553d53"

      resource "sqz-mcp" do
        url "https://github.com/ojuschugh1/sqz/releases/download/v1.4.0/sqz-mcp-v1.4.0-aarch64-unknown-linux-musl.tar.gz"
        sha256 "e505a7fd34367d3959f8ca99eac6f5f3646425800f4dde2727603d49d6c30357"
      end
    end

    on_intel do
      url "https://github.com/ojuschugh1/sqz/releases/download/v1.4.0/sqz-v1.4.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "9ece81b11c04184b4585c6b530065e0f8388d749b2ebfcf8622e1b1ca48789f7"

      resource "sqz-mcp" do
        url "https://github.com/ojuschugh1/sqz/releases/download/v1.4.0/sqz-mcp-v1.4.0-x86_64-unknown-linux-musl.tar.gz"
        sha256 "4ab256408e2a72844650896b7e27fa3305b957497344620efb3ffd567366776d"
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
