class Debrief < Formula
  desc "Local TTS for Codex, Claude Code, Grok, and Gemini CLI"
  homepage "https://github.com/sparktype/debrief"
  url "https://github.com/sparktype/debrief/releases/download/v0.3.0/debrief-v0.3.0-arm64.tar.gz"
  sha256 "5da39ec63e13ece214d306c93c665fbbf50fd6a93fbe98e095b9cd443a8fa7d7"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  def install
    bin.install "debrief"
  end

  def caveats
    <<~EOS
      Finish setup (Supertonic model, LaunchAgent, host hooks):
        debrief install

      Claude Code: restart. Grok: /mcps. Codex: review /hooks.
      Gemini CLI (opt-in): debrief install --gemini
    EOS
  end

  test do
    assert_match "0.3.0", shell_output("#{bin}/debrief help")
    assert_match "install", shell_output("#{bin}/debrief help")
  end
end
