{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs, ... }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs {inherit system;};
  in {
    packages.${system}.default =
      pkgs.writeShellScriptBin "cafi-occupancy" ''
        set -e
        ${pkgs.wget}/bin/wget --quiet -O tmp.png "https://web.hochschulsport-hannover.de/campusfit/auslastungsgrafik"
        ${pkgs.imagemagick}/bin/magick tmp.png -crop 800x240+330+150 tmp.png
        ${pkgs.imagemagick}/bin/magick tmp.png -fuzz 30% -fill transparent +opaque "#8DC63FFF" tmp.png
        ${pkgs.imagemagick}/bin/magick tmp.png -alpha off -threshold 50% -negate tmp.png
        ${pkgs.tesseract}/bin/tesseract --psm 8 tmp.png stdout nobatch digits
        rm tmp.png
      '';
  };
}
