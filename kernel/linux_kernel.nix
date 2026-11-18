{ config, lib, pkgs, inputs, ... }:
{
#boot.kernelPackages = pkgs.linuxPackages;
boot.kernelPackages = lib.mkDefault pkgs.linuxPackages;
imports = [
 ../others/zfs.nix
];

}
