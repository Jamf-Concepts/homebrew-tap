# typed: false
# frozen_string_literal: true

# Formula for jamf-cli — CLI for the Jamf platform.
# Tap: Jamf-Concepts/homebrew-tap
class JamfCli < Formula
  desc "CLI for the Jamf platform"
  homepage "https://github.com/Jamf-Concepts/jamf-cli"
  license "MIT"

  if OS.mac?
    url "https://github.com/Jamf-Concepts/jamf-cli/releases/download/v1.33.0/jamf-cli-1.33.0-darwin-universal.tar.gz"
    sha256 "d09cafd4f2ab9828d6c33cf1239a6d24f08ce900d87c04f865496874c97caa83"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Jamf-Concepts/jamf-cli/releases/download/v1.33.0/jamf-cli-1.33.0-linux-amd64.tar.gz"
    sha256 "8fc1765037da5afc255f139a2e31df073685780335eaa58b17a88af6e9ca79fa"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://github.com/Jamf-Concepts/jamf-cli/releases/download/v1.33.0/jamf-cli-1.33.0-linux-arm64.tar.gz"
    sha256 "4e61aa87ae438a2c5658d1d3398f6428301be1ace23a285ee881f387e379faf1"
  end

  def install
    bin.install "jamf-cli"

    generate_completions_from_executable(bin/"jamf-cli", "completion")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/jamf-cli --version")
  end
end
