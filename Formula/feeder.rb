class Feeder < Formula
  desc "Personal source-linked feed digests"
  homepage "https://github.com/ContractorKeith/feeder"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ContractorKeith/feeder/releases/download/v0.1.0/feeder_v0.1.0_darwin_arm64.tar.gz"
      sha256 "1ea71339fd86737c73c147b5189ca26d8c3bea6e7bf6ae7ce574dbbedc2f7aee"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ContractorKeith/feeder/releases/download/v0.1.0/feeder_v0.1.0_darwin_amd64.tar.gz"
      sha256 "012868f77649400e7b9559b3b68b320f510d181936fec248913642e4adbd41e4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ContractorKeith/feeder/releases/download/v0.1.0/feeder_v0.1.0_linux_arm64.tar.gz"
      sha256 "408571cc7f40ee5406558206a1da21970e4fe270f52eaaf468cca4bb9f4fd072"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ContractorKeith/feeder/releases/download/v0.1.0/feeder_v0.1.0_linux_amd64.tar.gz"
      sha256 "a01aef0b349fdd466b42cba798fe8de83ba9c352681b75fc8ace41a776fa92ee"
    end
  end

  def install
    bin.install "feeder"
    doc.install "BUILD.json", "README.md"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/feeder --home #{testpath}/state version")
    system bin/"feeder", "--home", testpath/"state", "init", "--timezone", "UTC"
  end
end
