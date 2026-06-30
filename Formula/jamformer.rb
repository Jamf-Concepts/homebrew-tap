# typed: false
# frozen_string_literal: true

# Formula for jamformer — Export your Jamf configuration as Terraform HCL.
# Tap: Jamf-Concepts/homebrew-tap
class Jamformer < Formula
  desc "Export your Jamf configuration as Terraform HCL"
  homepage "https://github.com/Jamf-Concepts/jamformer"
  version "0.4.0"
  license "MIT"

  if OS.mac?
    url "https://github.com/Jamf-Concepts/jamformer/releases/download/v#{version}/jamformer-#{version}-darwin-universal.tar.gz"
    sha256 "8c165a75f112cc1caaf266b03ae27c8aa1d369a533a397cfedb6a967cd84bbfb"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Jamf-Concepts/jamformer/releases/download/v#{version}/jamformer-#{version}-linux-amd64.tar.gz"
    sha256 "3ff6b7112314a7e71ec6853026fb7eec37cbfdc71171681fdc880c6d947feea3"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://github.com/Jamf-Concepts/jamformer/releases/download/v#{version}/jamformer-#{version}-linux-arm64.tar.gz"
    sha256 "02a45c71a179a0134775715edf9c23045b991f56507c2937bb7c5a9b20794d98"
  end

  def install
    bin.install "jamformer"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/jamformer --version")
  end
end
