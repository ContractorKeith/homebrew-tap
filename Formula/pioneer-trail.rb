class PioneerTrail < Formula
  desc "Keyboard-only terminal trail survival game"
  homepage "https://github.com/ContractorKeith/pioneer-trail"
  url "https://github.com/ContractorKeith/pioneer-trail/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "458669bf990b584cac62bcca384c4ffae7f8f2912a0c530d2e7b4120ff23679a"
  license "MIT"

  depends_on "rust" => :build

  def fetch
    system "cargo", "fetch", "--locked"
  end

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/tui")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pioneer-trail --version")
    assert_match "3 runs:", shell_output("#{bin}/pioneer-trail --headless-sim 3 --seed 42")
  end
end
