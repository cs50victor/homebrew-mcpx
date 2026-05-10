class Mcpx < Formula
  desc "Lightweight CLI for interacting with MCP (Model Context Protocol) servers"
  homepage "https://github.com/cs50victor/mcpx"
  license "MIT"
  version "1.2.1"

  on_macos do
    on_arm do
      url "https://github.com/cs50victor/mcpx/releases/download/v#{version}/mcpx-darwin-arm64"
      sha256 "2f2a365414f862166854e48582e88831a869c1a0c19e2c6d59b48c72c7a3ba9a" # mcpx-darwin-arm64
    end
    on_intel do
      url "https://github.com/cs50victor/mcpx/releases/download/v#{version}/mcpx-darwin-x64"
      sha256 "1d0b6981b4fb0deb7de5f2160faeefbcab61e172e5f473e995651a9a87c8dcc5" # mcpx-darwin-x64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cs50victor/mcpx/releases/download/v#{version}/mcpx-linux-arm64"
      sha256 "425fbe5eaec30ef37d721c30f45d459f9db84d0fec12d9e8e6ec4c53c8ef91cf" # mcpx-linux-arm64
    end
    on_intel do
      url "https://github.com/cs50victor/mcpx/releases/download/v#{version}/mcpx-linux-x64"
      sha256 "8b5b0477ec6aa47ee26de07e58f944ea3488e3d1e531a9957a243626d95a73c8" # mcpx-linux-x64
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
