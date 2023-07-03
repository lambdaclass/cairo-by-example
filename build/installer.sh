#!/bin/bash

set -e

RST='\033[0m'                           # No Color, Reset.
YEL='\033[1;93m'                        # Yellow.
VIO='\033[1;95m'                        # Violet.
ERR='\033[1;31m'                        # Strong red.

# Check the operating system
os=$(uname -s)

# Cairo Version.
version="2.0.0-rc4"

case "$os" in

	# Mac OS
	Darwin)
		echo -e "${YEL}--- Installing Cairo ${version} on Mac OS --- ${RST}"
		if [[ ! $(command -v rustc) ]]; then
			echo -e "${ERR}==>${RST} Rust compiler not found, please install it (homebrew or manually), and run the script again."
			exit 1
		fi
		echo -e "${VIO}==>${RST} Downloading cairo-lang"
		set -x
		curl -o /tmp/cairo-lang.rb https://raw.githubusercontent.com/lambdaclass/cairo-by-example/main/build/homebrew/cairo-lang.rb && brew install --formula --build-from-source /tmp/cairo-lang.rb
		set +x
		corelib="$(brew --cellar cairo-lang)/$(brew list --versions cairo-lang | tr ' ' '\n' | tail -1)/corelib"
		if [[ -f /Users/${USER}/.zshrc ]]; then
			echo "export CARGO_MANIFEST_DIR=\"${corelib}\"" >> /Users/${USER}/.zshrc
			echo "~/.zshrc has been populated with the required environment variable"
			echo "For cairo to work in the current shell, you need to set it manually:"
			echo "export CARGO_MANIFEST_DIR=\"${corelib}\""
		elif [[ -f /Users/${USER}/.bashrc ]]; then
			echo "export CARGO_MANIFEST_DIR=\"${corelib}\"" >> /Users/${USER}/.bashrc
			echo "~/.bashrc has been populated with the required environment variable"
			echo "For cairo to work in the current shell, you need to set it manually:"
			echo "export CARGO_MANIFEST_DIR=\"${corelib}\""
		else
			echo "For cairo to work, please set the CARGO_MANIFEST_DIR environment variable in your shell of choice with the following value:"
			echo "export CARGO_MANIFEST_DIR=\"${corelib}\""
		fi
		;;

	# Linux
	Linux)
		distro=""
		[[ ! -e /etc/os-release ]] && exit 1
		source /etc/os-release
		case "$ID" in
			# XXX: Scripts for arch and debian/ubuntu are not working (missing corelib/)
			# arch)
			# 	echo -e "${YEL}--- Installing Cairo ${version} on Arch Linux --- ${RST}"
			# 	[[ ! -e /usr/bin/yay ]] && echo -e "${ERR}No yay installation found. If you use another AUR helper, please install the cairo-lang package.${RST}"
			# 	set -x
			# 	yay -S cairo-lang
			# 	set +x
			# 	;;
			# debian | ubuntu)
			# 	[[ ! -e /etc/os-release ]] && exit 1
			# 	echo -e "${YEL}--- Installing Cairo ${version} on Debian/Ubuntu --- ${RST}"
			# 	echo -e "${VIO}==>${RST} Downloading .deb file..."
			# 	set -x
			# 	wget -O /tmp/cairo_${version}_amd64.deb https://github.com/lambdaclass/cairo-by-example/releases/download/v${version}/cairo_${version}-1_amd64.deb
			# 	set +x
			# 	echo -e "${VIO}==>${RST} Installing cairo-lang..."
			# 	sudo dpkg -i /tmp/cairo_${version}_amd64.deb
			# 	;;
			*)
				echo -e "${YEL}--- Detected installation for unknown Linux distro --- ${RST}"
				set -x
				wget https://github.com/franalgaba/cairo-installer/raw/main/bin/cairo-installer | bash
				set +x
				;;
			esac
		;;

	# Windows
	CYGWIN* | MINGW* | MSYS*)
		echo -e "${YEL}--- Installing Cairo ${version} on Windows --- ${RST}"
		set -x
		# TODO: Add command for Windows here
		set +x
		echo -e "${ERR} Windows installation is still WIP."
		exit 1
		;;

	*)
		echo -e "Unsupported operating system: $os"
		exit 1
		;;
esac
