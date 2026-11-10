class Debrief < Formula
  desc "Local TTS for Codex, Claude Code, Grok, and Gemini CLI"
  homepage "https://github.com/sparktype/debrief"
  url "https://github.com/sparktype/debrief/releases/download/v0.6.0/debrief-v0.6.0-arm64.tar.gz"
  sha256 "0514bbe05568b5858f2c629e9d9bd70b9b0794f7b9e8e7fe8f72270621568677"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  def install
    bin.install "debrief"
  end

  def caveats
    <<~EOS
      Finish setup (Supertonic model, LaunchAgent, host hooks):
        debrief install
      After brew upgrade, run debrief install again to replace ~/.local/bin/debrief.

      Claude Code: restart. Grok: /mcps. Outside your home, /hooks-trust.
      Codex: trust /hooks only if debrief doctor asks.
      Gemini CLI (opt-in): debrief install --gemini
    EOS
  end

  test do
    assert_match "0.6.0", shell_output("#{bin}/debrief help")
    assert_match "install", shell_output("#{bin}/debrief help")
  end
end
