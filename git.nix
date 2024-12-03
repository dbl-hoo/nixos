{ config, pkgs, ...}:

{
    # git configuration
  programs.git = {
    enable = true;
    userName = "Jason Kirkham";
    userEmail = "jason.kirkham@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}