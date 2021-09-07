with import <nixpkgs> {};

(python37.withPackages (ps: [ps.virtualenvwrapper])).env

