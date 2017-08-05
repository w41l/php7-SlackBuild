Installation Order
==================

This README explain how to get PHP7 works with Microsoft SQL Server.
You can choose using FreeTDS or Microsoft SQL Server Native Client or both.

FreeTDS
=======

* freetds
* php
* php-pdo_dblib

Microsoft SQL Server Native Driver
==================================

* unixODBC
* msodbcsql
* php
* php-sqlsrv


NOTES
=====

* Default Slackware's ODBC library is libiodbc. unixODBC will replace some of
  libiodbc files. Please *reinstall* libiodbc if you uninstall unixODBC.

* If you don't like your stock libraries being replaced,
  then FreeTDS is a safe choice.

* Microsoft SQL Server ODBC Driver from Suse Linux Enterprise repository

* After installing msodbcsql you must install the ODBC driver (run as root):

  ```
  odbcinst -i -s -f /opt/microsoft/msodbcsql/etc/odbcinst.ini -l
  ```

* Add your sqlserver DSN in /etc/odbc.ini like this:

```
[MYSERVERNAME_OR_IP]
Driver=ODBC Driver 13 for SQL Server
Description=My Microsoft SQL Server
Server=IP_OR_HOSTNAME
Port=1433
Database=
User=
Password=

[ODBC Driver 13 for SQL Server]
Description=Microsoft ODBC Driver 13 for SQL Server
Driver=/opt/microsoft/msodbcsql/lib64/libmsodbcsql-13.1.so.9.0
```

* Test DSN connection using:

```
isql -v MYSERVERNAME USERNAME PASSWORD
```


WARNING
=======

By *installing* msodbcsql binary driver you are accepting all terms and condition
in /usr/doc/msodbcsql-@VERSION@/LICENSE.txt

Please read it!
