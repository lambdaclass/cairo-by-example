class Cairo < Formula
  desc "Cairo language installation"
  homepage "https://cairo-by-example.com/"
  head do
    url "https://github.com/starkware-libs/cairo", branch: "main"
  end
  # version "0.0.1"
  # sha256 ""
  license "MIT"

  def install
    system "echo", "Hello"
  end

  test do
    system "true"
  end
end
