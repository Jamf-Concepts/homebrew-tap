# typed: false
# frozen_string_literal: true

# Formula for jamf-cli — CLI for the Jamf platform.
# Tap: Jamf-Concepts/homebrew-tap
class JamfCli < Formula
  desc "CLI for the Jamf platform — automate across Jamf Pro"
  homepage "https://github.com/Jamf-Concepts/jamf-cli"
  version "1.0.0"
  license "MIT"

  on_macos do
    url "https://github.com/Jamf-Concepts/jamf-cli/releases/download/v1.0.0/jamf-cli-1.0.0-darwin-universal.tar.gz"
    sha256 "19a1bb27a5bef31d0e595ed433faa03eab18ad04393c179b20a5b0a67b25d288"
  end

  on_linux do
    on_intel do
      url "https://github.com/Jamf-Concepts/jamf-cli/releases/download/v1.0.0/jamf-cli-1.0.0-linux-amd64.tar.gz"
      sha256 "26649bdf04b88ee0ee5629c1cf6cf15ee717e8e169e7c2950ce1b1e07e9ca387"
    end

    on_arm do
      url "https://github.com/Jamf-Concepts/jamf-cli/releases/download/v1.0.0/jamf-cli-1.0.0-linux-arm64.tar.gz"
      sha256 "77b8ce72129107592d416f026f388ba6c460942009bddf9933039bbb2b42c43e"
    end
  end

  def install
    bin.install "jamf-cli"

    generate_completions_from_executable(bin/"jamf-cli", "completion")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/jamf-cli --version")
  end
end
