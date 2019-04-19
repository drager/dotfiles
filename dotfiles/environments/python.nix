with import <nixpkgs> {};

(python35.withPackages (ps: [ps.virtualenvwrapper])).env

