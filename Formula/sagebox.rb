# sagebox: AI 에이전트용 개인 비밀 금고를 소스에서 빌드해 설치하는 Homebrew formula
class Sagebox < Formula
  desc "Private secret vault for AI agents"
  homepage "https://github.com/sparktype/sagebox"
  url "https://github.com/sparktype/sagebox/archive/refs/tags/v0.0.2.tar.gz"
  sha256 "bb3e481d46e94399e63834d052d8c42697d4b0e44236cd108393cf2508df9ec1"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
    generate_completions_from_executable(bin/"sagebox", "completion", shells: [:bash, :zsh])
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
    assert_match "#compdef sagebox", shell_output("#{bin}/sagebox completion zsh")
  end
end
