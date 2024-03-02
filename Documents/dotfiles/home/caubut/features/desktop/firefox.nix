{
  inputs,
  pkgs,
  ...
}: {
  programs.firefox = {
    enable = true;
    # use nightly package
    package = inputs.firefox-nightly.packages.${pkgs.system}.firefox-nightly-bin;
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
