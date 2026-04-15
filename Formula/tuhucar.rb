class Tuhucar < Formula
  desc "CLI for Tuhu car-care knowledge workflows"
  homepage "https://github.com/tuhucar/cli"
  version "0.0.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tuhucar/cli/releases/download/v0.0.2/tuhucar-darwin-arm64"
      sha256 "0405ef60e73a12ce638efade2d822b8c0a19c52a8679e1a97c0f15d9bf30b492"
    else
      url "https://github.com/tuhucar/cli/releases/download/v0.0.2/tuhucar-darwin-x64"
      sha256 "8d35dd3c1f22a3121fa4a30be0b1f4adde9e20579dbd2b9c8971e77111a112c3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tuhucar/cli/releases/download/v0.0.2/tuhucar-linux-arm64"
      sha256 "951ae057202583ef09eda3e7caf53bec91ca219c2cefdcb5bd22912ba21449ba"
    else
      url "https://github.com/tuhucar/cli/releases/download/v0.0.2/tuhucar-linux-x64"
      sha256 "05b9a18b38107af7909818435ce16500b703e874dafd5bebfb9c7c4a30b4a4d9"
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
