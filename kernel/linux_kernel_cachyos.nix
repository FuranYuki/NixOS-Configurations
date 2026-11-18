{ config, lib, pkgs, inputs, ... }:
{
nix.settings = {
    substituters = [
      "https://cache.lantian.pub/lantian"           # nix-cachyos-kernel 的 Attic 缓存
    ];
    #trusted-public-keys = [
    #  "lantian:WVGO7vsRMSEN+h7Lp7kv6SAmrkEXgUGbbXm7jMDjBuQ="
    #  "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
    #];
};

nixpkgs.overlays = [ inputs.nix-cachyos-kernel.overlays.pinned ];

specialisation.linux_kernel_cachyos.configuration =
{ config, pkgs, ... }:
{
      system.nixos.tags = [ "linux_kernel_cachyos" ];
      boot.kernelPackages = pkgs.cachyosKernels."linuxPackages-cachyos-bore-x86_64-v3";
      boot.zfs.package = config.boot.kernelPackages.zfs_cachyos;
};

}
