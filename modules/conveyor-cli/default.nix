{ lib, pkgs }:

pkgs.stdenv.mkDerivation rec {
  pname = "conveyor-cli";
  version = "unstable";

  src = pkgs.fetchurl {
    url = "https://app.conveyordata.com/api/info/cli/location/linux/amd64";
    name = "conveyor.tar.gz";
    hash = "sha256-wJaxfzCelbRVyk0JhFEovkU6OsItjDialkrBO7DL9lo=";
  };

  buildInputs = [
    pkgs.glibc 
    pkgs.stdenv.cc.cc.lib 
  ];

  nativeBuildInputs = [ pkgs.autoPatchelfHook ];

  installPhase = ''
    mkdir -p $out/bin
    cp linux/amd64/conveyor $out/bin/conveyor
    chmod +x $out/bin/conveyor
  '';

  meta = {
    description = "Conveyor CLI packaged natively for Nix";
    homepage = "https://conveyordata.com";
    license = lib.licenses.asl20;
    mainProgram = "conveyor";
    platforms = [ "x86_64-linux" ];
  };
}
