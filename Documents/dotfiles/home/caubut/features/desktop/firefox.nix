{
  inputs,
  pkgs,
  ...
}: let
  firefox-nightly = pkgs.wrapFirefox
  inputs.firefox-nightly.packages.${pkgs.system}.firefox-nightly-bin.unwrapped {
    extraPolicies = {
      DisableTelemetry = true;
    };
  };
  arkenfox = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/arkenfox/user.js/master/user.js";
    name = "arkenfox";
    hash = "sha256-1HJwy2DicWZIIrNXlzzTi/nDPs4Q08NTx3Bs5kV60nE=";
  };
in {
  programs.firefox = {
    enable = true;
    package = firefox-nightly;
    # package = inputs.firefox-nightly.packages.${pkgs.system}.firefox-nightly-bin;
    # https://nix-community.github.io/home-manager/options.html#opt-programs.firefox.profiles
    # profiles = {
    #   # TODO: sops
    #   "christopher@aubut.me" = {
    #     # choose a profile name; directory is /home/<user>/.mozilla/firefox/profile_0
    #     id = 0; # 0 is the default profile; see also option "isDefault"
    #     name = "christopher@aubut.me"; # TODO: sops
    #     isDefault = true; # can be omitted; true if profile ID is 0
    #     settings = {
    #     };
    #   };
    #   "Unsafe" = {
    #     id = 1;
    #     name = "Unsafe";
    #     isDefault = false;
    #     settings = {
    #     };
    #   };
    #   # add profiles here...
    # };
  };
  # alias 'firefox-nightly' to 'firefox'
  # home.packages = [
  #   (pkgs.linkFarm "firefox" [
  #     {
  #       name = "bin/firefox";
  #       path = "${inputs.firefox-nightly.packages.${pkgs.system}.firefox-nightly-bin}/bin/firefox-nightly";
  #     }
  #   ])
  # ];
  # TODO: command-not-found db error
}
#{ config, pkgs, ... }:
#
#  let
#    lock-false = {
#      Value = false;
#      Status = "locked";
#    };
#    lock-true = {
#      Value = true;
#      Status = "locked";
#    };
#  in
#{
#  programs = {
#    firefox = {
#      enable = true;
#      package = pkgs.wrapFirefox pkgs.firefox-unwrapped {
#        extraPolicies = {
#          DisableTelemetry = true;
#          # add policies here...
#
#          /* ---- EXTENSIONS ---- */
#          ExtensionSettings = {
#            "*".installation_mode = "blocked"; # blocks all addons except the ones specified below
#            # uBlock Origin:
#            "uBlock0@raymondhill.net" = {
#              install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
#              installation_mode = "force_installed";
#            };
#            # add extensions here...
#          };
#
#          /* ---- PREFERENCES ---- */
#          # Set preferences shared by all profiles.
#          Preferences = {
#            "browser.contentblocking.category" = { Value = "strict"; Status = "locked"; };
#            "extensions.pocket.enabled" = lock-false;
#            "extensions.screenshots.disabled" = lock-true;
#            # add global preferences here...
#          };
#        };
#      };
#
#      /* ---- PROFILES ---- */
#      # Switch profiles via about:profiles page.
#      # For options that are available in Home-Manager see
#      # https://nix-community.github.io/home-manager/options.html#opt-programs.firefox.profiles
#      profiles ={
#        profile_0 = {           # choose a profile name; directory is /home/<user>/.mozilla/firefox/profile_0
#          id = 0;               # 0 is the default profile; see also option "isDefault"
#          name = "profile_0";   # name as listed in about:profiles
#          isDefault = true;     # can be omitted; true if profile ID is 0
#          settings = {          # specify profile-specific preferences here; check about:config for options
#            "browser.newtabpage.activity-stream.feeds.section.highlights" = false;
#            "browser.startup.homepage" = "https://nixos.org";
#            "browser.newtabpage.pinned" = [{
#              title = "NixOS";
#              url = "https://nixos.org";
#            }];
#            # add preferences for profile_0 here...
#          };
#        };
#        profile_1 = {
#          id = 1;
#          name = "profile_1";
#          isDefault = false;
#          settings = {
#            "browser.newtabpage.activity-stream.feeds.section.highlights" = true;
#            "browser.startup.homepage" = "https://ecosia.org";
#            # add preferences for profile_1 here...
#          };
#        };
#      # add profiles here...
#      };
#    };
#  };
#}
# TODO: arken
# #!/usr/bin/env bash
#
# install-arkenfox() {
# curl -fLo "$(find ~/snap/firefox/common/.mozilla/firefox/ -name '*\.default')/user.js" \
#   https://github.com/arkenfox/user.js/raw/master/user.js
# }
#
# # nightly for proton drive support until in main
# update-firefox() {
#   print-info "==> arkenfox\n"
#   if [[ -z "$(find ~/snap/firefox/common/.mozilla/firefox/ -path '*\.default/user.js')" ]]; then
#     print-info "===> installing\n"
#     install-arkenfox
#   elif [[ "$(date -r "$(find ~/snap/firefox/common/.mozilla/firefox/ -path '*\.default/user.js')" +%s)" -lt "$(date -d "yesterday" +%s)" ]]; then
#     print-info "===> upgrading\n"
#     install-arkenfox
#   else
#     print-info "\n  up to date\n\n"
#   fi
# }
#
# run-module true x86_64
