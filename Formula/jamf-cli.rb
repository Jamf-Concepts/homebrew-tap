# typed: false
# frozen_string_literal: true

# Formula for jamf-cli — CLI for the Jamf platform.
# Tap: Jamf-Concepts/homebrew-tap
class JamfCli < Formula
  desc "CLI for the Jamf platform"
  homepage "https://github.com/Jamf-Concepts/jamf-cli"
  version "1.11.1"
  license "MIT"

  if OS.mac?
    url "https://github.com/Jamf-Concepts/jamf-cli/releases/download/v#{version}/jamf-cli-#{version}-darwin-universal.tar.gz"
    sha256 "8d4596af9a1a0d23bec6229eba35be84c99fc298afc4bfe5f843eb210b26699d"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Jamf-Concepts/jamf-cli/releases/download/v#{version}/jamf-cli-#{version}-linux-amd64.tar.gz"
    sha256 "24ad672ccd3afd8e45a44507a687ab57139ba37ecb67af04caffc1bd904b6c2d"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://github.com/Jamf-Concepts/jamf-cli/releases/download/v#{version}/jamf-cli-#{version}-linux-arm64.tar.gz"
    sha256 "8b46a4233a65a5cf299ff83fc19618721615baac2409a85bd9449c7d6e681c28"
  end

  def install
    bin.install "jamf-cli"

    generate_completions_from_executable(bin/"jamf-cli", "completion")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/jamf-cli --version")
  end
end
