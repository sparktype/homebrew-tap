# sagebox: AI 에이전트용 개인 비밀 금고를 소스에서 빌드해 설치하는 Homebrew formula
class Sagebox < Formula
  desc "Private secret vault for AI agents"
  homepage "https://github.com/sparktype/sagebox"
  url "https://github.com/sparktype/sagebox/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "9fa020e6e4326370ba3e62ab4fae2cd14c10f473b098a35c8a86636af0f91a26"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  def caveats
    <<~EOS
      Shell hook (offers to move plaintext secrets out of .envrc on cd):
        echo 'eval "$(sagebox zsh)"' >> ~/.zshrc

      sagebox MCP server for Claude Code (required by `sagebox run`):
        claude mcp add -s user sagebox -- #{opt_bin}/sagebox mcp serve
    EOS
  end

  test do
    assert_match "_sagebox_hook", shell_output("#{bin}/sagebox zsh")
  end
end
