
Automatic License Renewal Behavior
----------------------------------

The license renewal process is handled automatically by a scheduled job
(*RenewLicenseJob*), which periodically contacts the licensing API to
renew the subscription.

In case of temporary backend issues (for example, HTTP 5xx errors), the
renewal process is designed to tolerate transient failures and retry
automatically, ensuring service continuity without administrator
intervention.

The system distinguishes between transient errors (typically server-side
issues) and permanent failures (such as invalid credentials). Transient
errors do not prevent subsequent retry attempts, which are executed in
the following scheduled cycles. This prevents the system from incorrectly
considering a failed renewal as completed and reduces the risk of license
expiration due to temporary outages of the licensing service.

If repeated failures occur or a non-recoverable error is detected,
system administrators are notified and can still manually trigger the
renewal process if needed.