# How-to: Activate a license

Carbonio requires a valid subscription license issued by Zextras. This license unlocks enterprise features, enforces mailbox limits, and governs pay-per-use models.

## Network requirements

| Property | Value |
| :--- | :--- |
| **Endpoint** | `api.zextras.io` |
| **Protocol/Port** | HTTPS over TCP/443 |
| **Direction** | Outbound only |
| **Node** | Mailstore/Provisioning node |

Only the **Mailstore/Provisioning node** requires outbound HTTPS access for licensing. No other nodes need this connection.

## Activation process

Each installation must be activated with a license token. During activation, the Carbonio server communicates securely with `api.zextras.io` to validate the token and receive the digital license file.

You can activate the license via the Carbonio Admin Panel or the Command Line Interface (CLI).

### Via Carbonio Admin Panel

1. Navigate to **Subscriptions** and enter the token.
2. Click **Confirm**.

### Via CLI

Execute the following commands as the `zextras` user:

```console
$ su - zextras
zextras$ carbonio core activate-license <TOKEN>
```

To check the license status afterward, run:

```console
zextras$ carbonio core getLicenseInfo
```

## Best practices

* Apply the principle of least privilege: allow only outbound TCP/443 to `api.zextras.io`.
* Place the node performing activation in a segmented network (DMZ).
* Log and monitor license server requests for audit and troubleshooting.
* If using SSL-inspecting proxies, either bypass inspection for `api.zextras.io` or ensure the proxy's CA is trusted by Carbonio.

Example firewall rule (iptables):

```console
# iptables -A OUTPUT -p tcp -d api.zextras.io --dport 443 -j ACCEPT
# iptables -A OUTPUT -p tcp --dport 443 -j REJECT
```

## Configuring a proxy

If your environment requires a proxy to reach the Internet, you can configure it for Carbonio.

To configure a standard proxy:

```console
$ su - zextras
zextras$ carbonio prov modifyConfig zimbraHttpProxyURL http://proxy.example.com
zextras$ zmcontrol restart
```

For authenticated proxies, include the credentials in the URL:

```console
zextras$ carbonio prov modifyConfig zimbraHttpProxyURL http://user:pass@proxy.example.com
```

> **Note:** Continuous outbound HTTPS access is required for Pay-Per-Use models, which periodically contact the endpoint to send usage stats and receive the current license. Always import proxy CA certificates if SSL interception or self-signed proxies are used.
