#!/usr/bin/env ruby
# frozen_string_literal: true

require "digest"
require "fileutils"
require "json"
require "net/http"
require "open-uri"
require "pathname"
require "uri"

OWNER_REPO = "ojuschugh1/sqz"
FORMULA_PATH = Pathname.new("Formula/sqz.rb")

TARGETS = {
  macos_arm: "aarch64-apple-darwin",
  macos_intel: "x86_64-apple-darwin",
  linux_arm: "aarch64-unknown-linux-musl",
  linux_intel: "x86_64-unknown-linux-musl",
}.freeze

def get_json(url)
  uri = URI(url)
  request = Net::HTTP::Get.new(uri)
  request["Accept"] = "application/vnd.github+json"
  request["User-Agent"] = "withakay/homebrew-sqz formula updater"
  request["Authorization"] = "Bearer #{ENV.fetch("GITHUB_TOKEN")}" if ENV["GITHUB_TOKEN"]

  response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == "https") do |http|
    http.request(request)
  end

  abort "GET #{url} failed: #{response.code} #{response.message}" unless response.is_a?(Net::HTTPSuccess)

  JSON.parse(response.body)
end

def sha256_for(asset)
  digest = asset["digest"]
  return digest.delete_prefix("sha256:") if digest&.start_with?("sha256:")

  uri = URI(asset.fetch("browser_download_url"))
  Digest::SHA256.hexdigest(uri.open(&:read))
end

def asset!(assets, name)
  assets.fetch(name) do
    abort "Required release asset is missing: #{name}"
  end
end

def archive(assets, version, binary, target)
  name = "#{binary}-v#{version}-#{target}.tar.gz"
  asset = asset!(assets, name)

  {
    url: asset.fetch("browser_download_url"),
    sha256: sha256_for(asset),
  }
end

def render_formula(version, files)
  <<~RUBY
    class Sqz < Formula
      desc "Universal context intelligence layer for compressing LLM context"
      homepage "https://github.com/ojuschugh1/sqz"
      version "#{version}"
      license "Elastic-2.0"

      on_macos do
        on_arm do
          url "#{files[:macos_arm][:sqz][:url]}"
          sha256 "#{files[:macos_arm][:sqz][:sha256]}"

          resource "sqz-mcp" do
            url "#{files[:macos_arm][:sqz_mcp][:url]}"
            sha256 "#{files[:macos_arm][:sqz_mcp][:sha256]}"
          end
        end

        on_intel do
          url "#{files[:macos_intel][:sqz][:url]}"
          sha256 "#{files[:macos_intel][:sqz][:sha256]}"

          resource "sqz-mcp" do
            url "#{files[:macos_intel][:sqz_mcp][:url]}"
            sha256 "#{files[:macos_intel][:sqz_mcp][:sha256]}"
          end
        end
      end

      on_linux do
        on_arm do
          url "#{files[:linux_arm][:sqz][:url]}"
          sha256 "#{files[:linux_arm][:sqz][:sha256]}"

          resource "sqz-mcp" do
            url "#{files[:linux_arm][:sqz_mcp][:url]}"
            sha256 "#{files[:linux_arm][:sqz_mcp][:sha256]}"
          end
        end

        on_intel do
          url "#{files[:linux_intel][:sqz][:url]}"
          sha256 "#{files[:linux_intel][:sqz][:sha256]}"

          resource "sqz-mcp" do
            url "#{files[:linux_intel][:sqz_mcp][:url]}"
            sha256 "#{files[:linux_intel][:sqz_mcp][:sha256]}"
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
        assert_match version.to_s, shell_output("\#{bin}/sqz --version")
        assert_predicate bin/"sqz-mcp", :executable?
      end
    end
  RUBY
end

release = get_json("https://api.github.com/repos/#{OWNER_REPO}/releases/latest")
version = release.fetch("tag_name").delete_prefix("v")
assets = release.fetch("assets").to_h { |asset| [asset.fetch("name"), asset] }

files = TARGETS.transform_values do |target|
  {
    sqz: archive(assets, version, "sqz", target),
    sqz_mcp: archive(assets, version, "sqz-mcp", target),
  }
end

formula = render_formula(version, files)

FileUtils.mkdir_p(FORMULA_PATH.dirname)
FORMULA_PATH.write(formula)

puts "Updated #{FORMULA_PATH} to sqz v#{version}"
