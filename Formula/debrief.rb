class Debrief < Formula
  desc "Local TTS for Codex, Claude Code, and Grok"
  homepage "https://github.com/sparktype/debrief"
  url "https://github.com/sparktype/debrief/releases/download/v0.1.0/debrief-v0.1.0-arm64.tar.gz"
  sha256 "21fd0e261d8e5a6c38d235183dcf3b153660030328ee2997ad6f93e070f43f3f"

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
    assert_match "0.1.0", shell_output("#{bin}/debrief help")
    assert_match "install", shell_output("#{bin}/debrief help")
  end
end
