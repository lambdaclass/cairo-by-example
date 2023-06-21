class Cairo < Formula
  desc "Cairo language installation"
  homepage "https://cairo-by-example.com/"
  url "https://github.com/starkware-libs/cairo/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "e13ff5a2375e3520f4f1f5fa7d251f362ea42c428490ef15137460bdac637bb4"
  version "v1.1.0"
  license "MIT"

  def install
    ENV.prepend_path "PATH", "/Users/#{ENV["USER"]}/.cargo/bin"
    `rustup override set stable`
    `rustup update`
    `cargo build --all --release --manifest-path ./Cargo.toml`
    bin.install "./target/release/cairo-run"
  end

  test do
    system "true"
  end
end
