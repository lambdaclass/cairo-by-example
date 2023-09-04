#!/usr/bin/env bash
# USAGE: installer.sh <VERSION>
# if version is not declared, version will be assumed as 'latest'.

set -e

RST='\033[0m '       # No Color, Reset.
LOG='\033[1;93m[!] ' # Yellow.
VIO='\033[1;95m '    # Violet.
GRE='\033[32m[✓] '   # Green
ERR='\033[1;31m[✗] ' # Strong red.

# Check the operating system
os=$(uname -s)

# Cairo Version.
DEFAULT_VERSION="latest"

extract_version_from_url() {
	local url="$1"
	local version=$(curl -sIL "$url" | grep -i "location:" | grep -oE "[0-9]+\.[0-9]+\.[0-9]+")
	echo "$version"
}

check_version_existence() {
	curl --output /dev/null --silent --head --fail "https://github.com/starkware-libs/cairo/releases/tag/v$1"
}

set_version() {
	if [[ "$1" == "latest" ]]; then
		REAL_VERSION=$(extract_version_from_url "https://github.com/starkware-libs/cairo/releases/latest/")
		VERSION="${REAL_VERSION}"
		LATEST="(latest)"
		echo -e "${GRE}Version v$VERSION $LATEST for cairo found!"
	elif [[ "$1" =~ ^[0-9]+\.[0-9]+\.[0-9]+(-[a-zA-Z0-9]+(\.[a-zA-Z0-9]+)*)?$ ]]; then
		if check_version_existence "$1"; then
			echo -e "${GRE}Version v$1 for cairo found!"
			VERSION="$1"
		else
			echo -e "${ERR}Version v$1 doesn't exist on GitHub releases. Assuming 'latest'"
			REAL_VERSION=$(extract_version_from_url "https://github.com/starkware-libs/cairo/releases/latest/")
			VERSION="${REAL_VERSION}"
			LATEST="(latest)"
		fi
	else
		echo -e "${LOG}Invalid version argument '$1', assuming 'latest'.${RST}"
		LATEST_URL="https://github.com/starkware-libs/cairo/releases/latest/"
		REAL_VERSION=$(extract_version_from_url "$LATEST_URL")
		VERSION="${REAL_VERSION}"
		LATEST="(latest)"
	fi
}

install() {
	case "$1" in
	macos)
		echo -e "${LOG}Installing Cairo ${VERSION} on Mac OS ${RST}"
		echo -e "${VIO}➜${RST} Downloading cairo-lang $VERSION $LATEST"
		brew tap lambdaclass/cairo-lang
		brew install lambdaclass/cairo-lang/cairo-lang@$VERSION
		corelib="$(brew --cellar cairo-lang@$VERSION)/$VERSION/corelib"
		if [[ -f /Users/${USER}/.zshrc ]]; then
			echo "export CARGO_MANIFEST_DIR=\"${corelib}\"" >>/Users/${USER}/.zshrc
			echo "~/.zshrc has been populated with the required environment variable"
			echo "For cairo to work in the current shell, you need to set it manually:"
			echo "export CARGO_MANIFEST_DIR=\"${corelib}\""
		elif [[ -f /Users/${USER}/.bashrc ]]; then
			echo "export CARGO_MANIFEST_DIR=\"${corelib}\"" >>/Users/${USER}/.bashrc
			echo "~/.bashrc has been populated with the required environment variable"
			echo "For cairo to work in the current shell, you need to set it manually:"
			echo "export CARGO_MANIFEST_DIR=\"${corelib}\""
		else
			echo "For cairo to work, please set the CARGO_MANIFEST_DIR environment variable in your shell of choice with the following value:"
			echo "export CARGO_MANIFEST_DIR=\"${corelib}\""
		fi
		;;
	arch)
		echo -e "${LOG}Installing Cairo ${VERSION} on Arch Linux ${RST}"
		[[ ! -e /usr/bin/yay ]] && echo -e "${ERR}No yay installation found. If you use another AUR helper, please install the cairo-lang package.${RST}"
		set -x
		yay -S cairo-lang
		set +x
		;;
	debian-based)
		# XXX: Script for debian/ubuntu is not working (missing corelib/)
		exit 1
		# 	[[ ! -e /etc/os-release ]] && exit 1
		# 	echo -e "${LOG}--- Installing Cairo ${VERSION} on Debian/Ubuntu --- ${RST}"
		# 	echo -e "${VIO}==>${RST} Downloading .deb file..."
		# 	set -x
		# 	wget -O /tmp/cairo_${VERSION}_amd64.deb https://github.com/lambdaclass/cairo-by-example/releases/download/v${VERSION}/cairo_${VERSION}-1_amd64.deb
		# 	set +x
		# 	echo -e "${VIO}==>${RST} Installing cairo-lang..."
		# 	sudo dpkg -i /tmp/cairo_${VERSION}_amd64.deb
		;;
	linux-unknown)
		echo -e "${LOG}Detected installation for unknown Linux distro ${RST}"
		set -x
		curl -L https://github.com/franalgaba/cairo-installer/raw/main/bin/cairo-installer | bash
		set +x
		;;
	windows)
		echo -e "${LOG}Installing Cairo ${VERSION} on Windows ${RST}"
		set -x
		# TODO: Add command for Windows here
		set +x
		echo -e "${ERR}Windows installation is still WIP."
		;;
	esac
}

### PROGRAM ###

set_version $1

case "$os" in
Darwin)
	install "macos"
	;;
Linux)
	[[ ! -e /etc/os-release ]] && exit 1
	source /etc/os-release
	case "$ID" in
	arch)
		install "arch"
		;;
	debian | ubuntu)
		install "debian-based"
		;;
	*)
		install "linux-unknown"
		;;
	esac
	;;
CYGWIN* | MINGW* | MSYS*)
	install "windows"
	;;

*)
	echo -e "Unsupported operating system: $os"
	exit 1
	;;
esac
