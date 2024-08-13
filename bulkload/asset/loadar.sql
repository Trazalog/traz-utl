load data local infile "/tmp/ars.dmp" into table sta_articulos  character set "utf8" fields terminated by "," lines terminated by "\n" ignore 1 lines;
call bulkload_articulos(15);
