CREATE OR REPLACE FUNCTION sta.bulkload_alm_lotes(p_archivo character varying, p_empr_id integer)
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
						ltrim(rtrim(upper(al."codArticulo")))
						--, ltrim(rtrim(ae."numero_proveedor")) 
						,al."numeroProveedor"
						,al."numeroDeposito"
						,al."cantidad"
						,al."Ppesos" 
						,al."Pdolar" 
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
			FORMAT('COPY sta.alm_lotes ("codArticulo","numeroProveedor","numeroDeposito","cantidad","Ppesos","Pdolar") FROM %s WITH CSV HEADER'
		    ,p_archivo);
	 
		    RAISE INFO 'BULKARET: Archivo cargado';
		   
		   RAISE INFO 'BULKARET: Eliminando registros invalidos  %',p_empr_id;
	 --elimino de la tabla si estan vacio los datos
	 DELETE FROM sta.alm_lotes al 
			WHERE al."codArticulo" IS  null
			OR (al."numeroProveedor" = '0' AND al."numeroDeposito"  = '0' AND al."cantidad"  ='0')
			OR (al."numeroProveedor" IS NULL AND al."numeroDeposito" IS NULL AND al."cantidad"  IS NULL);
		
		RAISE INFO 'BULKARET: Insertando registros';
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
