{
  inputs = {
    opam-nix.url = "github:tweag/opam-nix";
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.follows = "opam-nix/nixpkgs";
  };
  outputs = { self, flake-utils, opam-nix, nixpkgs }@inputs:
    let package = "safemoney";
    in flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        on = opam-nix.lib.${system};
        devPackagesQuery = {
          ocaml-lsp-server = "*";
        };
        query = devPackagesQuery // {
          ocaml-base-compiler = "4.14.0";
        };
        scope =
          on.buildOpamProject { } package ./. query;
      in {
        legacyPackages = scope;

        packages.default = self.legacyPackages.${system}.${package};
      });
}