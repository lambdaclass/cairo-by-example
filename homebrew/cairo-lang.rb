class CairoLang < Formula
  desc "Cairo language installation"
  homepage "https://cairo-by-example.com/"
  url "https://github.com/starkware-libs/cairo/archive/refs/tags/v2.0.0-rc4.tar.gz"
  sha256 "e3dd3ce3f9ab5b69c44d01b13777d92516dcd830efb6a3d2cd46915d4f03e8a9"
  version "v2.0.0-rc4"
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
    bin.install "./target/release/cairo-compile"
    bin.install "./target/release/cairo-format"
    bin.install "./target/release/cairo-language-server"
    bin.install "./target/release/cairo-run"
    bin.install "./target/release/cairo-test"
    bin.install "./target/release/sierra-compile"
    bin.install "./target/release/starknet-compile"
    bin.install "./target/release/starknet-sierra-compile"

  end

  def exists(path)
    `sh -c \"which -s #{path}\"`
    return ($?.success?)
  end

  test do
    system "true"
  end
end
