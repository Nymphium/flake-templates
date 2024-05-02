{ stdenv, fetchurl, unzip, fontconfig }:

stdenv.mkDerivation rec {
  pname = "font-genshingothic";
  version = "20150607";

  dontPatch = true;
  dontConfigure = true;
  dontBuild = true;
  doCheck = false;
  dontFixup = true;

  src = fetchurl {
    url = "https://ftp.iij.ad.jp/pub/osdn.jp/users/8/8637/genshingothic-20150607.zip";
    sha256 = "uOAPAKbiUXv+dc6ypzK1lv4AJFe4nAXBgda3E3Oq2lg=";
  };

  nativeBuildInputs = [ unzip fontconfig ];

  unpackPhase = "unzip $src";

  installPhase = ''
    mkdir -p $out
    cp *.ttf $out/
  '';
}
