class Mockd < Formula
  desc "High-performance multi-protocol API mocking server"
  homepage "https://mockd.io"
  version "0.2.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/getmockd/mockd/releases/download/v#{version}/mockd-darwin-arm64"
      sha256 "639cc7235e09bba74e89439b7a4a6a43eb635c3561a023b132d034e80678c336"
    else
      url "https://github.com/getmockd/mockd/releases/download/v#{version}/mockd-darwin-amd64"
      sha256 "fa457050c5a4f5b7b27782fb5938a210c70ad735bc196bb0a78659d62bf13b55"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getmockd/mockd/releases/download/v#{version}/mockd-linux-arm64"
      sha256 "06270672768c8fa3d32e106293213037c9fb8eca2d7f95c7fdd4a8c356ed24ad"
    else
      url "https://github.com/getmockd/mockd/releases/download/v#{version}/mockd-linux-amd64"
      sha256 "5fe10c03c1fb733f30cebf580db789798f3166e78def95972209e3660427b7d5"
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
