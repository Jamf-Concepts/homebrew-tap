# typed: false
# frozen_string_literal: true

# Formula for jamformer — Export your Jamf configuration as Terraform HCL.
# Tap: Jamf-Concepts/homebrew-tap
class Jamformer < Formula
  desc "Export your Jamf configuration as Terraform HCL"
  homepage "https://github.com/Jamf-Concepts/jamformer"
  version "0.5.0"
  license "MIT"

  if OS.mac?
    url "https://github.com/Jamf-Concepts/jamformer/releases/download/v#{version}/jamformer-#{version}-darwin-universal.tar.gz"
    sha256 "b31b0330ccf69f9310e384931495208ecfa9b39e2a475047b0698895d71c75a9"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Jamf-Concepts/jamformer/releases/download/v#{version}/jamformer-#{version}-linux-amd64.tar.gz"
    sha256 "60184995579594271b8b3eb1bc8a842bb573224e962e7b28cbe7ee15efa574fb"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://github.com/Jamf-Concepts/jamformer/releases/download/v#{version}/jamformer-#{version}-linux-arm64.tar.gz"
    sha256 "03f237c567b2032f717f2520278aa775ff2963c9983d38cfefb9ccc2980f908e"
  end

  def install
    bin.install "jamformer"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/jamformer --version")
  end
end
