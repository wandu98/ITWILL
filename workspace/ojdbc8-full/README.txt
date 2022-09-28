======================================================
Oracle Free Use Terms and Conditions (FUTC) License 
======================================================
https://www.oracle.com/downloads/licenses/oracle-free-license.html
===================================================================

ojdbc8-full.tar.gz - JDBC Thin Driver and Companion JARS
========================================================
This TAR archive (ojdbc8-full.tar.gz) contains the 21.7.0.0 release of the Oracle JDBC Thin driver(ojdbc8.jar), the Universal Connection Pool (ucp.jar) and other companion JARs grouped by category. 

(1) ojdbc8.jar (5,089,412 bytes) - 
(SHA1 Checksum: c7242cb44f0b5fe54b156bffd848347dfa943728)
Oracle JDBC Driver compatible with JDK8, JDK11, JDK12, JDK13, JDK14, and JDK15.
Note: "java -jar ojdbc8.jar" shows the version as 21.6.0.0.0. But, it is indeed from the release 21.7.0.0. 
(2) ucp.jar (1,800,487 bytes) - (SHA1 Checksum: 9c348d5192d0556627bb92f9527007decee6a823)
Universal Connection Pool classes to be used with ojdbc8.jar -- for performance, scalability, high availability, sharded and multitenant databases.
Note: "java -jar ucp.jar" shows the version as 21.6.0.0.0. But, it is indeed shafrom the release 21.7.0.0. 
(3) rsi.jar (345,275 bytes) - (SHA1 Checksum: 78931f5e660afe2037444a5e4e22672b05da511d)
Reactive Streams Ingestion (RSI) 
(4) ojdbc.policy (11,515 bytes) - Sample security policy file for Oracle Database JDBC drivers

======================
Security Related JARs
======================
Java applications require some additional jars to use Oracle Wallets. 
You need to use all the three jars while using Oracle Wallets. 

(5) oraclepki.jar (307,830 bytes) - (SHA1 Checksum: d56d4c49ea46cedb3fe2fde2ceb6fc7dd3a31e76)
Additional jar required to access Oracle Wallets from Java
(6) osdt_cert.jar (211,071 bytes) - (SHA1 Checksum: b0cef05e9886a686e840a1c6cf807f7744985e68)
Additional jar required to access Oracle Wallets from Java
(7) osdt_core.jar (312,992 bytes) - (SHA1 Checksum: 64bd0374c6feb0811948f4f6f600746f6c840f6d)
Additional jar required to access Oracle Wallets from Java

=============================
JARs for NLS and XDK support 
=============================
(8) orai18n.jar (1,664,692 bytes) - (SHA1 Checksum: bbe1ac33fdb88d5d3fb0402b05105604f5f0011d) 
Classes for NLS support
(9) xdb.jar (129,578 bytes) - (SHA1 Checksum: e97dcfbc86f0f9f4fffc111d46435f02b6b16e4d)
Classes to support standard JDBC 4.x java.sql.SQLXML interface 
(10) xmlparserv2.jar (1,953,962 bytes) - (SHA1 Checksum: 5a3286a1ec998126fabde509a12af3481526968d)
Classes to support standard JDBC 4.x java.sql.SQLXML interface 
(11) xmlparserv2_sans_jaxp_services.jar (1,949,192 bytes) - (SHA1 Checksum: b8bca62a8e7f5acc2dd67f798e6cf0930c11350d) 
Classes to support standard JDBC 4.x java.sql.SQLXML interface

====================================================
JARs for Real Application Clusters(RAC), ADG, or DG 
====================================================
(12) ons.jar (198,693 bytes) - (SHA1 Checksum: fb91d3c740fa23d2348b80fbdd6f6be2dcd2f6c2)
for use by the pure Java client-side Oracle Notification Services (ONS) daemon
(13) simplefan.jar (32,440 bytes) - (SHA1 Checksum: 5990dfa02a1c723b021f101517eeecca5e227339)
Java APIs for subscribing to RAC events via ONS; simplefan policy and javadoc


==================================================================================
NOTE: The diagnosability JARs **SHOULD NOT** be used in the production environment. 
These JARs (ojdbc8_g.jar,ojdbc8dms.jar, ojdbc8dms_g.jar) are meant to be used in the 
development, testing, or pre-production environment to diagnose any JDBC related issues. 

=====================================
OJDBC - Diagnosability Related JARs
===================================== 

(14) ojdbc8_g.jar (8,459,033 bytes) - (SHA1 Checksum: 5da9841c61a6eea21eb80db244ed9fb7974a1b65)
Same as ojdbc8.jar except compiled with "javac -g" and contains tracing code.

(15) ojdbc8dms.jar (7,059,109 bytes) - (SHA1 Checksum: 92130ff45d345819325e969663a637d6db6098a5)
Same as ojdbc8.jar, except that it contains instrumentation to support DMS and limited java.util.logging calls.

(16) ojdbc8dms_g.jar (8,460,861 bytes) - (SHA1 Checksum: a410d43519a530b66e8b3904449cebb73973ac6f)
Same as ojdbc8_g.jar except that it contains instrumentation to support DMS.

(17) dms.jar (2,194,541 bytes) - (SHA1 Checksum: 04b3048f7713d0cd432a74a790a772b8b00c3bbd)
dms.jar required for DMS-enabled JAR files.

==================================================================
Oracle JDBC and UCP - Javadoc and README
==================================================================

(18) JDBC-Javadoc-21c.jar (1,982,788 bytes) - JDBC API Reference 21c

(19) UCP-Javadoc-21c.jar (395,217 bytes) - UCP Java API Reference 21c

(20) RSI-Javadoc-21c.jar (425,937 bytes) - RSI Java API Reference 21c

(21) simplefan-Javadoc-21c.jar (86,960 bytes) - Simplefan API Reference 21c 

(22) xdb-Javadoc-21c.jar (2,631,108 bytes) - XDB API Reference 21c 

(23) xmlparserv2-Javadoc-21c.jar (2,631,108 bytes) - xmlparserv2 API Reference 21c 

(24) JDBC-Readme.txt: It contains general information about the JDBC driver and bugs that have been fixed in the 21.7.0.0.1 release. 

(25) UCP-Readme.txt: It contains general information about UCP and bugs that are fixed in the 21.7.0.0.1 release. 

(26) Bugs-fixed-in-217.txt: It contains the bugs fixed on top of the 21.6 release. 

=================
USAGE GUIDELINES
=================
Refer to the JDBC Developers Guide (https://docs.oracle.com/en/database/oracle/oracle-database/21/jjdbc/index.html) and Universal Connection Pool Developers Guide (https://docs.oracle.com/en/database/oracle/oracle-database/21/jjucp/index.html) for more details. 