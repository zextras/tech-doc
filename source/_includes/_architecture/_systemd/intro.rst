
Starting with |product| 25.6.0, ``systemd`` will become the default service manager on
supported distributions RHEL 9 and Ubuntu 24.04.
This page walks through the motivations for this change, what ``systemd`` brings
to the table, how it’s been implemented in |product|, and how system administrators
can interact with the new system.

Why Move to ``systemd``?
========================

After evaluating the current init system and its limitations, the Zextras team
identified key opportunities for improvement that ``systemd`` helps address:

Faster Boot with Parallel Service Startup
   Services starts concurrently, drastically reducing the boot time,
   ensuring faster system availability and responsiveness, which is
   crucial for enterprise-grade collaboration platforms like
   |product|.

Smarter Dependency Handling
   Service dependencies are precisely tracked, starting them in the
   correct order, reducing race conditions, startup errors, and
   enhancing reliability.

Unified and Simplified Service Configuration
   All services are managed via standardised unit files, which
   simplifies service configuration, maintenance, and troubleshooting.

Built-in Service Monitoring
   A native mechanisms allows seamless service supervision,
   auto-restarts, logging (using the :command:`journalctl` interface)
   and fine-grained resource control.

On-Demand Service Activation
   With socket activation support, services start only when needed,
   improving performance and reducing memory usage.

Future-Proof Architecture
   Being micro-service friendly, helps positioning |product| for
   modern infrastructure deployments and easier scaling.

Community and Ecosystem
   With robust community support, up-to-date documentation, and active
   development, ``systemd`` ensures |product| remains aligned with
   modern Linux standards.
