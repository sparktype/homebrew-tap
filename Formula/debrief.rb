class Debrief < Formula
  desc "Local TTS for Codex, Claude Code, and Grok"
  homepage "https://github.com/sparktype/debrief"
  url "https://github.com/sparktype/debrief/releases/download/v0.2.2/debrief-v0.2.2-arm64.tar.gz"
  sha256 "29112fa8a91b24aa2849528929c270dae42b4f7b9bc2f9ee816e542a61d4deac"

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
    EOS
  end

  test do
    assert_match "0.2.2", shell_output("#{bin}/debrief help")
    assert_match "install", shell_output("#{bin}/debrief help")
  end
end
