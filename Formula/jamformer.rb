# typed: false
# frozen_string_literal: true

# Formula for jamformer — Export your Jamf configuration as Terraform HCL.
# Tap: Jamf-Concepts/homebrew-tap
class Jamformer < Formula
  desc "Export your Jamf configuration as Terraform HCL"
  homepage "https://github.com/Jamf-Concepts/jamformer"
  version "0.2.0"
  license "MIT"

  if OS.mac?
    url "https://github.com/Jamf-Concepts/jamformer/releases/download/v#{version}/jamformer-#{version}-darwin-universal.tar.gz"
    sha256 "a98fcd31e646b0e4634d52f98826e08dcc42f84523b5e653fc476eda428d0d1b"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Jamf-Concepts/jamformer/releases/download/v#{version}/jamformer-#{version}-linux-amd64.tar.gz"
    sha256 "c4a01f83fc38f9e109ae9b4275ca72b9bbd0a8fe38164fcdc1d5eb9d2b64b0cb"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://github.com/Jamf-Concepts/jamformer/releases/download/v#{version}/jamformer-#{version}-linux-arm64.tar.gz"
    sha256 "b13e9a813299fa03c6a3f31555ee93dc53313db83051c082c7309f7759595e36"
  end

  def install
    bin.install "jamformer"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/jamformer --version")
  end
end
