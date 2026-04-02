# typed: false
# frozen_string_literal: true

# Formula for jamf-cli — CLI for the Jamf platform.
# Tap: Jamf-Concepts/homebrew-tap
class JamfCli < Formula
  desc "CLI for the Jamf platform — automate across Jamf Pro"
  homepage "https://github.com/Jamf-Concepts/jamf-cli"
  version "1.0.0"
  license "LicenseRef-Jamf-Source-Available"

  on_macos do
    url "https://github.com/Jamf-Concepts/jamf-cli/releases/download/v1.0.0/jamf-cli-1.0.0-darwin-universal.tar.gz"
    sha256 "REPLACE_WITH_DARWIN_SHA256"
  end

  on_linux do
    on_intel do
      url "https://github.com/Jamf-Concepts/jamf-cli/releases/download/v1.0.0/jamf-cli-1.0.0-linux-amd64.tar.gz"
      sha256 "REPLACE_WITH_LINUX_AMD64_SHA256"
    end

    on_arm do
      url "https://github.com/Jamf-Concepts/jamf-cli/releases/download/v1.0.0/jamf-cli-1.0.0-linux-arm64.tar.gz"
      sha256 "REPLACE_WITH_LINUX_ARM64_SHA256"
    end
  end

  def install
    bin.install "jamf-cli"

    generate_completions_from_executable(bin/"jamf-cli", "completion")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/jamf-cli --version")
  end
end
