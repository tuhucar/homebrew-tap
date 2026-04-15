class Tuhucar < Formula
  desc "CLI for Tuhu car-care knowledge workflows"
  homepage "https://github.com/tuhucar/cli"
  url "https://github.com/tuhucar/cli.git",
      tag: "v0.0.1",
      revision: "23e517260076d09533874421068d8bdfe3d07831"
  version "0.0.1"
  license "MIT"
  head "https://github.com/tuhucar/cli.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", *std_cargo_args(path: "crates/tuhucar-cli")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tuhucar --version")
  end
end
