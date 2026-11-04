# frozen_string_literal: true

# Local scheduler for recurring agent work.
class Agentcron < Formula
  desc "Local agent scheduler with CLI, daemon, MCP server and TUI"
  homepage "https://github.com/ContractorKeith/agentcron"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ContractorKeith/agentcron/releases/download/v#{version}/agentcron_v#{version}_darwin_arm64.tar.gz"
      sha256 "2a94d488ec09042a84050a5706afb3623e3e72b356b5c19600bb2349d02c829b" # darwin_arm64
    end
    on_intel do
      url "https://github.com/ContractorKeith/agentcron/releases/download/v#{version}/agentcron_v#{version}_darwin_amd64.tar.gz"
      sha256 "8a6d26a0858f24a0c0873dfd8153dcb345c3efdb27a012d88fe4038c4af6b01d" # darwin_amd64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ContractorKeith/agentcron/releases/download/v#{version}/agentcron_v#{version}_linux_arm64.tar.gz"
      sha256 "78a93021c057f6da99fcae5384a04cd46c47df6fdfed0c32127bab14226be948" # linux_arm64
    end
    on_intel do
      url "https://github.com/ContractorKeith/agentcron/releases/download/v#{version}/agentcron_v#{version}_linux_amd64.tar.gz"
      sha256 "f0a01ed28b7c31ee5d67ae221516ea164cf1a3a3ba61e3295211e1a613128e52" # linux_amd64
    end
  end

  def install
    bin.install "agentcron"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agentcron version")
    assert_match "A local scheduler", shell_output("#{bin}/agentcron --help")
  end
end
