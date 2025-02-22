{
  lib,
  confFile ? ../.ocamlformat,
}:
let
  config = lib.strings.splitString "\n" (builtins.readFile confFile);
  re = builtins.match "version\s*=\s*(.*)\s*$";
  version_line = lib.lists.findFirst (
    l: builtins.isList (re l)
  ) (throw "no version specified in .ocamlformat") config;
  version = builtins.elemAt (re version_line) 0;
in
builtins.trace "detect ocamlformat version: ${version}" version
