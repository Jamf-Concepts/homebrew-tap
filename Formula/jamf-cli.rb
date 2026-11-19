# typed: false
# frozen_string_literal: true

# Formula for jamf-cli — CLI for the Jamf platform.
# Tap: Jamf-Concepts/homebrew-tap
class JamfCli < Formula
  desc "CLI for the Jamf platform"
  homepage "https://github.com/Jamf-Concepts/jamf-cli"
  license "MIT"

  if OS.mac?
    url "https://github.com/Jamf-Concepts/jamf-cli/releases/download/v1.38.0/jamf-cli-1.38.0-darwin-universal.tar.gz"
    sha256 "9defa0afd9c8e7a96ef8496aac45f4fe7ddbd0754ac96a6a7934144dc4b06000"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Jamf-Concepts/jamf-cli/releases/download/v1.38.0/jamf-cli-1.38.0-linux-amd64.tar.gz"
    sha256 "db24c3cb26b97b0957b74edba9c8dbdb3ebec3fe7110ad48e9d73907f5b3220c"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://github.com/Jamf-Concepts/jamf-cli/releases/download/v1.38.0/jamf-cli-1.38.0-linux-arm64.tar.gz"
    sha256 "682c44933adc43e177d95c8f35bac6e8942310996e14e4f6d88af7f0bc4901cc"
  end

  def install
    bin.install "jamf-cli"

    generate_completions_from_executable(bin/"jamf-cli", "completion")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/jamf-cli --version")
  end
end
