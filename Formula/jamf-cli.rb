# typed: false
# frozen_string_literal: true

# Formula for jamf-cli — CLI for the Jamf platform.
# Tap: Jamf-Concepts/homebrew-tap
class JamfCli < Formula
  desc "CLI for the Jamf platform"
  homepage "https://github.com/Jamf-Concepts/jamf-cli"
  version "1.10.0"
  license "MIT"

  if OS.mac?
    url "https://github.com/Jamf-Concepts/jamf-cli/releases/download/v#{version}/jamf-cli-#{version}-darwin-universal.tar.gz"
    sha256 "24826272c07bfa86ce71c4f3311147f2dc01a4c5165fb121892a15389602edb3"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Jamf-Concepts/jamf-cli/releases/download/v#{version}/jamf-cli-#{version}-linux-amd64.tar.gz"
    sha256 "5870c476d92938d27752e05e569b4fb2527c9e166170cfe7caf6d1091afd830a"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://github.com/Jamf-Concepts/jamf-cli/releases/download/v#{version}/jamf-cli-#{version}-linux-arm64.tar.gz"
    sha256 "41d325357b9f51c51a3d96fd16b210f58b684ec89fe5458eebcaee5daa8e225e"
  end

  def install
    bin.install "jamf-cli"

    generate_completions_from_executable(bin/"jamf-cli", "completion")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/jamf-cli --version")
  end
end
