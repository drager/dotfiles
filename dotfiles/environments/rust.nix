let
  moz_overlay = import (builtins.fetchTarball https://github.com/mozilla/nixpkgs-mozilla/archive/master.tar.gz);
  pkgs = import <nixpkgs> { overlays = [ moz_overlay ]; };
  channel = pkgs.rustChannelOf {
     #date = "2019-01-06";
     #channel = "nightly";
     channel = "stable";
  };
  rust = (channel.rust.override {
    targets = [ "wasm32-unknown-unknown" ];
  });
in
  with pkgs;
  stdenv.mkDerivation {
    name = "rust-ofdb-dev-env";
    buildInputs = [
      rust
      cmake
      pkgconfig
      openssl
    ];
    LD_LIBRARY_PATH="${stdenv.cc.cc.lib}/lib64:$LD_LIBRARY_PATH";
}
