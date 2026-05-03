class Mcpx < Formula
  desc "Lightweight CLI for interacting with MCP (Model Context Protocol) servers"
  homepage "https://github.com/cs50victor/mcpx"
  license "MIT"
  version "1.2.0"

  on_macos do
    on_arm do
      url "https://github.com/cs50victor/mcpx/releases/download/v#{version}/mcpx-darwin-arm64"
      sha256 "04bf996ce264c2b004b1d837129758bab5dcc0c0088246a1291e2fc507d2831b" # mcpx-darwin-arm64
    end
    on_intel do
      url "https://github.com/cs50victor/mcpx/releases/download/v#{version}/mcpx-darwin-x64"
      sha256 "2a183b86cb369322a1c08df566771df70bea456380b951e1e0b4dc91c755f668" # mcpx-darwin-x64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cs50victor/mcpx/releases/download/v#{version}/mcpx-linux-arm64"
      sha256 "529868ebdde3a08965d8649b0a36d3a014ee9cdb5843c83f06756707501a2e3a" # mcpx-linux-arm64
    end
    on_intel do
      url "https://github.com/cs50victor/mcpx/releases/download/v#{version}/mcpx-linux-x64"
      sha256 "c39547e842f069ce12d5e6d627b2cbca298782cd902c9dbf561ed39c5b7e0ffe" # mcpx-linux-x64
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
