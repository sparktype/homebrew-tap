class Chorus < Formula
  desc "Local TTS for Codex, Claude Code, and Grok"
  homepage "https://github.com/sparktype/chorus"
  url "https://github.com/sparktype/chorus/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "f296d7480bb9e24ba598b94fd7954f1d008ad155af69d799ccdd2b73daaf66be"

  depends_on xcode: :build
  depends_on arch: :arm64
  depends_on macos: :sonoma

  def install
    # SwiftPM fetches onnxruntime during this build.
    system "swift", "build", "-c", "release", "--disable-sandbox", "--product", "chorus"
    bin.install ".build/release/chorus"
    # chorus install walks parent directories of the binary looking for icon.png.
    prefix.install "icon.png"
  end

  def caveats
    <<~EOS
      github.com/sparktype/chorus is private. Homebrew can download
      v0.0.1 after that repository is public.

      Finish setup (Supertonic model, menu bar app, host hooks):
        chorus install

      Then open Chorus from Applications.
      Claude Code: restart. Grok: /mcps. Codex: review /hooks.
    EOS
  end

  test do
    assert_match "0.0.1", shell_output("#{bin}/chorus help")
    assert_match "install", shell_output("#{bin}/chorus help")
  end
end
