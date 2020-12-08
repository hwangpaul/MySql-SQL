create database user01;

create user 'user01'@'%' identified by 'user01';

grant ALL privileges on user01.* to 'user01'@'%';

flush privileges;

show grants for 'user01';
show grants for 'user01'@'%';


commit;
