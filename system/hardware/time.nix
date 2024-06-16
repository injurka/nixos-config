{ systemSettings, ... }:

{
  time.hardwareClockInLocalTime = true;
  time.timeZone = systemSettings.timezone;
}
