class Mcpx < Formula
  desc "Lightweight CLI for interacting with MCP (Model Context Protocol) servers"
  homepage "https://github.com/cs50victor/mcpx"
  license "MIT"
  version "0.1.22"

  on_macos do
    on_arm do
      url "https://github.com/cs50victor/mcpx/releases/download/v#{version}/mcpx-darwin-arm64"
      sha256 "8bb0e4d048d08b353a24c936b105563dc413e76e1395c124ba91be24d7656398" # mcpx-darwin-arm64
    end
    on_intel do
      url "https://github.com/cs50victor/mcpx/releases/download/v#{version}/mcpx-darwin-x64"
      sha256 "e29b41bae1fe040f8966c7a2f0dd62527c551893152a812f633995444cfdc77c" # mcpx-darwin-x64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cs50victor/mcpx/releases/download/v#{version}/mcpx-linux-arm64"
      sha256 "9ee860c601f5fce2c65fc68b981521a6ea5e83f2ba886690e21198d07b89644d" # mcpx-linux-arm64
    end
    on_intel do
      url "https://github.com/cs50victor/mcpx/releases/download/v#{version}/mcpx-linux-x64"
      sha256 "3f1d759e4af8b618d440980b170e8e5757de3d4bf8ee8782791b448cb8b53245" # mcpx-linux-x64
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
