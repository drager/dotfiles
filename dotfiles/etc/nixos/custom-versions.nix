{ lib, config, ... }:

# https://gist.github.com/joepie91/ce9267788fdcb37f5941be5a04fcdd0f#installing-a-few-packages-from-master

let
  nixpkgsRemote = remote: rev: import (builtins.fetchTarball "https://github.com/${remote}/nixpkgs/archive/${rev}.tar.gz") {
    config = config.nixpkgs.config;
  };

  remotes = lib.mapAttrs (_: nixpkgsRemote) {
    upstream = "nixos";
  };
in with remotes;
{
  nixpkgs.config.packageOverrides = {
    # WARNING! Don't name the remote the same as the package you're trying to
    # install, the package will get overridden

    master = builtins.trace
      "Warning: master is impure. Using this might have unexpected consequences!"
      (upstream "master");
    vscode-1-32-3 = upstream "2c6876d81bee4e0dcfc4bdcf29f391f6f5152c78";
    android-studio-3-4-0 = upstream "01361a1791bf31a513b5cdb1ad200d15efe4b379";
    yarn-1-17 = upstream "cf081b250dff0a17a7a905d2074e53c47fd23ff2";
    postman-7-6-0 = upstream "e4c243d6a0cca2490dc0063747a7cb6390e737b6";
    minikube-1-2-0 = upstream "90776e1de5b0d61793569ee4d4f5b15c3eca2346";
    bs-platform-x-x = upstream "725fd9feda147d2f5e772d8ea5d878f38dfcf50e";
    godot-3-2-3 = upstream "a7cbe40289ed7e2093ef55b1a639979753510e62";
    chrome-86 = upstream "a90362c888c67af6366e69ba1d5bf6cf03615ee8";
    rustup-1-22 = upstream "a90362c888c67af6366e69ba1d5bf6cf03615ee8";
    neovim-0-4-4 = upstream "e0f258f596bd943ec1a0ca25ddfc9e9b886f32cb";
    rust-analyzer-latest = upstream "a90362c888c67af6366e69ba1d5bf6cf03615ee8";
    mongodb-compass-latest = upstream "a90362c888c67af6366e69ba1d5bf6cf03615ee8";
    leftwm-0-2-5 = upstream "f5a21c70fda45a78056bc142278db1de883f6d5c";
  };
}
