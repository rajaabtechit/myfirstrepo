@echo off
rem Backup Database (Daily-Every 1 Hour,via Task Scheduler)
rem raves
set location="Z:\Backups\MySQL"
set folder="DB.%date:~3,2%%date:~0,2%%date:~6,4%"
set filename="raves.db.%time:~0,2%-%time:~3,2%.sql"
set resultfile=%location%\\%folder%\\%filename%
cd %location%
if not exist %folder% mkdir %folder%
cd\
c:
cd C:\Program Files\MySQL\MySQL Server 5.7\bin
mysqldump.exe --user=root --password=mysql@2017 --host=localhost --protocol=tcp --port=3306 --result-file=%resultfile% --default-character-set=utf8 --single-transaction=TRUE --skip-triggers "raves"
