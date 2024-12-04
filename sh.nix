{ config, pkgs, ...}:

let 
  myAliases = {
    pacman = "sudo pacman";
    install = "sudo pacman -S";
    c = "clear";
    ff = "fastfetch";
    pf = "pfetch";
    ls = "eza -a --icons";
    ll = "eza -al --icons";
    lt = "eza -a --tree --level=1 --icons";

    gs = "git status";
    ga = "git add";
    gc = "git commit -m";
    gp = "git push";
    gpl = "git pull";
    gst = "git stash";
    gsp = "git stash; git pull";
    gcheck = "git checkout";

    eh = "nano ~/.config/hypr/hyprland.conf";
    ez = "nano ~/.zshrc";
    ea = "nano ~/.aliases";
    e = "nano";

    enix = "sudo nano /etc/nixos/configuration.nix";
    switch = "sudo nixos-rebuild switch --flake $HOME/.dotfiles/.";
    flake = "home-manager switch --flake $HOME/.dotfiles/.";
    notes = "nano ~/notes.txt";

    update-grub = "sudo grub-mkconfig -o /boot/grub/grub.cfg";
  };

in

{
    programs.bash = {
    enable = true;
    shellAliases = myAliases;
  };
 
  programs.zsh = {
    enable = true;
    shellAliases = myAliases;
    initExtra = "
      cat ~/.cache/wallust/sequences \n 
      pfetch
      source ~/.p10k.zsh";
    plugins  = [
      {name = "powerlevel10k"; src = pkgs.zsh-powerlevel10k;file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";}
    ];
    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
  };
}