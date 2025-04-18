{ config, ... }:

{
  config.users.users.${config.my.user.username} = {
    isNormalUser = true;
    description = config.my.user.name;
    extraGroups = [ "networkmanager" "wheel" ];
    shell = config.my.user.shell;
  };
}
