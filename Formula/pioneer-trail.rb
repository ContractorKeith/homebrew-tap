class PioneerTrail < Formula
  desc "Keyboard-only terminal trail survival game"
  homepage "https://github.com/ContractorKeith/pioneer-trail"
  url "https://github.com/ContractorKeith/pioneer-trail/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "3e1ed3f9b66efa923bca3bad92eb5cb74a73034d50742263d11d294ade57607b"
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
