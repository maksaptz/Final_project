mysqldump — неблокирующий режим
mysqldump --add-drop-table --add-locks --create-options \
--disable-keys --extended-insert --single-transaction --quick \
--set-charset --events --routines --triggers


#   CHANGE REPLICATION SOURCE TO SOURCE_HOST='192.168.50.11', SOURCE_USER='replica', SOURCE_PASSWORD='qwerty1234', SOURCE_AUTO_POSITION = 1;

Восстановление из логических бекапов
mysql < back.sql
# Вырезаем таблицу из общего файла дампа
sed -n -e '/DROP TABLE.*`mytable`/,/UNLOCK TABLES/p' \
mydump.sql > tabledump.sql

SHOW REPLICA STATUS\G

#Percona XtraBackup – полный бэкап
xtrabackup --user=root --password=1 --backup --target-dir=/home/db/backups/
xtrabackup --prepare --target-dir=/home/db/backups/

Percona XtraBackup – восстановление
(full, incremental, compressed)
xtrabackup --prepare --target-dir=/home/db/backups/
systemctl stop mysql
rm -rf /var/lib/mysql/*
xtrabackup --copy-back || --move-back --target-dir=/home/db/backups/
chown -R mysql:mysql /var/lib/mysql
systemctl start mysql