class Mockd < Formula
  desc "High-performance multi-protocol API mocking server"
  homepage "https://mockd.io"
  version "0.2.8"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/getmockd/mockd/releases/download/v#{version}/mockd-darwin-arm64"
      sha256 "0047237c2501edc65938a9603c7f39c45f4ea934b9990daa3831c14b5e9c4c22"
    else
      url "https://github.com/getmockd/mockd/releases/download/v#{version}/mockd-darwin-amd64"
      sha256 "cc38ffff5b51a32ed5688b496c74583f7afbe139ab3d4be1857846dc2b5eb09b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getmockd/mockd/releases/download/v#{version}/mockd-linux-arm64"
      sha256 "735fccc85957be6f0c61b03367f4443e149cc6b43fedff0f5248e7a053552f6f"
    else
      url "https://github.com/getmockd/mockd/releases/download/v#{version}/mockd-linux-amd64"
      sha256 "8d80fd1b26065dd21b9baa8197e94db261716e19add62606398b3ff3ff756658"
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
