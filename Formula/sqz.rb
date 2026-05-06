class Sqz < Formula
  desc "Universal context intelligence layer for compressing LLM context"
  homepage "https://github.com/ojuschugh1/sqz"
  version "1.0.9"
  license "Elastic-2.0"

  on_macos do
    on_arm do
      url "https://github.com/ojuschugh1/sqz/releases/download/v1.0.9/sqz-v1.0.9-aarch64-apple-darwin.tar.gz"
      sha256 "59bb4186666a60918efff67c9f588edf90663b46e331f6c6f6611716e59ec97c"

      resource "sqz-mcp" do
        url "https://github.com/ojuschugh1/sqz/releases/download/v1.0.9/sqz-mcp-v1.0.9-aarch64-apple-darwin.tar.gz"
        sha256 "352f7c264786bb9785ad62a9faca2a20c21c86ce52330f80936122a897572756"
      end
    end

    on_intel do
      url "https://github.com/ojuschugh1/sqz/releases/download/v1.0.9/sqz-v1.0.9-x86_64-apple-darwin.tar.gz"
      sha256 "313e0c5daf41a3bf42d10a6648a843967b140f28006832acc7352de19e841926"

      resource "sqz-mcp" do
        url "https://github.com/ojuschugh1/sqz/releases/download/v1.0.9/sqz-mcp-v1.0.9-x86_64-apple-darwin.tar.gz"
        sha256 "10afcfffcf787e539ce7fafe1b74acb6d916cca4b8ff8d3cac2caba8e47b2f1a"
      end
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ojuschugh1/sqz/releases/download/v1.0.9/sqz-v1.0.9-aarch64-unknown-linux-musl.tar.gz"
      sha256 "7fe10f76dca78d9d7e6d88e2c0f1ffc24b719a75f1480094f2895240bdd8155f"

      resource "sqz-mcp" do
        url "https://github.com/ojuschugh1/sqz/releases/download/v1.0.9/sqz-mcp-v1.0.9-aarch64-unknown-linux-musl.tar.gz"
        sha256 "06261e969618f7ce74e1bd9fd289b5812502d8769e2181123950fa8c76e45979"
      end
    end

    on_intel do
      url "https://github.com/ojuschugh1/sqz/releases/download/v1.0.9/sqz-v1.0.9-x86_64-unknown-linux-musl.tar.gz"
      sha256 "27fb072781922fad45bad91cadaeb6b4a4a40546a36abdef01588ec6877e0527"

      resource "sqz-mcp" do
        url "https://github.com/ojuschugh1/sqz/releases/download/v1.0.9/sqz-mcp-v1.0.9-x86_64-unknown-linux-musl.tar.gz"
        sha256 "c99c0c3c4f1b102e6a5bf4ebf1278b537dc3d97e84f787fd7f6761eea56eb8e5"
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
