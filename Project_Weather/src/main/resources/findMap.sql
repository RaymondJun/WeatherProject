CREATE TABLE mapdata(
	si varchar(30),
	gu varchar(30),
	dong varchar(30),
	x varchar(30),
	y varchar(30)
);
DROP TABLE MAPDATA ;
select x,y from mapdata where si='서울특별시';
COMMIT;
select x,y from mapdata where gu='금산군' AND dong='추부면';
select x,y from mapdata where dong LIKE '이매%';
select x,y from mapdata where si='서울특별시' AND GU='종로구' AND dong IS null;
select x from mapdata where si like '경기%' and gu='성남시분당구' and dong is NULL;
select x from mapdata where si like '경기도%' and gu='성남시분당구' and dong is NULL;