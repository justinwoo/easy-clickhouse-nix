{ pkgs ? import <nixpkgs> { } }:

let
  mkClickhouseVersion = import ./mkClickhouseVersion.nix { inherit pkgs; };
in
{
  clickhouse_24 = mkClickhouseVersion {
    version = "v24.12.6.70-stable";

    amd64Url = "https://github.com/ClickHouse/ClickHouse/releases/download/v24.12.6.70-stable/clickhouse-common-static-24.12.6.70-amd64.tgz";
    amd64Sha256 = "0klchsx5xmkb1lhaxf654rzvnxw2sljvai6nrx5d0cychnbsb1g4";

    arm64Url = "https://github.com/ClickHouse/ClickHouse/releases/download/v24.12.6.70-stable/clickhouse-common-static-24.12.6.70-arm64.tgz";
    arm64Sha256 = "16599nq1izbp7fsavs877nkpyypimfri0jv4ykng1vpp4fndyg6w";
  };
}
