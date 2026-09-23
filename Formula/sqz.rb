class Sqz < Formula
  desc "Universal context intelligence layer for compressing LLM context"
  homepage "https://github.com/ojuschugh1/sqz"
  version "1.9.0"
  license "Elastic-2.0"

  on_macos do
    on_arm do
      url "https://github.com/ojuschugh1/sqz/releases/download/v1.9.0/sqz-v1.9.0-aarch64-apple-darwin.tar.gz"
      sha256 "0ea7b5271d1ed75d88c4231805bef148faa71e80ec8888603f4f15311c7f04b5"

      resource "sqz-mcp" do
        url "https://github.com/ojuschugh1/sqz/releases/download/v1.9.0/sqz-mcp-v1.9.0-aarch64-apple-darwin.tar.gz"
        sha256 "8d4c8a0b6b41f4999a7b81cc80e3d18504d6599ce957e30d28e5906c49dba7f9"
      end
    end

    on_intel do
      url "https://github.com/ojuschugh1/sqz/releases/download/v1.9.0/sqz-v1.9.0-x86_64-apple-darwin.tar.gz"
      sha256 "7ff4fb2edfedbe2a3141fafe265e5e2b59267586ab219f1c77c923663b38edb5"

      resource "sqz-mcp" do
        url "https://github.com/ojuschugh1/sqz/releases/download/v1.9.0/sqz-mcp-v1.9.0-x86_64-apple-darwin.tar.gz"
        sha256 "082b7f4388ec368b0fff14c8ac7f59c7e996aede8fcbb1d38f99bcf55857ed93"
      end
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ojuschugh1/sqz/releases/download/v1.9.0/sqz-v1.9.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "16a0f547fb4b2c123adbe1b3350821c73aee93361b63b85589b6e945251a87ef"

      resource "sqz-mcp" do
        url "https://github.com/ojuschugh1/sqz/releases/download/v1.9.0/sqz-mcp-v1.9.0-aarch64-unknown-linux-musl.tar.gz"
        sha256 "6391ce10b14dc038fdcf18153ba47f2de7ab86ff5c9ae842f25ac7fea8f05e8b"
      end
    end

    on_intel do
      url "https://github.com/ojuschugh1/sqz/releases/download/v1.9.0/sqz-v1.9.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "8e706174d84203cae40deef6bd21dc4d75f3ef656ae17b4e609f59292bc4b582"

      resource "sqz-mcp" do
        url "https://github.com/ojuschugh1/sqz/releases/download/v1.9.0/sqz-mcp-v1.9.0-x86_64-unknown-linux-musl.tar.gz"
        sha256 "2106a53de21e79bb1b0b4628f953f4759e3e04122e10e3d11445a802f12e6780"
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
