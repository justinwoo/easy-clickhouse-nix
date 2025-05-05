{ pkgs ? import <nixpkgs> { }
}:

{ version
, amd64Url
, amd64Sha256
, arm64Url
, arm64Sha256
}:

pkgs.stdenv.mkDerivation {
  name = "clickhouse-client";

  version = version;

  src =
    if pkgs.stdenv.hostPlatform.system == "x86_64-linux" then
      pkgs.fetchzip
        {
          url = amd64Url;
          sha256 = amd64Sha256;
        }
    else if pkgs.stdenv.hostPlatform.system == "aarch64-linux" then
      pkgs.fetchzip
        {
          url = arm64Url;
          sha256 = arm64Sha256;
        }
    else
      throw "Unsupported platform: ${pkgs.stdenv.hostPlatform.system}";


  dontStrip = true;

  installPhase = ''
    mkdir -p $out/bin

    install -D -m555 -T $src/usr/bin/clickhouse $out/bin/clickhouse

    mkdir -p $out/etc/bash_completion.d/
    cp $src/usr/share/bash-completion/completions/clickhouse $out/etc/bash_completion.d/clickhouse
  '';
}
