CREATE USER 'replica'@'10.154.%.%' IDENTIFIED WITH mysql_native_password BY 'password';
GRANT REPLICATION SLAVE ON *.* TO 'replica'@'10.154.%.%';
FLUSH PRIVILEGES;



mysql> show master status\G
*************************** 1. row ***************************
             File: mysql-binlog.000001
         Position: 1018
     Binlog_Do_DB: 
 Binlog_Ignore_DB: 
Executed_Gtid_Set: 
1 row in set (0.00 sec)



CHANGE MASTER TO MASTER_HOST='10.154.0.7' ,
    MASTER_USER='replica' , 
    MASTER_PASSWORD='password' , 
    MASTER_LOG_FILE='mysql-binlog.000001' ,
    MASTER_LOG_POS=1018;



START REPLICA;


SHOW REPLICA STATUS\G