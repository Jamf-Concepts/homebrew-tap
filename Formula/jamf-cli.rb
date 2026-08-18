# typed: false
# frozen_string_literal: true

# Formula for jamf-cli — CLI for the Jamf platform.
# Tap: Jamf-Concepts/homebrew-tap
class JamfCli < Formula
  desc "CLI for the Jamf platform"
  homepage "https://github.com/Jamf-Concepts/jamf-cli"
  version "1.27.0"
  license "MIT"

  if OS.mac?
    url "https://github.com/Jamf-Concepts/jamf-cli/releases/download/v#{version}/jamf-cli-#{version}-darwin-universal.tar.gz"
    sha256 "f20fe2c5c8b529f7d0bd13198c0e494f13acddad81d1f5caf8e8816a48363894"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Jamf-Concepts/jamf-cli/releases/download/v#{version}/jamf-cli-#{version}-linux-amd64.tar.gz"
    sha256 "4ea4b49f491185ad44a44e90cbe1c23f2cfad2dafe89215240777b5f6b3c2d85"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://github.com/Jamf-Concepts/jamf-cli/releases/download/v#{version}/jamf-cli-#{version}-linux-arm64.tar.gz"
    sha256 "78821bf11c1c6ebb018f6b9cf305cd7ac3b45d2a10b812b6620585608bab9de4"
  end

  def install
    bin.install "jamf-cli"

    generate_completions_from_executable(bin/"jamf-cli", "completion")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/jamf-cli --version")
  end
end
