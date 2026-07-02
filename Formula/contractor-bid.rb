class ContractorBid < Formula
  include Language::Python::Virtualenv

  desc "AI-ready commercial construction bid workspaces for subcontractors"
  homepage "https://github.com/ContractorKeith/contractor-bid"
  url "https://files.pythonhosted.org/packages/49/9c/0b57e89cf3ef1f010de319d5fff9175f054e8e1190d549f7e18a7cf2a3a6/contractor_bid-0.2.1.tar.gz"
  sha256 "df37a51c41af9466d0aa3b8c47031b4ac7f3abb403478db23ca8afbde5557d41"
  license "MIT"
  head "https://github.com/ContractorKeith/contractor-bid.git", branch: "main"

  depends_on "poppler"
  depends_on "python@3.12"

  resource "et-xmlfile" do
    url "https://files.pythonhosted.org/packages/d3/38/af70d7ab1ae9d4da450eeec1fa3918940a5fafb9055e934af8d6eb0c2313/et_xmlfile-2.0.0.tar.gz"
    sha256 "dab3f4764309081ce75662649be815c4c9081e88f0837825f90fd28317d4da54"
  end

  resource "openpyxl" do
    url "https://files.pythonhosted.org/packages/3d/f9/88d94a75de065ea32619465d2f77b29a0469500e99012523b91cc4141cd1/openpyxl-3.1.5.tar.gz"
    sha256 "cf0e3cf56142039133628b5acffe8ef0c12bc902d2aadd3e0fe5878dc08d1050"
  end

  resource "pypdf" do
    url "https://files.pythonhosted.org/packages/03/72/7dfd5ff1c9c37de97a731701f51af091325f123d9d4270361c9c69e4431f/pypdf-6.14.2.tar.gz"
    sha256 "7873f502fe4385e79539b21d872392dc0c4e3714327c15881cbc7fbfd1f95b25"
  end

  def install
    virtualenv_install_with_resources
  end

  def caveats
    <<~EOS
      This installs the core CLI. For the MCP server and agent plugins
      (Claude Code, Codex, Cursor), install with the mcp extra instead:
        pipx install "contractor-bid[mcp]"
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/contractor-bid --version")
    system bin/"contractor-bid", "doctor"
  end
end
