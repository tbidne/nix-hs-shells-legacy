{ use-hash ? true
, with-sha ? false
}:

let
  hash-set = { hash = "b39924fc7764c08ae3b51beef9a3518c414cdb7d"; };
  sha-set = { sha256 = "1yivdc9k1qcr29yxq9pz4qs2i29wgxj5y550kp0lz2wzp45ksi1x"; };
  pkgs-hash =
    if with-sha
    then hash-set // sha-set
    else hash-set;

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
