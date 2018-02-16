{config, pkgs, ...}:
{
  config = {
    boot.kernelParams = [ "console=ttyS0" ];
    environment.systemPackages = [ pkgs.qemu ];
    systemd.services.qemu-guest-agent = {
      description = "Run the QEMU Guest Agent";
      path = [ pkgs.qemu ];
      script = "qemu-ga";
      serviceConfig = {
        Restart = "always";
        RestartSec = 0;
      };
    };
    services.udev.extraRules = ''SUBSYSTEM=="virtio-ports", ATTR{name}=="org.qemu.guest_agent.0",  TAG+="systemd" ENV{SYSTEMD_WANTS}="qemu-guest-agent.service"'';
  };
}
