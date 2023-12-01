{
  description = "NyanSystems website and its web infra";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... } @inputs:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };
      in
      {
        devShell = pkgs.mkShell {
          buildInputs = [ 
            pkgs.llvmPackages.llvm
            pkgs.llvmPackages.clang
            pkgs.cmake
            # Add any other dependencies your project needs
          ];
        };
      }
    );
}
