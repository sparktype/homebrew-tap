class Debrief < Formula
  desc "Local TTS for Codex, Claude Code, and Grok"
  homepage "https://github.com/sparktype/debrief"
  url "https://github.com/sparktype/debrief/releases/download/v0.1.1/debrief-v0.1.1-arm64.tar.gz"
  sha256 "17bf1ca005e27657142492a0bf3bbe024ff6b655b85665285e6130aaf316bd03"

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
    assert_match "0.1.1", shell_output("#{bin}/debrief help")
    assert_match "install", shell_output("#{bin}/debrief help")
  end
end
