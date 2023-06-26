{ pkgs ? import <nixpkgs> { } }:
pkgs.mkShell {
  name = "cairo-test";
  nativeBuildInputs = with pkgs.buildPackages; [
    cairo
  ];
  shellHook = ''
    echo "Starting nix-shell"
  '';
}
