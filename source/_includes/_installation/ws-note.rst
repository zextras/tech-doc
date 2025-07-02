The WebSocket protocol is used by the |wsc| component. In case your
infrastructure lies behind an application firewall or any firewall
featuring :abbr:`DPI (Deep Packet Inspection)`, you need to explicitly
allow WebSocket packets on port 443, otherwise they will be
blocked. Indeed, these firewalls can recognise the type of packets or
the application that generated them and would allow only HTTPS traffic on
port 443: everything else would be blocked.

Additionally, the certificate that you use for your |product|
infrastructure must be configured to use WebSockets.
