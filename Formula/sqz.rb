class Sqz < Formula
  desc "Universal context intelligence layer for compressing LLM context"
  homepage "https://github.com/ojuschugh1/sqz"
  version "2.2.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/ojuschugh1/sqz/releases/download/v2.2.0/sqz-v2.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "1218753f8c93c9a1f35a51b335fc0fd3fb181dda0977a4012454cdc990a36fb5"

      resource "sqz-mcp" do
        url "https://github.com/ojuschugh1/sqz/releases/download/v2.2.0/sqz-mcp-v2.2.0-aarch64-apple-darwin.tar.gz"
        sha256 "6f13b062796815b2057c805602ae52c6f6db78dddd50e2a3ecda4701438ce04e"
      end
    end

    on_intel do
      url "https://github.com/ojuschugh1/sqz/releases/download/v2.2.0/sqz-v2.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "fa0dcd4ee2a066b1131c987a6305d3d1f60fb70f11f4743d9c9daf8a127d6fbd"

      resource "sqz-mcp" do
        url "https://github.com/ojuschugh1/sqz/releases/download/v2.2.0/sqz-mcp-v2.2.0-x86_64-apple-darwin.tar.gz"
        sha256 "588e22bc3ae960d1144499f9750ba852224efd0e317e5b7f1668810564f0a472"
      end
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ojuschugh1/sqz/releases/download/v2.2.0/sqz-v2.2.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "5abdb8d2e01a99708b2e727a096dfda91fbd2022ec4301b66f46b829e973c443"

      resource "sqz-mcp" do
        url "https://github.com/ojuschugh1/sqz/releases/download/v2.2.0/sqz-mcp-v2.2.0-aarch64-unknown-linux-musl.tar.gz"
        sha256 "6686da986c28e1a918daf0edf327e9d8fe04a50ae6f3a68097624a40407170a1"
      end
    end

    on_intel do
      url "https://github.com/ojuschugh1/sqz/releases/download/v2.2.0/sqz-v2.2.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "2b05ca3027f42312bc8f2addd9cc99468512a3a9c229e885e13e362c3546a7fe"

      resource "sqz-mcp" do
        url "https://github.com/ojuschugh1/sqz/releases/download/v2.2.0/sqz-mcp-v2.2.0-x86_64-unknown-linux-musl.tar.gz"
        sha256 "90870ccf4f5d77ed80ea81608331f2592cdc61aa857f435f28c96cb25ef137a3"
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
