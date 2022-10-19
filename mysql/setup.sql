-- Sql Script --

-- install plugin validate_password soname 'validate_password.so';

SET GLOBAL validate_password.LENGTH = 4; 
SET GLOBAL validate_password.policy = 0; 
SET GLOBAL validate_password.mixed_case_count = 0; 
SET GLOBAL validate_password.number_count = 0; 
SET GLOBAL validate_password.special_char_count = 0; 
SET GLOBAL validate_password.check_user_name = 0;

ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root';
FLUSH PRIVILEGES;
