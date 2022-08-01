load data local infile "/tmp/ots.dmp" into table sta_orden_trabajo character set "utf8" fields terminated by "," lines terminated by "\n" ignore 1 lines;
call bulkload_ordenes_trabajo(6);
