# Exposes home-levels options
{lib, ...}: {
  # options.var = {};

  options.var = {
    terminal = lib.mkOption {
      type = lib.types.str;
      default = "";
    };

    shell = lib.mkOption {
      type = lib.types.str;
      default = "bash";
    };
  };
}
