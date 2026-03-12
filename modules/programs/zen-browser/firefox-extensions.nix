{
  lib,
  pkgs,
  inputs,
  ...
}: {
  extensions.packages = with (import inputs.nixpkgs-unstable {
    inherit (pkgs.stdenv.hostPlatform) system;
    config.allowUnfree = true;
  }).callPackage
  inputs.firefox-addons {
    buildMozillaXpiAddon = lib.makeOverridable (
      {
        pname,
        version,
        addonId,
        url ? "",
        urls ? [],
        sha256,
        meta,
        ...
      }:
        pkgs.stdenv.mkDerivation {
          name = "${pname}-${version}";
          inherit meta;
          src = pkgs.fetchurl {inherit url urls sha256;};
          preferLocalBuild = true;
          allowSubstitutes = true;
          passthru = {inherit addonId;};
          buildCommand = ''
            dst="$out/share/mozilla/extensions/{ec8030f7-c20a-464f-9b0e-13a3a9e97384}"
            mkdir -p "$dst"
            install -v -m644 "$src" "$dst/${addonId}.xpi"
          '';
        }
    );
  }; [
    ublock-origin
    clearurls
    don-t-fuck-with-paste
    istilldontcareaboutcookies
    bitwarden
    keepassxc-browser
    indie-wiki-buddy

    bonjourr-startpage
    brotab

    save-all-images-webextension

    improved-tube
    dearrow
    sponsorblock
    control-panel-for-twitter
  ];
}
