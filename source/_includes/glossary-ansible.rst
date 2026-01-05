.. glossary::
   :sorted:

   Ansible Collection
      An **Ansible collection** is a distribution format for Ansible
      content that includes roles, modules, plugins, playbooks, and
      documentation. Collections help organize and distribute Ansible
      content more efficiently, especially for large-scale automation.

      What’s Inside an Ansible Collection?

      * Modules – Custom tasks for automation (e.g., managing users,
        configuring networks)
      * Roles – Predefined sets of tasks and variables for reusable
        automation
      * Plugins – Extensions like connection types, filters, and
        inventory sources
      * Playbooks – YAML files that define automation workflows.
      * Documentation – Metadata and instructions for using the
        collection

   Ansible Playbook
      An **Ansible Playbook** is a YAML file that defines a set of
      tasks to automate IT processes, such as configuring servers,
      deploying applications, or managing network devices. It is a key
      part of Ansible’s automation framework.

   Ansible Inventory
      An **Ansible Inventory** is a file that defines the hosts
      (servers, network devices, etc.) where Ansible will run tasks.
      It organizes hosts into groups and allows dynamic configuration
      using variables.  The installation mode of Zextras Carbonio
      performed with Ansible uses a static inventory file (INI format)
      that lists hosts and groups.

   Ansible Role
      An **Ansible Role** is a structured way to organize and reuse
      automation tasks. It helps break down complex playbooks into
      reusable, modular components. Roles group related tasks,
      variables, templates, and handlers into separate directories,
      making automation more scalable and maintainable.

      In Ansible playbooks, the invocation of various roles is
      organized, with each role aimed at executing a specific
      tasks—whether it's system configuration, package installation,
      or other operations.