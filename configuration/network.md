## Passing WiFi/Internet from one computer to another(GNOME)
1. Connect two computers with an ethernet cable

On the computer that has internet access(is the "Gateway")
1. "Settings" app -> Network -> Select ethenet connection's settings button -> IPv4 -> Mode(Share to others)
2. In terminal type "ip addr" and remember the IPv4 address and subnet mask of the current "Gateway" computer

On the computer that has no internet access(is the node)
1. "Settings" app -> Network -> Select ethenet connection's settings button -> IPv4 -> Mode(Manual)
2. In the Gateway section add: IP address and subnet mask of the "Gateway" computer
4. Set the IP adress of the current computer(the node) to be in the same subnet as the "Gateway" and with the same subnet mask
5. In the DNS section add: 1.1.1.1(Cloudflare), 8.8.8.8(Google), 1.0.0.1(Cloudflare)
