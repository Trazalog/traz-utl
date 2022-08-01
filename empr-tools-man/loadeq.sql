load data local infile "/tmp/eq.dmp" into table sta_equipos character set "utf8" fields terminated by "," lines terminated by "\n" ignore 1 lines;
call bulkload_equipos(6);
