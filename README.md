# ContractorKeith Homebrew Tap

Homebrew formulae for [ContractorKeith](https://github.com/ContractorKeith) tools.

## Install

```bash
brew install ContractorKeith/tap/contractor-bid
```

Or tap first, then install:

```bash
brew tap ContractorKeith/tap
brew install contractor-bid
```

## Formulae

| Formula | Description |
|---------|-------------|
| [`feeder`](https://github.com/ContractorKeith/feeder) | Personal source-linked RSS/Atom digests, with optional local/API summaries. Prebuilt for Linux/macOS amd64/arm64. Install with `brew install ContractorKeith/tap/feeder`. |
| [`contractor-bid`](https://github.com/ContractorKeith/contractor-bid) | AI-ready commercial construction bid workspaces for subcontractors. Installs the `contractor-bid` CLI and the `contractor-bid-mcp` MCP server, with `poppler` included for PDF handling. |
| [`mdkb`](https://github.com/ContractorKeith/mdkb) | Local-first Markdown knowledge base: one Go binary with a CLI and a stdio MCP server, FTS5 search, wikilinks and backlinks, git-committed agent writes. Prebuilt for macOS and Linux. |
| [`punch`](https://github.com/ContractorKeith/punch) | Terminal punch list for you and your coding agents. Prebuilt for macOS and Linux x86_64. |

## Updating a formula

Formula source templates live in each project repo (e.g. `contractor-bid/packaging/homebrew/`).
To bump a release: update the `url` to the new tag, replace `sha256` with the new tarball hash,
regenerate resources with `brew update-python-resources --extra-packages=mcp contractor-bid`,
then `brew install --build-from-source` and `brew test` before pushing.
