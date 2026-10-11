class Sqz < Formula
  desc "Universal context intelligence layer for compressing LLM context"
  homepage "https://github.com/ojuschugh1/sqz"
  version "2.1.1"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/ojuschugh1/sqz/releases/download/v2.1.1/sqz-v2.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "319031a7cd0d1b11d2e7ce107b9d30e8d670bae873964c475d8c328b87c8af04"

      resource "sqz-mcp" do
        url "https://github.com/ojuschugh1/sqz/releases/download/v2.1.1/sqz-mcp-v2.1.1-aarch64-apple-darwin.tar.gz"
        sha256 "966b9ad61a36d6133269873a0fb2793df1fd3728313831faf9255e301f896cbb"
      end
    end

    on_intel do
      url "https://github.com/ojuschugh1/sqz/releases/download/v2.1.1/sqz-v2.1.1-x86_64-apple-darwin.tar.gz"
      sha256 "8003de65bd9a1ff206daccd0fc057f7f7e0bd06c0458ae0b900dbe36067de468"

      resource "sqz-mcp" do
        url "https://github.com/ojuschugh1/sqz/releases/download/v2.1.1/sqz-mcp-v2.1.1-x86_64-apple-darwin.tar.gz"
        sha256 "916f93c0a92685cfc1344a03b72a67313159838b414a5f47b1ff294214142f99"
      end
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ojuschugh1/sqz/releases/download/v2.1.1/sqz-v2.1.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "241ca232ca56c68b7724184d2e0720685586bf53064a0dd06ce530e0c78504c2"

      resource "sqz-mcp" do
        url "https://github.com/ojuschugh1/sqz/releases/download/v2.1.1/sqz-mcp-v2.1.1-aarch64-unknown-linux-musl.tar.gz"
        sha256 "dbb857016ed6d2ee73e3e8251e0547d4eee3bae83ce6e60eb56333c29f6ce169"
      end
    end

    on_intel do
      url "https://github.com/ojuschugh1/sqz/releases/download/v2.1.1/sqz-v2.1.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "29abeba6a29b83e2a0b0f642681800e62b3dd0df8991e372c3927b8556d55c65"

      resource "sqz-mcp" do
        url "https://github.com/ojuschugh1/sqz/releases/download/v2.1.1/sqz-mcp-v2.1.1-x86_64-unknown-linux-musl.tar.gz"
        sha256 "52c4b789171483926c9c67b846eea003651794c08ba7c1acd1fb43b941ee995c"
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
