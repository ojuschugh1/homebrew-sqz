# Homebrew tap for sqz

[![Homebrew](https://img.shields.io/badge/Homebrew-tap-FBB040?logo=homebrew&logoColor=white)](https://github.com/ojuschugh1/homebrew-sqz)

This tap packages [`ojuschugh1/sqz`](https://github.com/ojuschugh1/sqz) for Homebrew.

## Install

```sh
brew tap ojuschugh1/sqz
brew install sqz
```

The formula installs both `sqz` and `sqz-mcp` from the upstream GitHub release artifacts.

## Update automation

`.github/workflows/update-sqz.yml` triggers automatically when a new GitHub Release is published (on `release: [published]`) and can also be triggered manually. It checks the latest upstream release, rewrites `Formula/sqz.rb` with the matching URLs and SHA256 checksums, and opens a pull request if anything changed.

## Local validation

```sh
ruby .github/scripts/update_formula.rb
brew audit --formula Formula/sqz.rb
brew install --formula Formula/sqz.rb
brew test sqz
```

## Credits

Formula automation inspired by and adapted from [@withakay/homebrew-sqz](https://github.com/withakay/homebrew-sqz). Thanks to [@withakay](https://github.com/withakay) for the original tap structure and update scripts.
