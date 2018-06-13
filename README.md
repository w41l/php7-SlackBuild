Installation Order
==================

This README explain how to get PHP7 works with Microsoft SQL Server.
You can choose using FreeTDS or Microsoft SQL Server Native Client or both.


FreeTDS
=======

* unixODBC
* freetds
* php-pdo_dblib


Microsoft SQL Server Native Driver
==================================

* unixODBC
* msodbcsql (msodbcsql17)
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
  This for msodbcsql driver version 13:
  
  shell> odbcinst -i -s -f /opt/microsoft/msodbcsql/etc/odbcinst.ini -l
  
  This for msodbcsql driver version 17:
  
  shell> odbcinst -i -s -f /opt/microsoft/msodbcsql17/etc/odbcinst.ini -l
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
