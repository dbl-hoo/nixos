{
  description = "Kirkham Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }: {
    homeConfigurations = {
      kirkham = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux; # Use the provided nixpkgs input
        modules = [ ./home.nix ]; # Ensure `home.nix` exists and is valid
      };
    };

    # Optional defaultPackage definition for `nix run .`
    defaultPackage.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.hello; # Example
  };
}
