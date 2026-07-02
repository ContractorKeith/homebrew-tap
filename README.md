# ContractorKeith Homebrew Tap

Homebrew formulas for [ContractorKeith](https://github.com/ContractorKeith) tools.

## Install

```bash
brew install ContractorKeith/tap/contractor-bid
```

Or add the tap first:

```bash
brew tap ContractorKeith/tap
brew install contractor-bid
```

## Formulas

| Formula | Description |
|---|---|
| `contractor-bid` | AI-ready commercial construction bid workspaces for subcontractors. Core CLI plus Poppler PDF tools. |

Note: the Homebrew formula installs the core CLI. For the MCP server and
agent plugins (Claude Code, Codex, Cursor), use pipx instead:

```bash
pipx install "contractor-bid[mcp]"
```

## Updating a formula

Formulas track the published PyPI sdist. To bump a version, update `url` and
`sha256` (from `https://pypi.org/pypi/contractor-bid/json`) plus any changed
resource blocks, then:

```bash
brew install --build-from-source ./Formula/contractor-bid.rb
brew test contractor-bid
brew audit --strict contractor-bid
```
