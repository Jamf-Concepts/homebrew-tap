# typed: false
# frozen_string_literal: true

# Formula for jamformer — Export your Jamf configuration as Terraform HCL.
# Tap: Jamf-Concepts/homebrew-tap
class Jamformer < Formula
  desc "Export your Jamf configuration as Terraform HCL"
  homepage "https://github.com/Jamf-Concepts/jamformer"
  license "MIT"

  if OS.mac?
    url "https://github.com/Jamf-Concepts/jamformer/releases/download/v0.6.1/jamformer-0.6.1-darwin-universal.tar.gz"
    sha256 "00ec142f60bf630d628f9a07ead47ddd4b3aeb4f6219a2590fd64218c62a5356"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Jamf-Concepts/jamformer/releases/download/v0.6.1/jamformer-0.6.1-linux-amd64.tar.gz"
    sha256 "24b911b3010e7284e57f655f4160f1eeed182954c0f7629c6870cb6c1d1eeca4"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://github.com/Jamf-Concepts/jamformer/releases/download/v0.6.1/jamformer-0.6.1-linux-arm64.tar.gz"
    sha256 "ec2f1c14514d20214761f34010bafe5cc3b0935d1a36dcfb9711af0c0270c9fa"
  end

  def install
    bin.install "jamformer"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/jamformer --version")
  end
end
