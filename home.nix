# In /etc/nixos/my-nixfiles/home.nix
{ pkgs, lib, ... }:

{
  nova.desktop.browser.enable = lib.mkForce false;
	home-manager.users.nova = {
    # Taskbar
    dconf.settings."org/gnome/shell".favorite-apps = [
      "google-chrome.desktop"
      "code.desktop"
    ];

    # Packages
    home.packages = with pkgs;  [
      nix-output-monitor
      btop
      google-chrome
    ];

    # Program settings
    programs = {
      git = {
        userName = lib.mkForce "Terry Tian";
        userEmail = lib.mkForce "97772315+tytia@users.noreply.github.com";
      };

      vscode = {
        package = lib.mkForce pkgs.vscode; # Use code instead of codium

        userSettings = {
          "workbench.colorTheme" = "One Dark Pro";
        };
        
        extensions = with pkgs.vscode-extensions; [
          # Themes
          zhuangtongfa.material-theme # One Dark Pro
        ];
      };
    };

    # Shell aliases
    home.shellAliases = lib.mkMerge [
      {}
      {
        code = lib.mkForce "code"; # Remove the 'code = codium' alias
      }
    ];
  };
}
