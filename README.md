# Homebrew Tap for mcpx

[mcpx](https://github.com/cs50victor/mcpx) is a lightweight CLI for interacting with MCP (Model Context Protocol) servers.

## Installation

```bash
brew tap cs50victor/mcpx
brew install mcpx
```

## Usage

```bash
mcpx                          # List all servers and tools
mcpx <server>                 # Show server's tools
mcpx <server>/<tool>          # Show tool schema
mcpx <server>/<tool> '<json>' # Call tool with args
```

## Current Version

v0.2.0

## Updating

```bash
brew update
brew upgrade mcpx
```

## License

MIT
