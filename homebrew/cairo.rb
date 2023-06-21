class Cairo < Formula
  desc "Cairo language installation"
  homepage "https://cairo-by-example.com/"
  url "https://github.com/starkware-libs/cairo/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "e13ff5a2375e3520f4f1f5fa7d251f362ea42c428490ef15137460bdac637bb4"
  version "v1.1.0"
  license "MIT"

  def install
    $method = ""

    # Check for manually installed rust
    $method = "manual" if (exists("/Users/$USER/.cargo/bin/rustc"))
    # Check for brewed rust
    $method = "brew" if exists("/opt/homebrew/bin/rustc")

    print("Installation method is: " + $method.upcase + "\n")

    if $method == "manual"
      current_user=ENV["USER"]
      ENV.prepend_path "PATH", "/Users/#{current_user}/.cargo/bin/"
    end

    print(`echo $PATH`)
    print(`which rustc`)
    print(`rustup override set stable`)
    print(`rustup update`)
    print(`cargo build --all --release --manifest-path ./Cargo.toml`)
    bin.install "./target/release/cairo-run"

  end

  def exists(path)
    `sh -c \"which -s #{path}\"`
    return ($?.success?)
  end

  test do
    system "true"
  end
end
