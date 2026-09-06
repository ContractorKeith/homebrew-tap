class PioneerTrail < Formula
  desc "Keyboard-only terminal trail survival game"
  homepage "https://github.com/ContractorKeith/pioneer-trail"
  url "https://github.com/ContractorKeith/pioneer-trail/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "cd75168a49e76d9228f9ba1549cedb3ac08f3629c24640ce1ea87a346ba6eca5"
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
