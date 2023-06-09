-- 1) increase all incomes by 5% --

update empleados set income = income + ((income * 5)/100) where id != 0;

-- 2) get names starting with letter A --

select full_name 
from empleados where full_name like "A%";

-- 3) count number of employees workinkg at department "aaa" --

select count(*) as amount 
from empleados where department = "aaa";

-- 4) get only first name from full_name column --

select id, substring(full_name, 1, locate(" ", full_name)) as first_name 
from empleados; 

-- 5) get records with income between 100 and 200 --

select * 
from empleados where income between 100 and 200;

-- 6) get records with full_name having at least four characters and ending with letter A --

select * 
from empleados
where length(substring(full_name, 1, locate(" ", full_name))) >= 4 and substr(substring_index(full_name, " ", 1), -1) = "a";

-- 7) get number of employees of each department --

select department, count(*) as cuenta
from empleados
group by department;

-- 8) create a table with same structure as the older one --
create table empleados_copy like empleados;
select * from empleados_copy;

-- 9) delete duplicate records --

 insert into empleados(full_name, income, department)
 values
 	("Sancho Proudfoot", 230, "bbb");

DELETE t1 FROM empleados t1
INNER JOIN empleados t2
WHERE t1.id > t2.id AND
      t1.full_name = t2.full_name;
      
