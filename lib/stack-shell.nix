{ ghc-version
, name
, stack-yaml
, hash ? null
, flake-path ? null
, pkgs-hash-or-flake
}:

let
  pkgs = pkgs-hash-or-flake { inherit flake-path hash; };
  compiler = pkgs.haskell.packages."${ghc-version}";
in
pkgs.haskell.lib.buildStackProject {
  inherit name;

  buildInputs = with pkgs; [
    git
    stack
    zlib.dev
    zlib.out
  ];

  ghc = compiler.ghc;

  STACK_YAML = stack-yaml;
}