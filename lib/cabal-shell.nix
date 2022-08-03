{ ghc-version
, hash ? null
, flake-path ? null
, pkgs-hash-or-flake
}:

let
  pkgs = pkgs-hash-or-flake { inherit flake-path hash; };
  compiler = pkgs.haskell.packages."${ghc-version}";
in
pkgs.mkShell {
  buildInputs =
    [
      pkgs.cabal-install
      compiler.ghc
    ];
}
