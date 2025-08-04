# In /etc/nixos/my-nixfiles/home.nix
{ pkgs, lib, ... }:

{
  nova.desktop.browser.enable = lib.mkForce false;
  peripherals.realsense.enable = lib.mkForce false;
	home-manager.users.nova = {lib, ...}: {
    # disable auto screen lock
    dconf.settings."org/gnome/desktop/session".idle-delay = lib.hm.gvariant.mkUint32 0;
    # Taskbar
    dconf.settings."org/gnome/shell".favorite-apps = [
      "google-chrome.desktop"
      "com.github.th_ch.youtube_music.desktop"
      "code.desktop"
      "clion.desktop"
      "slack.desktop"
      "discord.desktop"
    ];

    # Packages
    home.packages = with pkgs;  [
      nix-output-monitor
      btop
      google-chrome
      youtube-music
      slack
      discord
      jetbrains.pycharm-professional
      jetbrains.clion
      github-desktop
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
          ms-python.python
          ms-python.vscode-pylance
          github.copilot-chat
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
