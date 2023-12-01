{ pkgs ? import <nixpkgs> {} }:

let
  # Extract the lib folder from a package
  getLibFolder = pkg: "${pkg}/lib";
in
pkgs.mkShell {
  buildInputs = [
    pkgs.gcc
    pkgs.cmake
    pkgs.llvmPackages.llvm
    pkgs.llvmPackages.clang
  ];

  # Set the LD_LIBRARY_PATH so that the dynamic linker can find shared libraries
  LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath [
    (getLibFolder pkgs.gcc)
    (getLibFolder pkgs.llvmPackages.llvm)
  ];
}