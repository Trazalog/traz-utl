CREATE OR REPLACE FUNCTION sta.bulkload_alm_lotes(p_archivo character varying,p_empr_id integer)
 RETURNS boolean
 LANGUAGE plpgsql
AS $function$
	DECLARE 
	v_cod_articulo_aux varchar;
	v_arti_id int;
	v_numero_proveedor_aux int4; 
	v_numero_deposito_aux int4;
	v_cantidad_aux int4;
	v_p_pesos_aux float8;
	v_p_dolar_aux float8;
	cur_alm_lotecsv CURSOR FOR SELECT
						ltrim(rtrim(upper(al."cod_articulo")))
						--, ltrim(rtrim(ae."numero_proveedor")) 
						,al."numero_proveedor"
						,al."numero_deposito"
						,al."cantidad"
						,al."p_pesos" 
						,al."p_dolar" 
						--, ltrim(rtrim(ae."numero_deposito")) 
						--, ltrim(rtrim(ae."cantidad")) 
						FROM sta.alm_lotes al 
						WHERE al.procesado = FALSE;
	begin
		/**
		 * Carga de un archivo csv
		 * 	con columnas "cod_articulo","numero_deposito", "numero_proveedor", "cantidad"
		 * los datos en alm.alm_lotes
		 * la primer fila de csv debe tener estos nombres no importa el orden
		 */
 	RAISE INFO 'BULKALLO: Cargando archivo con empresa %', p_empr_id;
 
 begin
	 
	  EXECUTE 
			FORMAT('COPY sta.alm_lotes ("cod_articulo","numero_proveedor","numero_deposito","cantidad","p_pesos","p_dolar") FROM %s WITH CSV HEADER'
		    ,p_archivo);
	 
	 --elimino de la tabla si estan vacio los datos
	 DELETE FROM sta.alm_lotes al 
			WHERE al."cod_articulo" IS  null
			OR (al."numero_proveedor" = '0' AND al."numero_deposito"  = '0' AND al."cantidad"  ='0')
			OR (al."numero_proveedor" IS NULL AND al."numero_deposito" IS NULL AND al."cantidad"  IS NULL);
		
 	OPEN cur_alm_lotecsv;
 		loop 
 			fetch cur_alm_lotecsv into v_cod_articulo_aux, v_numero_proveedor_aux, v_numero_deposito_aux, v_cantidad_aux, v_p_pesos_aux, v_p_dolar_aux;
			exit when NOT FOUND;
		
		begin
		--Busco el id del articulo
			SELECT arti_id 
				INTO STRICT v_arti_id
				FROM alm.alm_articulos aa 
				WHERE UPPER(aa.barcode) = v_cod_articulo_aux
				and aa.empr_id = p_empr_id;
		
			RAISE INFO 'BULKALLO: Obtengo id del articulo %',v_arti_id;
				
			RAISE INFO 'BULKARET: Procesando registro  %(%)-%-%-%-%-%<<',v_cod_articulo_aux, v_arti_id ,v_numero_proveedor_aux,v_numero_deposito_aux,v_cantidad_aux,v_p_pesos_aux, v_p_dolar_aux;      		
	
			if v_arti_id IS NOT NULL /*AND v_arti_id != '' AND v_arti_id !='0'*/ THEN
				RAISE INFO 'BULKALLO: Insertando en alm_lotes  %',v_cod_articulo_aux;
		
				INSERT INTO
					alm.alm_lotes (
					    prov_id 
					    ,arti_id 
					    ,depo_id 
					    ,codigo 
					    ,fec_vencimiento 
					    ,cantidad 
					    ,empr_id 
					    ,user_id  
					    ,estado 
					    ,eliminado
					    ,batch_id
					    ,p_pesos
					    ,p_dolar)
				 VALUES(
						v_numero_proveedor_aux
						,v_arti_id
						,v_numero_deposito_aux
						,1
						,'3000-01-01'
						,v_cantidad_aux
						,p_empr_id
						,1
						,'AC'
						,FALSE
						,null
						,v_p_pesos_aux
						,v_p_dolar_aux);

			end if;
		
		exception
		WHEN NO_DATA_FOUND then 
		RAISE INFO 'BULKALLO: Error articulo % no encontrado', v_cod_articulo_aux ;
	end;
			
 		end loop;
 		
 	CLOSE cur_alm_lotecsv;
 	RAISE INFO 'BULKALLO: Registros cargados, marcando como procesado';

			UPDATE
				sta.alm_lotes 
			SET
				procesado = TRUE
				, fec_proceso = now()
			WHERE
				procesado = FALSE;

			RAISE INFO 'BULKALLO: Carga bulk terminada exitosamente';
	EXCEPTION	
		when others then
			/* Borro el actual CSV con error*/
			DELETE FROM sta.alm_lotes al 
			WHERE al.procesado = FALSE;
			raise EXCEPTION 'BULKALLO: error al cargar stock de articulos %: %', sqlstate,sqlerrm;
 end;
 	RETURN TRUE;
	END;
$function$
;
