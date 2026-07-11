{
  description = "Hello World Flake";

  nixConfig = {
    bash-prompt = "[\"hello-world\"]$ ";
    bash-prompt-prefix = "(dev) ";
    bash-prompt-suffix = ">>> ";
  };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, utils }:
    utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        greeting = "\*\* You are in flake \*\*";
        hello-world = pkgs.stdenv.mkDerivation {
            pname = "hello-world";
            version = "1.0";

            src = ./src;

            nativeBuildInputs = [
              pkgs.bash
            ];

            installPhase = ''
              mkdir -p $out/bin
              cp hello-world $out/bin/hello-world
              patchShebangs $out/bin
            '';
          };

      in
      {
        packages = {
          default = hello-world;
          hello-world = hello-world;
        };

        devShells = with pkgs; {
          default = mkShell {
            packages = [ bash neovim hello-world ];
            SHELL = "${pkgs.bash}/bin/bash";
            EDITOR = "nvim";
            shellHook = ''
              echo "${greeting}"
              hello-world
            '';
            };
        };
      }
    );
}
