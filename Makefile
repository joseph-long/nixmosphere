.PHONY: all
all: nixos.qcow2
nixos.qcow2:
	nix-build '<nixpkgs/nixos>' -A config.system.build.novaImage --arg configuration "{ imports = [ <nixpkgs/nixos/maintainers/scripts/openstack/nova-image.nix> ./enable-guest-agent.nix ]; }"
