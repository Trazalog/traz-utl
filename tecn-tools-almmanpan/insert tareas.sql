insert
	into
	tst.tareas_planificadas (tapl_id,
	nombre,
	fecha,
	user_id,
	info_id,
	case_id,
	tare_id,
	proc_id,
	form_id,
	descripcion,
	rece_id,
	fec_inicio,
	fec_fin,
	hora_duracion,
	empr_id)
select
	case
		when param.id is null or param.id = ''
		 then nextval('tst.tareas_planificadas_tapl_id_seq') else cast(param.id as integer) end ,
		:nombre,
		to_date(:fecha, 'YYYY-MM-DD'),
		case when param.user_id is null or param.user_id ='' then null else param.user_id end,
		case when param.info_id is null or param.info_id ='' then null else cast(param.info_id as integer) end,
		case when param.case_id is null or param.case_id ='' then null else cast(param.case_id as integer) end,
		case when param.tare_id is null or param.tare_id ='' then null else cast(param.tare_id as integer) end,
		:proc_id,
		case when param.form_id is null or param.form_id ='' then null else cast(param.form_id as integer) end,
		:descripcion,
		case when param.rece_id is null or param.rece_id ='' then null else cast(param.rece_id as integer) end,
		to_timestamp(:fec_inicio, 'YYYY-MM-DD HH24:MI:SS'),
		to_timestamp(:fec_fin, 'YYYY-MM-DD HH24:MI:SS'),
		:hora_duracion,
		cast(:empr_id as integer)
	from
		(
		select
			:tapl_id id
			,:user_id user_id
			,:info_id info_Id
			,:case_id case_id
			,:tare_id tare_id
			,:form_id form_id
			,:rece_id rece_id
			) as param 
			on
		conflict (tapl_id) do
update
set
	nombre = excluded.nombre,
	fecha = excluded.fecha,
	user_id = case when excluded.user_id is null then null else excluded.user_id end,
	info_id = case when excluded.info_id is null then null else cast( excluded.info_id as integer)end,
	case_id = case when excluded.case_id is null then null else cast( excluded.case_id as integer) end,
	tare_id = case when excluded.tare_id is null then null else cast( excluded.tare_id as integer) end,
	proc_id = excluded.proc_id,
	form_id = case when excluded.form_id is null then null else cast( excluded.form_id as integer) end,
	descripcion = excluded.descripcion,
	rece_id = case when excluded.rece_id is null then null else cast( excluded.rece_id as integer) end,
	fec_inicio = excluded.fec_inicio,
	fec_fin = excluded.fec_fin,
	hora_duracion = excluded.hora_duracion,
	empr_id = excluded.empr_id 
	returning tapl_id;
	
