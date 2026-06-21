class Sqz < Formula
  desc "Universal context intelligence layer for compressing LLM context"
  homepage "https://github.com/ojuschugh1/sqz"
  version "1.3.0"
  license "Elastic-2.0"

  on_macos do
    on_arm do
      url "https://github.com/ojuschugh1/sqz/releases/download/v1.3.0/sqz-v1.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "83d9b87daa1a0c35f820e17c56c29e5ee73af628e9344755353a09b32869cb35"

      resource "sqz-mcp" do
        url "https://github.com/ojuschugh1/sqz/releases/download/v1.3.0/sqz-mcp-v1.3.0-aarch64-apple-darwin.tar.gz"
        sha256 "2c21a1c79b0a27659f51d48764b0c4017990b25e8876e679d38e976fffa96a81"
      end
    end

    on_intel do
      url "https://github.com/ojuschugh1/sqz/releases/download/v1.3.0/sqz-v1.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "219cf74a4abad064634962e1b8f585cefcfb8d81850a4859bae9b9c3f974463b"

      resource "sqz-mcp" do
        url "https://github.com/ojuschugh1/sqz/releases/download/v1.3.0/sqz-mcp-v1.3.0-x86_64-apple-darwin.tar.gz"
        sha256 "2f3f9e8e710a12fb32f936f6fbda79a694caa0a6e14323f550e767eb4eb779f5"
      end
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ojuschugh1/sqz/releases/download/v1.3.0/sqz-v1.3.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "f19cd9cdf2f47e5d5c39c13e53ec51dcfccac321fac0336970daafe6afa920c0"

      resource "sqz-mcp" do
        url "https://github.com/ojuschugh1/sqz/releases/download/v1.3.0/sqz-mcp-v1.3.0-aarch64-unknown-linux-musl.tar.gz"
        sha256 "c71c6a4e56ff2490fb69bb65fb86426673b0d491e06c5fdb7220eed454e4dafb"
      end
    end

    on_intel do
      url "https://github.com/ojuschugh1/sqz/releases/download/v1.3.0/sqz-v1.3.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "bff830e68d46239f865a7156bf3c500764a7592ebc5d9bd03c0128ef54aabf1a"

      resource "sqz-mcp" do
        url "https://github.com/ojuschugh1/sqz/releases/download/v1.3.0/sqz-mcp-v1.3.0-x86_64-unknown-linux-musl.tar.gz"
        sha256 "916b3090d47165aff36241ab5c1ed2a57dea30eea100f52dda9d58b589c8be30"
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
