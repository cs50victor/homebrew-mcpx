class Mcpx < Formula
  desc "Lightweight CLI for interacting with MCP (Model Context Protocol) servers"
  homepage "https://github.com/cs50victor/mcpx"
  license "MIT"
  version "1.6.0"

  on_macos do
    on_arm do
      url "https://github.com/cs50victor/mcpx/releases/download/v#{version}/mcpx-darwin-arm64"
      sha256 "0833566638d601e4281623317b3ed45d382e6e7b87475aee8154dee3b5477307" # mcpx-darwin-arm64
    end
    on_intel do
      url "https://github.com/cs50victor/mcpx/releases/download/v#{version}/mcpx-darwin-x64"
      sha256 "bb4344abc242315e6f6728ed7dbfceadced0251745574769201dc9ac94d4c956" # mcpx-darwin-x64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cs50victor/mcpx/releases/download/v#{version}/mcpx-linux-arm64"
      sha256 "86ab0f55b666f4cdef5912f9480bdc72bde8c82729c612be87d44610a908e538" # mcpx-linux-arm64
    end
    on_intel do
      url "https://github.com/cs50victor/mcpx/releases/download/v#{version}/mcpx-linux-x64"
      sha256 "496548505f3d557f0a375517da02115464aef354e8cc0b8025df18b469ec393e" # mcpx-linux-x64
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "mcpx-darwin-arm64" => "mcpx"
    elsif OS.mac? && Hardware::CPU.intel?
      bin.install "mcpx-darwin-x64" => "mcpx"
    elsif OS.linux? && Hardware::CPU.arm?
      bin.install "mcpx-linux-arm64" => "mcpx"
    elsif OS.linux? && Hardware::CPU.intel?
      bin.install "mcpx-linux-x64" => "mcpx"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mcpx --version")
  end
end
