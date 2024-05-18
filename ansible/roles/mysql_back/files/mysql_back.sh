#!/bin/bash

mysqldump --all-databases --triggers --routines --events --set-gtid-purged=OFF --source-data --ignore-table=bet.events_on_demand --ignore-table=bet.v_same_event > /root/mysql/databases.sql

exit 0