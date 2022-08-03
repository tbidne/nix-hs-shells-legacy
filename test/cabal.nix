{ use-hash ? true }:

let
  pkgs-hash = { hash = "b39924fc7764c08ae3b51beef9a3518c414cdb7d"; };
  pkgs-flake = { flake-path = ./test-flake.lock; };

  pkgs-input =
    if use-hash
    then pkgs-hash
    else pkgs-flake;

  cabal-input = { ghc-version = "ghc923"; };
in
(import ../default.nix).cabal-shell (cabal-input // pkgs-input)
