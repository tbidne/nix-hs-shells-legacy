{
  description = "Provides minimal cabal and stack shells.";
  inputs.flake-compat = {
    url = "github:edolstra/flake-compat";
    flake = false;
  };
  inputs.nix-utils.url = "github:tbidne/nix-utils/main";
  outputs =
    { flake-compat
    , nix-utils
    , self
    }:
    let
      with_hof = { pkgs-hash-or-flake = nix-utils.pkgs-hash-or-flake; };
    in
    {
      cabal-shell = input: import ./lib/cabal-shell.nix (input // with_hof);
      stack-shell = input: import ./lib/stack-shell.nix (input // with_hof);
    };
}
