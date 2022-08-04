<div align="center">

# Nix HS Shells

[![GitHub release (latest SemVer)](https://img.shields.io/github/v/tag/tbidne/nix-hs-shells?include_prereleases&sort=semver)](https://github.com/tbidne/nix-hs-shells/releases/)
[![MIT](https://img.shields.io/github/license/tbidne/nix-hs-shells?color=blue)](https://opensource.org/licenses/MIT)
[![build](https://img.shields.io/github/workflow/status/tbidne/nix-hs-shells/ci/main)](https://github.com/tbidne/nix-hs-shells/actions/workflows/ci.yaml)

</div>

---

### Table of Contents
* [Cabal Shell](#cabal-shell)
* [Stack Shell](#stack-shell)

Provides minimal cabal and stack shells for haskell. This is primarily intended for CI, as development will likely want other tools e.g. IDEs, formatters.

## Cabal Shell

The cabal shell requires:

* `ghc-version`
* One of:
  * `hash`
  * `flake-path`

**Examples:**

```nix
cabal-shell {
  ghc-version = "ghc923";
  hash = "b39924fc7764c08ae3b51beef9a3518c414cdb7d";
  # optional, corresponds to nixpkgs determined by hash
  sha256 = "1yivdc9k1qcr29yxq9pz4qs2i29wgxj5y550kp0lz2wzp45ksi1x";
}

cabal-shell {
  ghc-version = "ghc923";
  flake-path = ./flake.lock;
  # optional
  extra = {};
}
```

## Stack Shell

The stack shell requires:

* `ghc-version`
* `name`
* `stack-yaml`
* One of:
  * `hash`
  * `flake-path`

**Examples:**

```nix
stack-shell {
  ghc-version = "ghc923";
  name = "my-package-name";
  stack-yaml = "stack.yaml";
  hash = "b39924fc7764c08ae3b51beef9a3518c414cdb7d";
  # optional, corresponds to nixpkgs determined by hash
  sha256 = "1yivdc9k1qcr29yxq9pz4qs2i29wgxj5y550kp0lz2wzp45ksi1x";
}

stack-shell {
  ghc-version = "ghc923";
  name = "my-package-name";
  stack-yaml = "stack.yaml";
  flake-path = ./flake.lock;
  # optional
  extra = {};
}
```