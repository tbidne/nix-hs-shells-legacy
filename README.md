# UPDATE 2023-02-18

## This repository -- intended to make haskell CI easier -- has been deprecated in favor of the `haskell/actions` github action. 

---

<div align="center">

# Nix HS Shells

[![MIT](https://img.shields.io/github/license/tbidne/nix-hs-shells?color=blue)](https://opensource.org/licenses/MIT)

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
