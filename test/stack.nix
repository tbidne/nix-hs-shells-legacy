{ test ? "hash" }:

let
  pkgs-hash = { hash = "b39924fc7764c08ae3b51beef9a3518c414cdb7d"; };
  pkgs-flake = { flake-path = ./test-flake.lock; };

  pkgs-input =
    if test == "hash"
    then pkgs-hash
    else
      if test == "flake"
      then pkgs-flake
      else throw "Expected 'hash' or 'flake' for arg 'test', received ${test}";

  stack-input = {
    ghc-version = "ghc923";
    name = "my-package";
    stack-yaml = "stack.yaml";
  };
in
(import ../default.nix).stack-shell (stack-input // pkgs-input)
