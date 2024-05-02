{ stdenv, fetchurl, unzip, fontconfig }:

stdenv.mkDerivation rec {
  pname = "font-monaspice";
  version = "3.2.1";

  dontPatch = true;
  dontConfigure = true;
  dontBuild = true;
  doCheck = false;
  dontFixup = true;

  src = fetchurl {
    url = "https://github.com/ryanoasis/nerd-fonts/releases/v3.2.1/download/Monaspace.zip";
    sha256 = "0zlgl5cpl9pz3b36kj2zpj486hr5xm1s9kyhnxv0a8r8v403xzv4";
  };

  nativeBuildInputs = [ unzip fontconfig ];

  unpackPhase = "unzip $src";

  installPhase = ''
    mkdir -p $out
    cp *.otf $out/
  '';
}
