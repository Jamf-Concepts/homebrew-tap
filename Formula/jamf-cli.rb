# typed: false
# frozen_string_literal: true

# Formula for jamf-cli — CLI for the Jamf platform.
# Tap: Jamf-Concepts/homebrew-tap
class JamfCli < Formula
  desc "CLI for the Jamf platform"
  homepage "https://github.com/Jamf-Concepts/jamf-cli"
  license "MIT"

  if OS.mac?
    url "https://github.com/Jamf-Concepts/jamf-cli/releases/download/v1.32.0/jamf-cli-1.32.0-darwin-universal.tar.gz"
    sha256 "115e918955abd4645095a086071fef5040feab17703c22d7406dc0feefc0756e"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Jamf-Concepts/jamf-cli/releases/download/v1.32.0/jamf-cli-1.32.0-linux-amd64.tar.gz"
    sha256 "ee7b715470991358c0ec96f570ea678e2b186f82d20a7eacc3782b27164ccbce"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://github.com/Jamf-Concepts/jamf-cli/releases/download/v1.32.0/jamf-cli-1.32.0-linux-arm64.tar.gz"
    sha256 "aee294d2b1009bed1648323e29b1115a7fb5297f5151c6d5041ad3558b53afd2"
  end

  def install
    bin.install "jamf-cli"

    generate_completions_from_executable(bin/"jamf-cli", "completion")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/jamf-cli --version")
  end
end
