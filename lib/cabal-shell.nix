{ ghc-version
, hash ? null
, sha256 ? null
, flake-path ? null
, pkgs-hash-or-flake
}:

let
  pkgs = pkgs-hash-or-flake { inherit hash sha256 flake-path; };
  compiler = pkgs.haskell.packages."${ghc-version}";
in
pkgs.mkShell {
  buildInputs =
    [
      pkgs.cabal-install
      compiler.ghc
    ];
}
