{
  inputs,
  pkgs,
  ...
}:
# : let
#   srcjson = {
#     "version" = "3.181.23";
#     "deb" = {
#       "x86_64-linux" = {
#         "url" = "https://github.com/standardnotes/app/releases/download/%40standardnotes/desktop%403.181.23/standard-notes-3.181.23-linux-amd64.deb";
#         "hash" = "sha512-zWjST3guI0qifvZIwSLJ0nIpU12Mu3+m25Xdoqv0BQC7tscChEdCGUAJRUKHEf0b8l4uvp8qBGHiBOfbrIi//w==";
#       };
#       "aarch64-linux" = {
#         "url" = "https://github.com/standardnotes/app/releases/download/%40standardnotes/desktop%403.181.23/standard-notes-3.181.23-linux-arm64.deb";
#         "hash" = "sha512-7R5Ym44mrVgUiqdt6NL8F9uUUOroQRxwn30xKThyIQm2HGRUJivRfOws98El9zV8bKG1khk4DZaMiLQSMjrtaQ==";
#       };
#     };
#   };
#   standardnotes =
#     pkgs.standardnotes.override (_: {
#
#
#       });
# in {
{
  home.packages = [
    pkgs.standardnotes
    # inputs.nix-gl-host.defaultPackage.x86_64-linux
    # pkgs.libcanberra-gtk3
    # pkgs.mesa
  ];
}
