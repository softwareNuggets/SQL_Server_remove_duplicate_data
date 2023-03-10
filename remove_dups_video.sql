--drop table #temp_production
create table #temp_production
(
	 cid int not null,
	 pid int not null,
	 amt decimal(10,2) not null
)

--drop index  tmp_ux on #temp_production
create unique index tmp_ux on #temp_production(cid,pid)

INSERT INTO #temp_production (cid, pid, amt)
values
(3,3,3.31),
(4,6, 2.11),
(5,12, 4.11),
(6,18, 5.11),
(7,24, 1.11),
(9,37, 3.11),
(14,16, 2.11),
(15,112, 4.11),
(16,118, 5.11),
(17,124, 1.11),
(19,137, 3.11),
(3,3, 3.31),
(3,3, 3.31),
(24,26, 2.11),
(25,212, 4.11),
(26,218, 5.11),
(27,224, 1.11),
(29,237, 3.11),
(34,6, 2.11),
(35,12, 4.11),
(36,18, 5.11),
(37,24, 1.11),
(39,37, 3.11),
(54,16, 2.11),
(55,112, 4.11),
(56,118, 5.11),
(57,124, 1.11),
(59,137, 3.11),
(3,3, 3.31),
(44,26, 2.11),
(45,212, 4.11),
(46,218, 5.11),
(47,224, 1.11),
(49,237, 3.11),
(44,6, 2.11),
(45,12, 4.11),
(46,18, 5.11),
(47,24, 1.11),
(49,37, 3.11),
(64,16, 2.11),
(65,112, 4.11),
(66,118, 5.11),
(67,124, 1.11),
(69,137, 3.11)


select *
from #temp_production
order by cid,pid

select cid, pid, count(*)
from #temp_production
group by cid, pid 


-- execute this SQL to see how "PARTITION BY" works

    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY cid, pid ORDER BY cid, pid) AS rn
    FROM #temp_production



-- execute this code below to remove data from #temp_production table
WITH cteDups AS (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY cid, pid ORDER BY cid, pid) AS rn
    FROM #temp_production
)
delete
from cteDups
where rn > 1


