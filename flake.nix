{
  description = "NyanSystems website and its web infra";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... } @inputs:
    flake-utils.lib.eachDefaultSystem (system:
      let
        # Extract the lib folder from a package
        getLibFolder = pkg: "${pkg}/lib";
        pkgs = import nixpkgs {
          inherit system;
        };
      in
      {
        devShell = pkgs.mkShell {
          buildInputs = [ 
            pkgs.gcc
            pkgs.llvmPackages.llvm
            pkgs.llvmPackages.clang
            pkgs.cmake
            # Add any other dependencies your project needs
          ];

          # Set the LD_LIBRARY_PATH 
          LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath [
            (getLibFolder pkgs.gcc)
            (getLibFolder pkgs.llvmPackages.llvm)
          ];

        };
      }
    );
}
