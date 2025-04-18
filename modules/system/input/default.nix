{ ... }:

{
  config = {
    console.useXkbConfig = true;
    services = {
      libinput.enable = true;
      xserver = {
        autoRepeatDelay = 300;
        autoRepeatInterval = 50;
        xkb = {
          layout = "us";
          options = "caps:swapescape";
        };
      };
    };
  };
}
