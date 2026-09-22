class Sqz < Formula
  desc "Universal context intelligence layer for compressing LLM context"
  homepage "https://github.com/ojuschugh1/sqz"
  version "1.7.0"
  license "Elastic-2.0"

  on_macos do
    on_arm do
      url "https://github.com/ojuschugh1/sqz/releases/download/v1.7.0/sqz-v1.7.0-aarch64-apple-darwin.tar.gz"
      sha256 "803001a7ba121a51cd48762bdd652acef69f6e54b68025b4a6c011dbc73ad5f6"

      resource "sqz-mcp" do
        url "https://github.com/ojuschugh1/sqz/releases/download/v1.7.0/sqz-mcp-v1.7.0-aarch64-apple-darwin.tar.gz"
        sha256 "7467ad934e63e0dfcd29cfbd9885233cc8bec5f3f704283b5c633d0f1c3aff69"
      end
    end

    on_intel do
      url "https://github.com/ojuschugh1/sqz/releases/download/v1.7.0/sqz-v1.7.0-x86_64-apple-darwin.tar.gz"
      sha256 "b12b94928fea21c14688a22a4ebca2caaeb8bdc4ff03cbba9940179b500683d4"

      resource "sqz-mcp" do
        url "https://github.com/ojuschugh1/sqz/releases/download/v1.7.0/sqz-mcp-v1.7.0-x86_64-apple-darwin.tar.gz"
        sha256 "a7f464114bd246e5b0452ec1925e528ce937127eda32df3daeefc3b5f143090c"
      end
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ojuschugh1/sqz/releases/download/v1.7.0/sqz-v1.7.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "f5c3dfc6b262eff2b3ccd755f3b5463f7f991d31cb5a9f69782d3a41c6f6b60e"

      resource "sqz-mcp" do
        url "https://github.com/ojuschugh1/sqz/releases/download/v1.7.0/sqz-mcp-v1.7.0-aarch64-unknown-linux-musl.tar.gz"
        sha256 "8fb07f9efd621522d9e0f9ddb0e09eeefc9c344d982f9a027f57defa44cbe7e6"
      end
    end

    on_intel do
      url "https://github.com/ojuschugh1/sqz/releases/download/v1.7.0/sqz-v1.7.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d224adc544f72b5fb7b841f3b41340a47dd0cdb7ecdeb27d422cf94429121a52"

      resource "sqz-mcp" do
        url "https://github.com/ojuschugh1/sqz/releases/download/v1.7.0/sqz-mcp-v1.7.0-x86_64-unknown-linux-musl.tar.gz"
        sha256 "e852eaeb1238ee7befd64cf1c93b41e165c5c7b2a17a4be62324de65456d7e92"
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
