# typed: false
# frozen_string_literal: true

# Formula for jamf-cli — CLI for the Jamf platform.
# Tap: Jamf-Concepts/homebrew-tap
class JamfCli < Formula
  desc "CLI for the Jamf platform"
  homepage "https://github.com/Jamf-Concepts/jamf-cli"
  license "MIT"

  if OS.mac?
    url "https://github.com/Jamf-Concepts/jamf-cli/releases/download/v1.37.0/jamf-cli-1.37.0-darwin-universal.tar.gz"
    sha256 "74903a5b5887cc3b9f7091e5258a91aa0d4b02e0b45079df27f90277fd65e394"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Jamf-Concepts/jamf-cli/releases/download/v1.37.0/jamf-cli-1.37.0-linux-amd64.tar.gz"
    sha256 "135b2107ddeb03b4d3c6f242f3a8175efa94ccfb78f80c3ca692e44f59418652"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://github.com/Jamf-Concepts/jamf-cli/releases/download/v1.37.0/jamf-cli-1.37.0-linux-arm64.tar.gz"
    sha256 "06af9ae417fd03c678da3a2a654aa8eb4cee30c51b1516b251370f943cb49262"
  end

  def install
    bin.install "jamf-cli"

    generate_completions_from_executable(bin/"jamf-cli", "completion")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/jamf-cli --version")
  end
end
