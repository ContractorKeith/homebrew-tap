# frozen_string_literal: true

# Local-first Markdown knowledge base.
class Mdkb < Formula
  desc "Local-first Markdown knowledge base with CLI and MCP server"
  homepage "https://github.com/ContractorKeith/mdkb"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ContractorKeith/mdkb/releases/download/v#{version}/mdkb_v#{version}_darwin_arm64.tar.gz"
      sha256 "da087fea7d7c741d157f8ba09499530ce02df0e11d0a3051d04783b7eeb47780" # darwin_arm64
    end
    on_intel do
      url "https://github.com/ContractorKeith/mdkb/releases/download/v#{version}/mdkb_v#{version}_darwin_amd64.tar.gz"
      sha256 "0171e5d0d2aa29f99c3de5ec7c092c33dc022e2aaaf1e811bc3bb5d9f62b7018" # darwin_amd64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ContractorKeith/mdkb/releases/download/v#{version}/mdkb_v#{version}_linux_arm64.tar.gz"
      sha256 "e94c930e3ca78b1bb9b76f90ce5c95b1de6f380a4651e3adf3637b9b11f1d406" # linux_arm64
    end
    on_intel do
      url "https://github.com/ContractorKeith/mdkb/releases/download/v#{version}/mdkb_v#{version}_linux_amd64.tar.gz"
      sha256 "b395a46299e5bb3a42d2180e56fbf7fc160f6d28ca72aabe7b2b54e2d806ca47" # linux_amd64
    end
  end

  def install
    bin.install "mdkb"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mdkb version")
  end
end
