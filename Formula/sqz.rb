class Sqz < Formula
  desc "Universal context intelligence layer for compressing LLM context"
  homepage "https://github.com/ojuschugh1/sqz"
  version "2.1.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/ojuschugh1/sqz/releases/download/v2.1.0/sqz-v2.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "514a0f70b1a3854b884ba960b95f4111b44432079a0e21c0ebd9d64c8e53ceb1"

      resource "sqz-mcp" do
        url "https://github.com/ojuschugh1/sqz/releases/download/v2.1.0/sqz-mcp-v2.1.0-aarch64-apple-darwin.tar.gz"
        sha256 "3b6882d754177d45e02859fbdaee96ea44c718374d631f3acaaee9c569890317"
      end
    end

    on_intel do
      url "https://github.com/ojuschugh1/sqz/releases/download/v2.1.0/sqz-v2.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "a0f536937660edafac6dd775b9148f1326d6e50f9aa75bd96c8ef19176e3e0bb"

      resource "sqz-mcp" do
        url "https://github.com/ojuschugh1/sqz/releases/download/v2.1.0/sqz-mcp-v2.1.0-x86_64-apple-darwin.tar.gz"
        sha256 "5fc73bdb96eef9063f9cecf646eec549a6aa36de7a53f0a232536b53b753c2f4"
      end
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ojuschugh1/sqz/releases/download/v2.1.0/sqz-v2.1.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "e40024d5a4158a1990ba29030e42e5abcac6f310a5bea754c97462986944046a"

      resource "sqz-mcp" do
        url "https://github.com/ojuschugh1/sqz/releases/download/v2.1.0/sqz-mcp-v2.1.0-aarch64-unknown-linux-musl.tar.gz"
        sha256 "956c0bfbfbae9bb47141ea496bb32a27ffb0637644652fb4a451865f574e5ec5"
      end
    end

    on_intel do
      url "https://github.com/ojuschugh1/sqz/releases/download/v2.1.0/sqz-v2.1.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "8738c78c6ad25f4ad2f38ba61dee0dfaf2f03cc582525c801c804ec1bead20ea"

      resource "sqz-mcp" do
        url "https://github.com/ojuschugh1/sqz/releases/download/v2.1.0/sqz-mcp-v2.1.0-x86_64-unknown-linux-musl.tar.gz"
        sha256 "83ed93e6cddcabf1eb388cbc2b4a67cb0c733d431af69a473fccb424898a643c"
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
