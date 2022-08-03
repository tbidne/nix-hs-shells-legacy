{ compilerVersion
, name
, stackYaml
, hash ? null
, flake-path ? null
, hash-or-flake
}:

let
  pkgs = hash-or-flake { inherit flake-path hash; };
  compiler = pkgs.haskell.packages."${compilerVersion}";
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

  STACK_YAML = stackYaml;
}
