class Debrief < Formula
  desc "Local TTS for Codex, Claude Code, Grok, and Gemini CLI"
  homepage "https://github.com/sparktype/debrief"
  url "https://github.com/sparktype/debrief/releases/download/v0.3.2/debrief-v0.3.2-arm64.tar.gz"
  sha256 "1049b5ffca4b04b67b29bb7a28cbab72d373524c217a1dd48c51e55a9798a17d"

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
    assert_match "0.3.2", shell_output("#{bin}/debrief help")
    assert_match "install", shell_output("#{bin}/debrief help")
  end
end
