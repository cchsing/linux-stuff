# nmcli — command-line tool for controlling NetworkManager

nmcli is a command-line tool for controlling NetworkManager and reporting network status. It can be utilized as a replacement for nm-applet or other graphical clients. nmcli is used to create, display, edit, delete, activate, and deactivate network connections, as well as control and display network device status.

- nmcli con mod enps03 ipv4.addresses 192.168.2.20/24
- nmcli con mod enps03 ipv4.gateway 192.168.2.1
- nmcli con mod enps03 ipv4.dns “8.8.8.8”
- nmcli con mod enps03 ipv4.method manual
- nmcli con up enps03
- nmcli con mod enp0s3 connection.autoconnect yes
- nmcli connection modify "Wired connection 1" connection.id "enp0s8"
