{
  description = "Kirkham Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
		home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
		};
	};

  outputs = { nixpkgs, ... } @ inputs: 
	{
		nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
			specialArgs = { inherit inputs; };
			modules = [
				./configuration.nix
				inputs.home-manager.nixosModules.home-manager
			];
		};

	};

}
