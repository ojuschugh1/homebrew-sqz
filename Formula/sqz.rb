class Sqz < Formula
  desc "Universal context intelligence layer for compressing LLM context"
  homepage "https://github.com/ojuschugh1/sqz"
  version "1.6.1"
  license "Elastic-2.0"

  on_macos do
    on_arm do
      url "https://github.com/ojuschugh1/sqz/releases/download/v1.6.1/sqz-v1.6.1-aarch64-apple-darwin.tar.gz"
      sha256 "48abe3b8ec487a8603435913d1a009e6b1dbe23ea558d9a3556e958dd6038008"

      resource "sqz-mcp" do
        url "https://github.com/ojuschugh1/sqz/releases/download/v1.6.1/sqz-mcp-v1.6.1-aarch64-apple-darwin.tar.gz"
        sha256 "36498cff402a047160712fcead6485506164e071633510d48d438acb1e7db0b0"
      end
    end

    on_intel do
      url "https://github.com/ojuschugh1/sqz/releases/download/v1.6.1/sqz-v1.6.1-x86_64-apple-darwin.tar.gz"
      sha256 "73021aefe944434bdf2c4548005fc0fd7e975a54fce24259d3e74f6859cb009e"

      resource "sqz-mcp" do
        url "https://github.com/ojuschugh1/sqz/releases/download/v1.6.1/sqz-mcp-v1.6.1-x86_64-apple-darwin.tar.gz"
        sha256 "6acf6edeb0f00369eac31824cc5618c8285962a89477f347a50fc934842d4725"
      end
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ojuschugh1/sqz/releases/download/v1.6.1/sqz-v1.6.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "b331b9b2692fe28f6e3fa9ba31e4b6db429f88a88dc68fd573d7a080fc16fd10"

      resource "sqz-mcp" do
        url "https://github.com/ojuschugh1/sqz/releases/download/v1.6.1/sqz-mcp-v1.6.1-aarch64-unknown-linux-musl.tar.gz"
        sha256 "232e436a20167e301412846550ea9498f72db17a5259528a3675e1f7c44615fb"
      end
    end

    on_intel do
      url "https://github.com/ojuschugh1/sqz/releases/download/v1.6.1/sqz-v1.6.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "04779bb4369c5c09efd2074f4462b2bd6ab300ba1af0a2778a7c379776a70f60"

      resource "sqz-mcp" do
        url "https://github.com/ojuschugh1/sqz/releases/download/v1.6.1/sqz-mcp-v1.6.1-x86_64-unknown-linux-musl.tar.gz"
        sha256 "69ad48daf615381c4c0cf68f7cc8a476a8e4b73c7981ce7acd1d76e5c86e5e3d"
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
