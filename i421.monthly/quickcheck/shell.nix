{ nixpkgs ? import <nixpkgs> {}, compiler ? "ghc822" }:
let
  inherit (nixpkgs) pkgs;
  ghc = pkgs.haskell.packages.${compiler}.ghcWithPackages (ps: with ps; [
    QuickCheck
  ]);
in
pkgs.stdenv.mkDerivation {
  name = "my-haskell-env-0";
  buildInputs = [ ghc pkgs.glib ];
  nativeBuildInputs = [ pkgs.pkgconfig ];
  shellHook = "eval $(egrep ^export ${ghc}/bin/ghc)";
}
