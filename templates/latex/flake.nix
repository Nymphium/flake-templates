{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, flake-utils, nixpkgs, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        texlive = pkgs.texlive.combine {
          inherit (pkgs.texlive) scheme-full fontspec;
        };

        genshingothic = with pkgs; callPackage ./nix/font-genshingothic.nix {
          inherit stdenv fetchurl unzip;
        };

        monaspice = with pkgs; callPackage ./nix/font-monaspice.nix {
          inherit stdenv fetchurl unzip;
        };

        source-han-serif-jp = with pkgs; callPackage ./nix/font-source-han-serif-jp.nix {
          inherit stdenv fetchurl unzip;
        };

        fonts = with pkgs; [
          source-han-serif-jp
          noto-fonts-cjk
          genshingothic
          monaspice
        ];
        OSFONTDIR = with builtins;
          concatStringsSep ":" (map (f: "${f}/share/fonts") fonts);
      in
      {
        legacyPackages = pkgs;
        devShells.default =
          pkgs.mkShell {
            buildInputs = [
              texlive
              pkgs.nil pkgs.nixpkgs-fmt
            ];
            shellHook = ''
              export OSFONTDIR=${OSFONTDIR}
              luaotfload-tool --update
            '';
          };
        formatter = pkgs.nixpkgs-fmt;
      });
}
