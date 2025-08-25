The WebSocket protocol is used by the |wsc| component. In case your
infrastructure lies behind an application firewall or any firewall
featuring :abbr:`DPI (Deep Packet Inspection)`, you need to explicitly
allow WebSocket packets on port 443, otherwise they will be
blocked. Indeed, these firewalls can recognise the type of packets or
the application that generated them and would allow on port 443 only
HTTPS traffic: everything else would be blocked.

Additionally, the certificate that you use for your |product|
infrastructure must be configured to use WebSockets.

The |product| implementation of WebSocket includes version negotiation
between client and server, by using Websocket's subprotocols, see
:rfc:`6455#section-1.9`.
