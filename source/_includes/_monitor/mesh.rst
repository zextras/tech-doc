
|product| employs the Consul Service Discovery to provide the
automation of its monitoring systems. One of the biggest advantages of
using Consul is the ability to filter by tag in Prometheus.

With Prometheus, services that are create in Consul can be
automatically discovered.

For example, when a virtual machine is created, it can be registered
with Consul based on the services it hosts, seamlessly integrating all
of them into Prometheus monitoring system. Furthermore, when this
virtual machine is decommissioned, it will be automatically removed
from the Prometheus endpoints as soon as it is deregistered from
Consul.

Another advantage for Prometheus is that it can rely on Consul's
Catalog API, allowing to discover more targets on the |product|
infrastructure and therefore to gather additional data. Each
discovered target has an ``__address__`` label set to
``<service_or_node_addr>:<service_port>``: ``<service_or_node_addr>``
is either the service address or, if the service address is empty, the
Node address, while the ``<service_port>`` is the port on which the
service listens for incoming connections.

The following meta-labels are available for discovered targets:

* ``__meta_consul_address:`` the address of the target

* ``__meta_consul_dc:`` the datacenter name for the target

* ``__meta_consul_health:`` the health status of the service

* ``__meta_consul_metadata_<key>:`` each node metadata key value of the target

* ``__meta_consul_namespace:`` namespace of the service - see namespace docs

* ``__meta_consul_node:`` the node name defined for the target

* ``__meta_consul_partition:`` partition of the service - see partition docs

* ``__meta_consul_service_address:`` the service address of the target

* ``__meta_consul_service_id:`` the service ID of the target

* ``__meta_consul_service_metadata_<key>:`` each service metadata key value of the target

* ``__meta_consul_service_port:`` the service port of the target

* ``__meta_consul_service:`` the name of the service the target belongs to

* ``__meta_consul_tagged_address_<key>:`` each node tagged address key value of the target
      
* ``__meta_consul_tag_<tagname>:`` the value for the given tag of the target

* ``__meta_consul_tagpresent_<tagname>:`` "true" for every tag of the target
      
* ``__meta_consul_tags:`` the list of tags of the target joined by the tag_separator

.. seealso::

   To connect to the  |mesh| graphic interface, follow the directions
   in Section :ref:`mesh-gui`.

   Relevant Consul commands that can be used to manage |mesh|,
   discover services, and more, refer to Section :ref:`ts-mesh`.
