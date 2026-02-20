class Mockd < Formula
  desc "High-performance multi-protocol API mocking server"
  homepage "https://mockd.io"
  version "0.3.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/getmockd/mockd/releases/download/v#{version}/mockd-darwin-arm64"
      sha256 "f8eb10dadfeb9878cc457381fe5d2b6070ef30fe6da700549b6f9e9aa5015107"
    else
      url "https://github.com/getmockd/mockd/releases/download/v#{version}/mockd-darwin-amd64"
      sha256 "50b39fd6ed6d577f6abf56da739d95defdfe29e4e0a01a4772eb4513ac4a84f1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getmockd/mockd/releases/download/v#{version}/mockd-linux-arm64"
      sha256 "b92a63c6b1947e9a4531f73c386ac1762e64f745d4678cb94ef98ac039d50796"
    else
      url "https://github.com/getmockd/mockd/releases/download/v#{version}/mockd-linux-amd64"
      sha256 "ea073f240bbd625e8ea35610d39e5569b93e85bddfb8dd467a3fcf63c5c1ae83"
    end
  end

  def install
    binary = Dir["mockd-*"].first || "mockd"
    bin.install binary => "mockd"
  end

  test do
    assert_match "mockd v#{version}", shell_output("#{bin}/mockd version")
  end
end
