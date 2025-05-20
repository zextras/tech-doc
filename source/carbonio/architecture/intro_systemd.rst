.. _intro_systemd:

===============================================
Introducing systemd as new Carbonio init system
===============================================

Starting with Carbonio 25.6.0, systemd will become the default service manager on
supported distributions RHEL 9 and Ubuntu 24.04.
This page walks through the motivations for this change, what systemd brings
to the table, how it’s been implemented in Carbonio, and how system administrators
can interact with the new system.

Why Move to systemd?
====================
After evaluating the current init system and its limitations, the Zextras team
identified key opportunities for improvement that systemd helps address:

**Faster Boot with Parallel Service Startup**
systemd starts services concurrently, drastically reducing the boot time.
This ensures faster system availability and responsiveness crucial for enterprise-grade
collaboration platforms like Carbonio.

**Smarter Dependency Handling**
systemd precisely tracks service dependencies, starting them in the correct order.
This reduces race conditions, startup errors, and enhances reliability.

**Unified and Simplified Service Configuration**
All services are managed via standardized unit files. This unification simplifies service
configuration, maintenance, and troubleshooting.

**Built-in Service Monitoring**
systemd offers native mechanisms for service supervision, auto-restarts, logging (journalctl)
and fine-grained resource control.

**On-Demand Service Activation**
With socket activation support, systemd allows services to start only when needed, improving
performance and reducing memory usage.

**Future-Proof Architecture**
systemd is container and microservice friendly, positioning Carbonio for modern infrastructure
deployments and easier scaling.

**Community and Ecosystem**
With robust community support, up-to-date documentation, and active development, systemd ensures
Carbonio remains aligned with modern Linux standards.

.. card:: Table of Contents
          
   .. toctree::
      :maxdepth: 1

      systemd_targets
      systemd_4_admins