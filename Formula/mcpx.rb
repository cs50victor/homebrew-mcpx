class Mcpx < Formula
  desc "Lightweight CLI for interacting with MCP (Model Context Protocol) servers"
  homepage "https://github.com/cs50victor/mcpx"
  license "MIT"
  version "0.1.21"

  on_macos do
    on_arm do
      url "https://github.com/cs50victor/mcpx/releases/download/v#{version}/mcpx-darwin-arm64"
      sha256 "a82b8f1e08aac378cc6bcebe99b2f4c45e50bf80606aae8acfefe6b68ce27373" # mcpx-darwin-arm64
    end
    on_intel do
      url "https://github.com/cs50victor/mcpx/releases/download/v#{version}/mcpx-darwin-x64"
      sha256 "a02a914406c8bedc02ffb028634ddf83e82c09337f8c3621d624561f0bd4c00b" # mcpx-darwin-x64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cs50victor/mcpx/releases/download/v#{version}/mcpx-linux-arm64"
      sha256 "70237c7289ae76b293f44823a9695afc20bba57f6a8562e0997d6ae41795a113" # mcpx-linux-arm64
    end
    on_intel do
      url "https://github.com/cs50victor/mcpx/releases/download/v#{version}/mcpx-linux-x64"
      sha256 "e3192ee0bdccb4fa9ce4450929d99e6690f275598794ea5566c50c6ab7797301" # mcpx-linux-x64
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
