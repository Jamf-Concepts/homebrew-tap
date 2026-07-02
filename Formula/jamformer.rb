# typed: false
# frozen_string_literal: true

# Formula for jamformer — Export your Jamf configuration as Terraform HCL.
# Tap: Jamf-Concepts/homebrew-tap
class Jamformer < Formula
  desc "Export your Jamf configuration as Terraform HCL"
  homepage "https://github.com/Jamf-Concepts/jamformer"
  version "0.4.1"
  license "MIT"

  if OS.mac?
    url "https://github.com/Jamf-Concepts/jamformer/releases/download/v#{version}/jamformer-#{version}-darwin-universal.tar.gz"
    sha256 "6c6bc4cc253256c2d23663c9eced2725b833cbee863d8f4808a0bd62b9ab0161"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Jamf-Concepts/jamformer/releases/download/v#{version}/jamformer-#{version}-linux-amd64.tar.gz"
    sha256 "a340818b375d6f67be54970516ef3056e381c268fd44d1fe2196f3283a123dda"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://github.com/Jamf-Concepts/jamformer/releases/download/v#{version}/jamformer-#{version}-linux-arm64.tar.gz"
    sha256 "7d30cf831537ccb3bad00f8f380467841ced7257c72f7d9c6d2224c57f5e99d4"
  end

  def install
    bin.install "jamformer"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/jamformer --version")
  end
end
