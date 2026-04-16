class Tuhucar < Formula
  desc "CLI for Tuhu car-care knowledge workflows"
  homepage "https://github.com/tuhucar/cli"
  version "0.0.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tuhucar/cli/releases/download/v0.0.3/tuhucar-darwin-arm64"
      sha256 "f29c1882176028b92119946246334bbc96eeb6a09fa03c7b64e4638686cb5834"
    else
      url "https://github.com/tuhucar/cli/releases/download/v0.0.3/tuhucar-darwin-x64"
      sha256 "a46783df77cd77ee916ca785b0d9a0d566f1a33d4daaf9ba912886d43c5b34e0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tuhucar/cli/releases/download/v0.0.3/tuhucar-linux-arm64"
      sha256 "22356eacd259665be3c8ddbc6cdcfd81e07c44290eb9a1d33db7deaa7d25daf6"
    else
      url "https://github.com/tuhucar/cli/releases/download/v0.0.3/tuhucar-linux-x64"
      sha256 "7779f592bc14bb5c7fa0de498296b15e0bab30e84a95061879a973d8696dd2b8"
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
