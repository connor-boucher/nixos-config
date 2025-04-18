{ config, ... }:

{
  config.networking = {
    hostName = config.my.host.name;
    networkmanager.enable = true;
  };
}
