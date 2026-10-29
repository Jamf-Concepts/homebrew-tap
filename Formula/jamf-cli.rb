# typed: false
# frozen_string_literal: true

# Formula for jamf-cli — CLI for the Jamf platform.
# Tap: Jamf-Concepts/homebrew-tap
class JamfCli < Formula
  desc "CLI for the Jamf platform"
  homepage "https://github.com/Jamf-Concepts/jamf-cli"
  license "MIT"

  if OS.mac?
    url "https://github.com/Jamf-Concepts/jamf-cli/releases/download/v1.35.0/jamf-cli-1.35.0-darwin-universal.tar.gz"
    sha256 "7dd81c80dce7a981e30ac1aac9d05c5f8c899143e3478505c86d46c5ed6457aa"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Jamf-Concepts/jamf-cli/releases/download/v1.35.0/jamf-cli-1.35.0-linux-amd64.tar.gz"
    sha256 "c023ce3f8baea6835c0c7aba75c960d05c531655ebe77e26ea3a40e2b0acb4c2"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://github.com/Jamf-Concepts/jamf-cli/releases/download/v1.35.0/jamf-cli-1.35.0-linux-arm64.tar.gz"
    sha256 "ccec39ec3a8856db704fbc5847fee2547f2e4ce786309413a12afcee9dafc05f"
  end

  def install
    bin.install "jamf-cli"

    generate_completions_from_executable(bin/"jamf-cli", "completion")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/jamf-cli --version")
  end
end
