class Debrief < Formula
  desc "Local TTS for Codex, Claude Code, and Grok"
  homepage "https://github.com/sparktype/debrief"
  url "https://github.com/sparktype/debrief/archive/refs/tags/v0.0.4.tar.gz",
      headers: [
        "Authorization: Bearer #{ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", "")}",
      ]
  sha256 "67b6b210e09a5898deba1da5a391cb3729ac098645e6323cdc4005d06f2d8bd3"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox", "--product", "debrief"
    bin.install ".build/release/debrief"
  end

  def caveats
    <<~EOS
      github.com/sparktype/debrief is private. Export a GitHub token that
      can read that repository before installing:
        export HOMEBREW_GITHUB_API_TOKEN=...

      Finish setup (Supertonic model, LaunchAgent, host hooks):
        debrief install

      Claude Code: restart. Grok: /mcps. Codex: review /hooks.
    EOS
  end

  test do
    assert_match "0.0.4", shell_output("#{bin}/debrief help")
    assert_match "install", shell_output("#{bin}/debrief help")
  end
end
