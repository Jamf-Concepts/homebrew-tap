# typed: false
# frozen_string_literal: true

# Formula for jamf-cli — CLI for the Jamf platform.
# Tap: Jamf-Concepts/homebrew-tap
class JamfCli < Formula
  desc "CLI for the Jamf platform"
  homepage "https://github.com/Jamf-Concepts/jamf-cli"
  version "1.26.0"
  license "MIT"

  if OS.mac?
    url "https://github.com/Jamf-Concepts/jamf-cli/releases/download/v#{version}/jamf-cli-#{version}-darwin-universal.tar.gz"
    sha256 "0e4c640f37f02f3a1981017c0477da7d47950e49ebba571d1be5e94557615f85"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Jamf-Concepts/jamf-cli/releases/download/v#{version}/jamf-cli-#{version}-linux-amd64.tar.gz"
    sha256 "25837c44dc56193cbdabc35b25bb308e4f2c159d0a8f53e470159dcd7a776e06"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://github.com/Jamf-Concepts/jamf-cli/releases/download/v#{version}/jamf-cli-#{version}-linux-arm64.tar.gz"
    sha256 "856543c368c657511766e3c824ad3a160b5f4db702490577b235f94970af4230"
  end

  def install
    bin.install "jamf-cli"

    generate_completions_from_executable(bin/"jamf-cli", "completion")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/jamf-cli --version")
  end
end
