class Sqz < Formula
  desc "Universal context intelligence layer for compressing LLM context"
  homepage "https://github.com/ojuschugh1/sqz"
  version "1.8.0"
  license "Elastic-2.0"

  on_macos do
    on_arm do
      url "https://github.com/ojuschugh1/sqz/releases/download/v1.8.0/sqz-v1.8.0-aarch64-apple-darwin.tar.gz"
      sha256 "a90a4f4e19bd19e3be27a50db7c77b4e960803d3cabe80e8b98d2fb28b0f5b06"

      resource "sqz-mcp" do
        url "https://github.com/ojuschugh1/sqz/releases/download/v1.8.0/sqz-mcp-v1.8.0-aarch64-apple-darwin.tar.gz"
        sha256 "7261f7f0d206ab12cb8b9ebc32abe8fa8b8647e561a2bd324c185c9535266bbe"
      end
    end

    on_intel do
      url "https://github.com/ojuschugh1/sqz/releases/download/v1.8.0/sqz-v1.8.0-x86_64-apple-darwin.tar.gz"
      sha256 "011c2826649f60306a2277d11e97581cacb9f060afe8b3cfc301d6a95560a4be"

      resource "sqz-mcp" do
        url "https://github.com/ojuschugh1/sqz/releases/download/v1.8.0/sqz-mcp-v1.8.0-x86_64-apple-darwin.tar.gz"
        sha256 "2c8265fa4e31c08e8c814c7b2ae2bc7a932c2e7c019b3d74f189edac6861c3c0"
      end
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ojuschugh1/sqz/releases/download/v1.8.0/sqz-v1.8.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "f60af1f69315fff7e51444393f3ee6319aa49fb3adb61ff438d2051cfee4fafb"

      resource "sqz-mcp" do
        url "https://github.com/ojuschugh1/sqz/releases/download/v1.8.0/sqz-mcp-v1.8.0-aarch64-unknown-linux-musl.tar.gz"
        sha256 "9e300b1717dd1bfd164d8b3f70365cd2151da7a782ad8cd2f9e1cc18b5041e45"
      end
    end

    on_intel do
      url "https://github.com/ojuschugh1/sqz/releases/download/v1.8.0/sqz-v1.8.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "f8347dfdafa854b98135f66f2530d5d3412f41dcd1f52eb378b9b6764271ef93"

      resource "sqz-mcp" do
        url "https://github.com/ojuschugh1/sqz/releases/download/v1.8.0/sqz-mcp-v1.8.0-x86_64-unknown-linux-musl.tar.gz"
        sha256 "10af79ba519d0184940feff98dafdbe969abb8e158ddc2f4ca8dea7f4b98dc3c"
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
