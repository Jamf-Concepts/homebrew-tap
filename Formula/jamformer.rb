# typed: false
# frozen_string_literal: true

# Formula for jamformer — Export your Jamf configuration as Terraform HCL.
# Tap: Jamf-Concepts/homebrew-tap
class Jamformer < Formula
  desc "Export your Jamf configuration as Terraform HCL"
  homepage "https://github.com/Jamf-Concepts/jamformer"
  version "0.6.0"
  license "MIT"

  if OS.mac?
    url "https://github.com/Jamf-Concepts/jamformer/releases/download/v#{version}/jamformer-#{version}-darwin-universal.tar.gz"
    sha256 "c9722e405edc0b55c99ea78fa797626a841ef8cebed9ee4577762942da9c0c4e"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Jamf-Concepts/jamformer/releases/download/v#{version}/jamformer-#{version}-linux-amd64.tar.gz"
    sha256 "6a38665ecbf05760ba03d1790d39fb1bb4f0f5a2f25e0748dde2e105d5d427eb"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://github.com/Jamf-Concepts/jamformer/releases/download/v#{version}/jamformer-#{version}-linux-arm64.tar.gz"
    sha256 "e40fc95cf1afc84a346927f008a3905ff67ffd8dbb2f6a9a28197b1d528c907f"
  end

  def install
    bin.install "jamformer"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/jamformer --version")
  end
end
