
1.b applications= load '/home/hduser/Bigdata Project/h1b.csv' using PigStorage (',') as (s_no,case_status ,employer_name,soc_name,job_title,full_time_position,prevailing_wage,year,worksite,longitude,latitude);

grpd= group applications by job_title;

countbyjob= foreach grpd generate group as job_title,COUNT(applications) as headcount;

dump countbyjob;

orderbycount= order countbyjob by $2 desc;

dump orderbycount;


top5 = limit orderbycount 5;

dump top5;


6. t_count= load '/home/hduser/Bigdata Project/h1b.csv' using PigStorage (',') as (s_no,case_status,employer_name,year,worksite);

B= GROUP t_count by $3;

dump B;

T= filter t_count by $1,$3;

dump T;

C= foreach B generate COUNT(t_count);

dump C;



