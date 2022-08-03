{
  description = "Nix Utils";
  inputs.flake-compat = {
    url = "github:edolstra/flake-compat";
    flake = false;
  };
  inputs.nix-utils.url = "github:tbidne/nix-utils";
  outputs =
    { flake-compat
    , nix-utils
    , self
    }:
    let
      with_hof = { hash-or-flake = nix-utils.hash-or-flake; };
    in
    {
      cabal_base = input: import ./lib/cabal_base.nix (input // with_hof);
      stack_base = input: import ./lib/stack_base.nix (input // with_hof);
    };
}
