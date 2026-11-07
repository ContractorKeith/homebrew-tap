# frozen_string_literal: true

# Release preparation: replace all placeholder SHA256 values after v0.1.0 tags.
class Keelhaul < Formula
  desc "Deduplicating, encrypted backup CLI"
  homepage "https://github.com/ContractorKeith/keelhaul"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ContractorKeith/keelhaul/releases/download/v0.1.0/keelhaul_v0.1.0_darwin_arm64.tar.gz"
      # Placeholder: replace with this archive's entry from SHA256SUMS before merging.
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
    on_intel do
      url "https://github.com/ContractorKeith/keelhaul/releases/download/v0.1.0/keelhaul_v0.1.0_darwin_amd64.tar.gz"
      # Placeholder: replace with this archive's entry from SHA256SUMS before merging.
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ContractorKeith/keelhaul/releases/download/v0.1.0/keelhaul_v0.1.0_linux_arm64.tar.gz"
      # Placeholder: replace with this archive's entry from SHA256SUMS before merging.
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
    on_intel do
      url "https://github.com/ContractorKeith/keelhaul/releases/download/v0.1.0/keelhaul_v0.1.0_linux_amd64.tar.gz"
      # Placeholder: replace with this archive's entry from SHA256SUMS before merging.
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  def install
    bin.install "keelhaul"
  end

  test do
    assert_match "keelhaul #{version}", shell_output("#{bin}/keelhaul version")
    (testpath/"source").mkpath
    (testpath/"source/hello").write "backup round trip\n"
    (testpath/"password").write "test-only-password\n"
    ENV["KEELHAUL_REPO"] = (testpath/"repo").to_s
    ENV["KEELHAUL_PASSWORD_FILE"] = (testpath/"password").to_s
    system bin/"keelhaul", "init"
    system bin/"keelhaul", "backup", testpath/"source"
    system bin/"keelhaul", "verify"
    system bin/"keelhaul", "restore", "latest", "--target", testpath/"restored"
    assert_equal "backup round trip\n", (testpath/"restored#{testpath}/source/hello").read
  end
end
