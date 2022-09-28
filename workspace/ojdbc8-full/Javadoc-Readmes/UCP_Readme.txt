*****************************************************************************
Oracle Universal Connection Pool Release 21.7.0.0.0

Production README
=======================================================================
Contents Of This Release
------------------------

For all platforms:

  [ORACLE_HOME]/ucp/lib contains:

  - ucp.jar
    Classes for use with JDK 8. It contains the Universal Connection Pool
    classes, as well as the built-in JDBC Pool Adapter classes for
    standalone UCP / JDBC applications.

  - ucp11.jar
    Classes for use with JDK 11. It contains the Universal Connection Pool
    classes, as well as the built-in JDBC Pool Adapter classes for
    standalone UCP / JDBC applications.

  - ucpdemos.jar
    Classes for use with JDK 8. It contains the Universal Connection Pool
    demos and code samples, sample logging configurations, and a
    quick-start toolkit for Fast Connection Failover.

  Javadoc / Documentation / Demo:

    All of the above are also available for download on OTN.


Installation
------------

The Oracle Installer puts the Universal Connection Pool files in the
[ORACLE_HOME]/ucp directory.


Setting Up Your Environment
---------------------------

On Windows platforms:
  - Add [ORACLE_HOME]\ucp\lib\ucp.jar to your CLASSPATH.

On all Unix platforms:
  - Add [ORACLE_HOME]/ucp/lib/ucp.jar to your CLASSPATH.

New Features in this Release (21c)
-------------------------------------------------------------
- Sharding Data Source for Transparent Access to Sharded Databases: A new Java data 
  source that enables Java connectivity to a sharded database without the need for
  an application to furnish a sharding key.
  
- Connection Pool Layer Error Messages:UCP exceptions displays extra message with a 
  short statistics that improves UCP diagnosability:
  
- ENH 31621233 - UCP INCURS DOUBLES CPU OVERHEAD UNDER HIGH CONCURRENCY

- Enh 31637253 - Add PDSFactory.getPoolDataSource(String pds, InputStream is) 

Known Problems Fixed in This Patch Release (on top of 21.6)
---------------------------------------------------------------
Bug 34110342 - TRACKING BUG FOR MERGING AZURE OAUTH SUPPORT (93576) 
Bug 33937333 - JDBCSTRESS: UCP FCF NON-AC: HA MODE: JDBC CLIENT HANG WITH CORE DRIVER AND FCF ENABLED
