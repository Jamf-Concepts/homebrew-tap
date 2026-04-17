# typed: false
# frozen_string_literal: true

# Formula for jamf-cli — CLI for the Jamf platform.
# Tap: Jamf-Concepts/homebrew-tap
class JamfCli < Formula
  desc "CLI for the Jamf platform"
  homepage "https://github.com/Jamf-Concepts/jamf-cli"
  version "1.12.0"
  license "MIT"

  if OS.mac?
    url "https://github.com/Jamf-Concepts/jamf-cli/releases/download/v#{version}/jamf-cli-#{version}-darwin-universal.tar.gz"
    sha256 "588bb6e4efb8f3ad8bb40130f7e940e435aae0dd0b19c1c1fc191df74b32dd73"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Jamf-Concepts/jamf-cli/releases/download/v#{version}/jamf-cli-#{version}-linux-amd64.tar.gz"
    sha256 "7ba0960ed62b913e09bf5f2b073cdff6a3b10eca81a6f0853133a4141fbcf093"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://github.com/Jamf-Concepts/jamf-cli/releases/download/v#{version}/jamf-cli-#{version}-linux-arm64.tar.gz"
    sha256 "e0fb519992989f01769faf15e9de9511192a2e4b35ecce006d6bcd5c02e693ba"
  end

  def install
    bin.install "jamf-cli"

    generate_completions_from_executable(bin/"jamf-cli", "completion")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/jamf-cli --version")
  end
end
