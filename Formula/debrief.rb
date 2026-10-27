class Debrief < Formula
  desc "Local TTS for Codex, Claude Code, Grok, and Gemini CLI"
  homepage "https://github.com/sparktype/debrief"
  url "https://github.com/sparktype/debrief/releases/download/v0.4.0/debrief-v0.4.0-arm64.tar.gz"
  sha256 "34265cfee60af34bc16acb0b8fe85800e4e3e60aed5b49f82d728361483e1828"

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

      Claude Code: restart. Grok: /mcps. Codex: review /hooks.
      Gemini CLI (opt-in): debrief install --gemini
    EOS
  end

  test do
    assert_match "0.4.0", shell_output("#{bin}/debrief help")
    assert_match "install", shell_output("#{bin}/debrief help")
  end
end
