# typed: false
# frozen_string_literal: true

# Formula for jamf-cli — CLI for the Jamf platform.
# Tap: Jamf-Concepts/homebrew-tap
class JamfCli < Formula
  desc "CLI for the Jamf platform"
  homepage "https://github.com/Jamf-Concepts/jamf-cli"
  license "MIT"

  if OS.mac?
    url "https://github.com/Jamf-Concepts/jamf-cli/releases/download/v1.34.0/jamf-cli-1.34.0-darwin-universal.tar.gz"
    sha256 "8eeed93385de8677a5c72eee65e5f70a4c48b89facd83e2261be6f9267853239"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Jamf-Concepts/jamf-cli/releases/download/v1.34.0/jamf-cli-1.34.0-linux-amd64.tar.gz"
    sha256 "97e344587a22ae62f644853b2f6ea6ecfc0045be2fcdca335a9d15113e8d92c9"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://github.com/Jamf-Concepts/jamf-cli/releases/download/v1.34.0/jamf-cli-1.34.0-linux-arm64.tar.gz"
    sha256 "38761da3019310ce3ac0032f2caea587acbbdc723cafe760b583f3403635427c"
  end

  def install
    bin.install "jamf-cli"

    generate_completions_from_executable(bin/"jamf-cli", "completion")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/jamf-cli --version")
  end
end
