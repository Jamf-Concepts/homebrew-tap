# typed: false
# frozen_string_literal: true

# Formula for jamf-cli — CLI for the Jamf platform.
# Tap: Jamf-Concepts/homebrew-tap
class JamfCli < Formula
  desc "CLI for the Jamf platform"
  homepage "https://github.com/Jamf-Concepts/jamf-cli"
  license "MIT"

  if OS.mac?
    url "https://github.com/Jamf-Concepts/jamf-cli/releases/download/v1.36.0/jamf-cli-1.36.0-darwin-universal.tar.gz"
    sha256 "711c9137be3f4a883c5f96c45f9dde9b73cbb1e5affeac1964acfdd5e49d8c79"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Jamf-Concepts/jamf-cli/releases/download/v1.36.0/jamf-cli-1.36.0-linux-amd64.tar.gz"
    sha256 "6b5f0916b23d58be1c277d37a2a1aa58e2e53a8071a2df3f0add0468f90c2566"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://github.com/Jamf-Concepts/jamf-cli/releases/download/v1.36.0/jamf-cli-1.36.0-linux-arm64.tar.gz"
    sha256 "5a45e293914a044df483c847a1fea01125895a7c05ae1d8e29490c556250ea65"
  end

  def install
    bin.install "jamf-cli"

    generate_completions_from_executable(bin/"jamf-cli", "completion")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/jamf-cli --version")
  end
end
