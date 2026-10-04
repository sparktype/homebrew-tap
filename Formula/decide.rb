class Decide < Formula
  desc "Choice, score, and noul decisions via TypeSafe Jev or a local model"
  homepage "https://github.com/sparktype/decide"
  url "https://github.com/sparktype/decide/releases/download/v0.1.0/decide-v0.1.0-aarch64-apple-darwin.tar.gz"
  sha256 "53e5ab16ad888f6d800738327c8c58130e048915bd534d2604b24857b296e544"
  version "0.1.0"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  def install
    bin.install "decide"
  end

  test do
    assert_match "mcp", shell_output("#{bin}/decide --help")
  end
end
