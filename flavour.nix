let
  name = "test";
  driver = ./driver.py;
  description = "test git driver";
in
{
  inherit name driver description;
  compose = { pkgs ? import <nixpkgs> {}, ... }:

  pkgs.writeTextFile {
    name = "compose-info.json";
    text = builtins.toJSON({
      inherit driver;
      flavour = name;
    });
  };
}
