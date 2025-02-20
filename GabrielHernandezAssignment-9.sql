show databases;
use petboarding;
show tables;

SELECT CURRENT_USER;
CREATE USER 'gabriel'@'localhost' IDENTIFIED BY 'cgs2545$%';

SELECT host, user, select_priv, insert_priv, update_priv, delete_priv, create_priv, drop_priv 
FROM mysql.user 
WHERE user = 'gabriel' AND host = 'localhost';

GRANT SELECT, INSERT, UPDATE ON petboarding.* TO 'gabriel'@'localhost';

SELECT Db, User, Select_priv, Insert_priv, Update_priv
FROM mysql.db
WHERE User = 'gabriel' AND Db = 'petboarding';

--Switching to user name gabriel
show databases;
use petboarding;
show tables;

DELETE FROM employee;

--ERROR 1142 (42000): DELETE command denied to user 'gabriel'@'localhost' for table 'employee'

--Switching to user name root

show databases;
use petboarding;
show tables;

CREATE USER 'employee'@'localhost' IDENTIFIED BY 'cgs2545$%';

SELECT host, user, select_priv, insert_priv, update_priv, delete_priv, create_priv, drop_priv 
FROM mysql.user 
WHERE user = 'employee' AND host = 'localhost';

GRANT SELECT ON petboarding.workscheduleview TO 'employee'@'localhost';

GRANT SHOW VIEW ON petboarding.workscheduleview TO 'employee'@'localhost';

SELECT Db, User, Select_priv, Show_view_priv
FROM mysql.db
WHERE User = 'employee' AND Db = 'petboarding';

--Switching to user name employee

show databases;
use petboarding;
show tables;

 select * from timecard;

-- ERROR 1142 (42000): SELECT command denied to user 'employee'@'localhost' for table 'timecard'

--Switching to user name root

REVOKE INSERT, UPDATE ON petboarding.* FROM 'gabriel'@'localhost';

SELECT Db, User, Insert_priv, Update_priv
FROM mysql.db
WHERE User = 'gabriel' AND Db = 'petboarding';
