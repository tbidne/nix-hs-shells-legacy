{ compilerVersion
, hash ? null
, flake-path ? null
, hash-or-flake
}:

let
  pkgs = hash-or-flake { inherit flake-path hash; };
  compiler = pkgs.haskell.packages."${compilerVersion}";
in
pkgs.mkShell {
  buildInputs =
    [
      pkgs.cabal-install
      compiler.ghc
    ];
}
