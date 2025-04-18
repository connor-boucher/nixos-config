{ config, ... }:

{
  config = {
    time.timeZone = config.my.host.locale.time;
    i18n.defaultLocale = config.my.host.locale.locale;
  };
}
