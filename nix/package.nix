{
  lib,
  stdenv,
  zig,
  nix,
  forceStatic ? false,
}:
stdenv.mkDerivation {
  pname = "zon2nix";
  version = "0.1.2";

  src = ../.;

  nativeBuildInputs = [
    zig.hook
  ];

  zigBuildFlags = [
    "-Dnix=${lib.getExe nix}"
    "-Dlinkage=${if forceStatic || stdenv.hostPlatform.isStatic then "static" else "dynamic"}"
  ];

  zigCheckFlags = [
    "-Dnix=${lib.getExe nix}"
    "-Dlinkage=${if forceStatic || stdenv.hostPlatform.isStatic then "static" else "dynamic"}"
  ];
}
