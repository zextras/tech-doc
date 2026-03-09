# Troubleshooting: Debug license activation issues

## Verifying connectivity

Carbonio licensing depends on outbound HTTPS access to `api.zextras.io` from the **Mailstore/Provisioning node**. Before checking logs, verify basic DNS and network connectivity.

### DNS verification

Ensure the node can resolve the endpoint's hostname:

```console
$ nslookup api.zextras.io
```

### HTTPS connectivity

Test the connection to the API endpoint using `curl` or `nc`:

```console
$ curl -v https://api.zextras.io --max-time 10
$ nc -vz api.zextras.io 443
```

## Logs to check

If connectivity tests pass but activation still fails, review the following logs for detailed error messages:

| Log file | Purpose |
| :--- | :--- |
| `/opt/zextras/log/mailbox.log` | Check for Carbonio subsystem errors and core licensing issues. |
| `/opt/zextras/log/freshclam.log` | Check for antivirus update or auxiliary proxy connectivity issues. |

## Common issues and resolutions

The table below outlines common licensing activation problems and their solutions:

| Symptom / Issue | Resolution |
| :--- | :--- |
| **Firewall blocking outbound HTTPS** | Ensure that firewall rules permit outbound traffic on TCP port 443 to `api.zextras.io`. |
| **Proxy not configured or misconfigured** | Check the `zimbraHttpProxyURL` via `carbonio prov`. Verify credentials if using a proxy. |
| **DNS not resolving external names** | Verify the system's `/etc/resolv.conf` and ensure valid DNS resolvers are configured. |
| **SSL interception breaking TLS handshake** | Bypass inspection for `api.zextras.io` or import the proxy's CA on all application servers. |
| **Proxy with self-signed certificates** | If the proxy requires HTTPS and uses a self-signed certificate, its CA must be imported. |
| **Transparent proxy interception** | If a transparent proxy replaces the certificate (e.g., Fortinet), import the proxy's CA. |
