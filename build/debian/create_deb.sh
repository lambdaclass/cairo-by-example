#!/usr/bin/env bash
# USAGE: create_deb.sh <compile>

set -ex

# Get the releases using GitHub API
RELEASES=$(curl -s "https://api.github.com/repos/starkware-libs/cairo/releases")

for release in $(seq 0 $(($(echo $RELEASES | jq length) - 1))); do
	VERSION=$(echo $RELEASES | jq .[$release].tag_name | sed 's/"//g' | tr -d "v")

	FORMULA_FILE="cairo-lang@$VERSION"
	if [[ $1 == "compile" ]]; then
		DOWNLOAD_URL="https://github.com/starkware-libs/cairo/archive/refs/tags/v$VERSION.tar.gz"
		mkdir -p $FORMULA_FILE/DEBIAN/
		cd $FORMULA_FILE
		curl -sLOJ $DOWNLOAD_URL
		tar -xzf cairo-$VERSION.tar.gz --strip-components=1
		rustup override set stable
		cargo build --all --release --manifest-path ./Cargo.toml

		mkdir -p usr/bin usr/lib/
		mv "./target/release/cairo-compile" usr/bin/
		mv "./target/release/cairo-format" usr/bin/
		mv "./target/release/cairo-language-server" usr/bin/
		mv "./target/release/cairo-run" usr/bin/
		mv "./target/release/cairo-test" usr/bin/
		mv "./target/release/sierra-compile" usr/bin/
		mv "./target/release/starknet-compile" usr/bin/
		mv "./target/release/starknet-sierra-compile" usr/bin/
		mv corelib/ usr/lib/

		ls -A | grep -vE "^(DEBIAN|usr)$" | xargs rm -rf
	fi

	cd $FORMULA_FILE
	cat >"DEBIAN/control" <<EOL
Source: cairo-lang
Section: development
Version: $VERSION
Maintainer: LambdaClass <infra@lambdaclass.com>
Package: cairo-lang
Architecture: amd64
Description: Cairo programming language
 Cairo is the first Turing-complete language for creating provable programs for
 general computation.
EOL
	cat >"DEBIAN/postinst" <<EOL
echo "Please export the variable CARGO_MANIFEST_DIR=/usr/lib/corelib/ to your shell's config file."
EOL
	chmod 0755 DEBIAN/postinst
	cd ..
	dpkg-deb --build cairo-lang@$VERSION

done

echo "All deb files created."
