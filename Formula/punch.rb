# Generated from release archives by packaging/release.py; do not hand-edit hashes.
class Punch < Formula
  desc "Terminal punch list for you and your coding agents"
  homepage "https://github.com/ContractorKeith/punch"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ContractorKeith/punch/releases/download/v0.1.0/punch-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "bc93e133d7b540012be9b33a210973c9e0bbeb41ab0204c2216b0538730c6a9c"
    end
    on_intel do
      url "https://github.com/ContractorKeith/punch/releases/download/v0.1.0/punch-v0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "3f229ce7f6422c48ee347823dc7d62de481ea8b86ea8035b41eb4c417f31db54"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://github.com/ContractorKeith/punch/releases/download/v0.1.0/punch-v0.1.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "f92c2ab4e937902e081f9a8d7ef0fceb87b657181418e893744e3a2dd9681a4c"
    end
  end

  def install
    bin.install "punch"
  end

  test do
    ENV["PUNCH_STATE_DIR"] = testpath
    assert_match "Usage:", shell_output("#{bin}/punch --help")
    assert_match '"ok":true', shell_output("#{bin}/punch --json list")
  end
end
