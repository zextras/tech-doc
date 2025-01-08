.. _upgrade-logging:

.. card:: SLF4J related errors

   In case you find on |product| messages like the following::

     SLF4J: Class path contains multiple SLF4J bindings.
     SLF4J: Found binding in [jar:file:/opt/zextras/lib/jars/carbonio-message-dispatcher-auth.jar!/org/slf4j/impl/StaticLoggerBinder.class]
     SLF4J: Found binding in [jar:file:/opt/zextras/lib/jars/log4j-slf4j-impl-2.20.0.jar!/org/slf4j/impl/StaticLoggerBinder.class]
     SLF4J: Found binding in [jar:file:/opt/zextras/mailbox/jars/log4j-slf4j-impl-2.20.0.jar!/org/slf4j/impl/StaticLoggerBinder.class]
     SLF4J: See http://www.slf4j.org/codes.html#multiple_bindings for an explanation.
     SLF4J: Actual binding is of type [ch.qos.logback.classic.util.ContextSelectorStaticBinder]

   While these are only warnings, nonetheless they may become
   annoying. The first line is important and gives the reason for the
   warning messages: multiple version of the same class are present in
   the class path and therefore you need to remove manually the
   duplicates (or better rename the :file:`.jar` files before to make
   sure you do not cause other problems):
   :file:`/opt/zextras/lib/jars/log4j-slf4j-impl-2.20.0.jar` and
   :file:`/opt/zextras/mailbox/jars/log4j-slf4j-impl-2.20.0.jar`.
