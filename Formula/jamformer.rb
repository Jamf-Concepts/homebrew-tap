# typed: false
# frozen_string_literal: true

# Formula for jamformer — Export your Jamf configuration as Terraform HCL.
# Tap: Jamf-Concepts/homebrew-tap
class Jamformer < Formula
  desc "Export your Jamf configuration as Terraform HCL"
  homepage "https://github.com/Jamf-Concepts/jamformer"
  license "MIT"

  if OS.mac?
    url "https://github.com/Jamf-Concepts/jamformer/releases/download/v0.7.0/jamformer-0.7.0-darwin-universal.tar.gz"
    sha256 "9b2880c015efff5578a92d139d8ad1392ed457cf6208e2838cac70e4888f0c1a"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Jamf-Concepts/jamformer/releases/download/v0.7.0/jamformer-0.7.0-linux-amd64.tar.gz"
    sha256 "4604896a6fc17e3f534584a845bfe0b2784d47a68438b0e75ba41994592a2d03"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://github.com/Jamf-Concepts/jamformer/releases/download/v0.7.0/jamformer-0.7.0-linux-arm64.tar.gz"
    sha256 "6f6c1475a02b8cc74afddf5969f33fdc2fd4c981e09d9253c972c6fa3bd29475"
  end

  def install
    bin.install "jamformer"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/jamformer --version")
  end
end
