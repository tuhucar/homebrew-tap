class Tuhucar < Formula
  desc "CLI for Tuhu car-care knowledge workflows"
  homepage "https://github.com/tuhucar/cli"
  version "0.0.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tuhucar/cli/releases/download/v0.0.1/tuhucar-darwin-arm64"
      sha256 "adec57e999ac216615faf68d22d565ebd40fa20e119e13cc0671c4fe1214a605"
    else
      url "https://github.com/tuhucar/cli/releases/download/v0.0.1/tuhucar-darwin-x64"
      sha256 "7f8e9207b4cccd7df87c45be6441b79d6fcaf7e6ce41d47bab3e59b2e88d210f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tuhucar/cli/releases/download/v0.0.1/tuhucar-linux-arm64"
      sha256 "2ac9ef881dfcde1b954fc18830b449b068022b27f891fbe255ba0d2c873f0fb8"
    else
      url "https://github.com/tuhucar/cli/releases/download/v0.0.1/tuhucar-linux-x64"
      sha256 "43e6f86e9fae05e8b842d7dd721d06ad15c26fcee1ec520390fd4ce1ae84409c"
    end
  end

  head "https://github.com/tuhucar/cli.git", branch: "main"

  def install
    asset = if OS.mac?
      Hardware::CPU.arm? ? "tuhucar-darwin-arm64" : "tuhucar-darwin-x64"
    elsif OS.linux?
      Hardware::CPU.arm? ? "tuhucar-linux-arm64" : "tuhucar-linux-x64"
    else
      raise "Unsupported platform"
    end

    chmod 0755, asset
    bin.install asset => "tuhucar"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tuhucar --version")
  end
end
