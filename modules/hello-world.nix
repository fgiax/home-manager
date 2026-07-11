{
  perSystem = {
    pkgs,
    ...
  }: {
    packages.hello-world = pkgs.writeShellApplication {
      name = "hello-world";

      text = ''
        echo "Hello World!"
      '';
    };

    apps.default = {
      type = "app";
      program = "${pkgs.writeShellApplication {
        name = "hello-world";

        text = ''
          echo "Hello World!"
        '';
      }}/bin/hello-world";
    };
  };
}
