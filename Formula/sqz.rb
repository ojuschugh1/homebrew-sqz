class Sqz < Formula
  desc "Universal context intelligence layer for compressing LLM context"
  homepage "https://github.com/ojuschugh1/sqz"
  version "1.6.0"
  license "Elastic-2.0"

  on_macos do
    on_arm do
      url "https://github.com/ojuschugh1/sqz/releases/download/v1.6.0/sqz-v1.6.0-aarch64-apple-darwin.tar.gz"
      sha256 "3fe2e76b2690613654274ad95ef54629c161144c91135de6dd173212104d7450"

      resource "sqz-mcp" do
        url "https://github.com/ojuschugh1/sqz/releases/download/v1.6.0/sqz-mcp-v1.6.0-aarch64-apple-darwin.tar.gz"
        sha256 "0bcad412a99bd00cf5b977ffa7cb3dff0e9baf868f168be34d67518634ff8b03"
      end
    end

    on_intel do
      url "https://github.com/ojuschugh1/sqz/releases/download/v1.6.0/sqz-v1.6.0-x86_64-apple-darwin.tar.gz"
      sha256 "21388a8b1fc0fead6264be861342cbae1d67be26009f7be9087b6728fdac6fec"

      resource "sqz-mcp" do
        url "https://github.com/ojuschugh1/sqz/releases/download/v1.6.0/sqz-mcp-v1.6.0-x86_64-apple-darwin.tar.gz"
        sha256 "f9f03b07b536050172436a0785824a01c1cfe527e131aa42e05425096b293d46"
      end
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ojuschugh1/sqz/releases/download/v1.6.0/sqz-v1.6.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "a75f0ba2b02d2bf28bb04ebfa0db4a4e497eee23e53c644656c83d8a7a439af1"

      resource "sqz-mcp" do
        url "https://github.com/ojuschugh1/sqz/releases/download/v1.6.0/sqz-mcp-v1.6.0-aarch64-unknown-linux-musl.tar.gz"
        sha256 "3bd08febad99a08707c984b97fbc87809d5772fa5f40e419a8baca49959ca3f2"
      end
    end

    on_intel do
      url "https://github.com/ojuschugh1/sqz/releases/download/v1.6.0/sqz-v1.6.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "09d8d7d82ab541edf05ec5a3ae556aa41fa9f5e156a52332f587d78ea21b74cc"

      resource "sqz-mcp" do
        url "https://github.com/ojuschugh1/sqz/releases/download/v1.6.0/sqz-mcp-v1.6.0-x86_64-unknown-linux-musl.tar.gz"
        sha256 "406f10a240321e929fab62433d614b949d82864cf721181aa30f2db71ae5d968"
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
