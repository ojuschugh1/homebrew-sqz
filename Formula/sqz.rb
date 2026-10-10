class Sqz < Formula
  desc "Universal context intelligence layer for compressing LLM context"
  homepage "https://github.com/ojuschugh1/sqz"
  version "2.0.0"
  license "Elastic-2.0"

  on_macos do
    on_arm do
      url "https://github.com/ojuschugh1/sqz/releases/download/v2.0.0/sqz-v2.0.0-aarch64-apple-darwin.tar.gz"
      sha256 "dda3677a0c85caedfc70fac5b31de8f2257763b0828491bb82d51ab41adbdeed"

      resource "sqz-mcp" do
        url "https://github.com/ojuschugh1/sqz/releases/download/v2.0.0/sqz-mcp-v2.0.0-aarch64-apple-darwin.tar.gz"
        sha256 "1c7186a4577c42c9fc8a5b65a53deb5855409d5177cb38a678dfe37185707f9a"
      end
    end

    on_intel do
      url "https://github.com/ojuschugh1/sqz/releases/download/v2.0.0/sqz-v2.0.0-x86_64-apple-darwin.tar.gz"
      sha256 "085219745bf56b1199234b493ec7e4ee46bb4977af834b7cc6e2fc406712bfde"

      resource "sqz-mcp" do
        url "https://github.com/ojuschugh1/sqz/releases/download/v2.0.0/sqz-mcp-v2.0.0-x86_64-apple-darwin.tar.gz"
        sha256 "9bccf7ee8faf19ed89f3b96d5b255a5e12fc0d4a55cabb02c05bbd493dbb3686"
      end
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ojuschugh1/sqz/releases/download/v2.0.0/sqz-v2.0.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "728413fce6f1915b064865649483f9917ae7ec92f8453216bd8db9291d0a0302"

      resource "sqz-mcp" do
        url "https://github.com/ojuschugh1/sqz/releases/download/v2.0.0/sqz-mcp-v2.0.0-aarch64-unknown-linux-musl.tar.gz"
        sha256 "a9e08d610de93d4591f4f33c55addd60880e9a4d689f741f3094fbb047734264"
      end
    end

    on_intel do
      url "https://github.com/ojuschugh1/sqz/releases/download/v2.0.0/sqz-v2.0.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "6ecf184113bace3f9535ca2ad4216d29eefd8d034ee12fd08455f25fafade1b0"

      resource "sqz-mcp" do
        url "https://github.com/ojuschugh1/sqz/releases/download/v2.0.0/sqz-mcp-v2.0.0-x86_64-unknown-linux-musl.tar.gz"
        sha256 "9520b4c633b80fe63d48c80b6145034c4473b7a7999c24af4ec3e66325f48e99"
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
