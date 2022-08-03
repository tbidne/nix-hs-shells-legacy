{ use-hash ? true }:

let
  pkgs-hash = { hash = "b39924fc7764c08ae3b51beef9a3518c414cdb7d"; };
  pkgs-flake = { flake-path = ./test-flake.lock; };

  pkgs-input =
    if use-hash
    then pkgs-hash
    else pkgs-flake;

  stack-input = {
    ghc-version = "ghc923";
    name = "my-package";
    stack-yaml = "stack.yaml";
  };
in
(import ../default.nix).stack-shell (stack-input // pkgs-input)
