# CAMPUSFit Occupancy

This Nix-packaged script parses the current occupancy of [CAMPUSFit at Hochschulsport Hannover](https://www.hochschulsport-hannover.de/de/campusfit) out of an [PNG image](https://web.hochschulsport-hannover.de/campusfit/auslastungsgrafik) published on their website, using ImageMagick and Tesseract OCR.

This script is intended for personal data mining purposes.

## Usage

Execute this script on nix-enabled systems via `nix run`.
The script needs write permissions on the current working directory to store a temporary file.
