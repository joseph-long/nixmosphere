{
  imports = [ <nixpkgs/nixos/maintainers/scripts/openstack/nova-image.nix>
              ../services/enable-guest-agent.nix
            ];
  environment.systemPackages = [ (import ./packages/my-hello.nix) ];
}
