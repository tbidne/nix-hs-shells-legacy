{ ghc-version
, name
, stack-yaml
, hash ? null
, sha256 ? null
, flake-path ? null
, extra ? null
, pkgs-hash-or-flake
}:

let
  pkgs = pkgs-hash-or-flake { inherit hash sha256 flake-path extra; };
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
