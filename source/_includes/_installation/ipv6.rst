
.. index:: IPv6

.. card:: IPv6 Support

   In case you need to enable IPv6 on |product|, make sure that the
   :file:`/etc/hosts/` file contains the following line::

     ::1     ip6-localhost ip6-loopback

   .. warning:: The above line **must not contain** references to
      **localhost**, as this would result in disruptions.

      .. parsed-literal::

         ::1     ip6-localhost ip6-loopback :bdg-success:`CORRECT`

         ::1     ip6-localhost ip6-loopback localhost :bdg-danger:`WRONG`
