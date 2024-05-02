{ stdenv, fetchurl, unzip, fontconfig }:

stdenv.mkDerivation rec {
  pname = "source-han-serif-jp";
  version = "2.002";

  dontPatch = true;
  dontConfigure = true;
  dontBuild = true;
  doCheck = false;
  dontFixup = true;

  src = fetchurl {
    url = "https://github.com/adobe-fonts/source-han-serif/releases/download/2.002R/12_SourceHanSerifJP.zip";
    sha256 = "1fqgxka5ddwqm63q9av3c00x04p1ia4f1gg3adb0ibx3nxbay0rc";
  };

  nativeBuildInputs = [ unzip fontconfig ];

  unpackPhase = "unzip $src";

  installPhase = ''
    mkdir -p $out/share/fonts/
    cp SubsetOTF/JP/*.otf $out/share/fonts/
  '';
}
