-- DROP SCHEMA sta;

CREATE SCHEMA sta AUTHORIZATION postgres;

-- sta.articulos definition

-- Drop table

-- DROP TABLE sta.articulos;

CREATE TABLE sta.articulos (
	id varchar NULL,
	"Etapa" varchar NULL,
	"U. Medida" varchar NULL,
	"Código" varchar NULL,
	"Descripción" varchar NULL,
	procesado bool NULL DEFAULT false,
	fec_proceso date NULL
);


-- sta.articulos_etapas definition

-- Drop table

-- DROP TABLE sta.articulos_etapas;

CREATE TABLE sta.articulos_etapas (
	"Etapa" varchar NULL,
	"Entrada" varchar NULL,
	"Producto" varchar NULL,
	"Salida" varchar NULL,
	procesado bool NULL DEFAULT false,
	fec_proceso date NULL
);


CREATE OR REPLACE FUNCTION sta.calcula_tipo_articulo(p_codigo character varying)
 RETURNS character varying
 LANGUAGE plpgsql
AS $function$
	DECLARE 
		v_trailing varchar;
		v_tipo varchar;
	BEGIN
		/** Calcula de acuerdo al codigo el id 
		 *  de tipo de articulo
		 *  @author rruiz
		 */
		v_trailing = substring(p_codigo,1,2);
		
		SELECT t.tabl_id
		INTO STRICT v_tipo
		FROM core.tablas t 
		WHERE t.tabla = 'tipo_articulo'
		AND t.valor2 = v_trailing;
	
		RETURN v_tipo;
	EXCEPTION
		WHEN NO_DATA_FOUND THEN
			RAISE INFO 'CALCTIPO: El tipo de articulo no se puede calcular para el codigo % - y con 2 primeras letras %',p_codigo, v_trailing;
			RETURN 'ERROR';
       
	END;
$function$
;

CREATE OR REPLACE FUNCTION sta.bulkload_articulos(p_archivo character varying, p_empr_id integer)
 RETURNS boolean
 LANGUAGE plpgsql
AS $function$
	DECLARE 
	v_codigo_aux varchar;
	v_descripcion_aux varchar;
 	v_umedida_aux varchar;
 	v_tipo_aux varchar;
	cur_articsv CURSOR FOR SELECT
						ltrim(rtrim(upper(ar."Código")))
						, ar."Descripción"
						, ltrim(rtrim(upper( ar."U. Medida")))
						, sta.calcula_tipo_articulo(ar."Código")
						FROM sta.articulos ar
						WHERE ar.procesado = FALSE;

 	BEGIN
		/**
		 * Carga de un archivo csv
		 * 	con columnas "Código","Descripción", "U. Medida"
		 * los datos en alm_articulos
		 * la primer fila de csv debe tener estos nombres no importa el orden
		 */
	    RAISE INFO 'BULKART: Cargando archivo % con empresa %',p_archivo, p_empr_id;

		BEGIN

		   EXECUTE 
			FORMAT('COPY sta.articulos (id,"Etapa","U. Medida","Código","Descripción") FROM %s WITH CSV HEADER'
		    ,p_archivo);
	       
		    RAISE INFO 'BULKART: Archivo cargado';
       
		    RAISE INFO 'BULKART: Eliminando registros sin codigo o descripcion con empresa %',p_empr_id;

			DELETE FROM sta.articulos ar 
			WHERE ar."Código" IS  NULL
			OR ar."Descripción" IS NULL;

			RAISE INFO 'BULKART: Insertando registros';
			open cur_articsv;
			loop
				fetch cur_articsv into v_codigo_aux,v_descripcion_aux,v_umedida_aux,v_tipo_aux;
				exit when NOT FOUND;
	    		
				RAISE INFO 'BULKART: Procesando registro  %-%-%-%',v_codigo_aux,v_descripcion_aux,v_umedida_aux,v_tipo_aux;
      		
				INSERT INTO
					alm.alm_articulos (
					    barcode 
					    ,descripcion 
					    ,costo 
					    ,es_caja 
					    ,cantidad_caja 
					    ,punto_pedido 
					    ,estado 
					    ,unidad_medida 
					    ,empr_id 
					    ,es_loteado
					    ,tipo)
				 VALUES(
						v_codigo_aux
						,v_descripcion_aux
						,0
						,FALSE
						,0
						,0
						,'AC'
						,v_umedida_aux
						,p_empr_id
						,FALSE
						,v_tipo_aux);
			end loop;
			CLOSE cur_articsv;
			RAISE INFO 'BULKART: Registros cargados, marcando batch como procesado';

			UPDATE
				sta.articulos
			SET
				procesado = TRUE
				, fec_proceso = now()
			WHERE
				procesado = FALSE;

			RAISE INFO 'BULKART: Carga bulk terminada exitosamente';
	EXCEPTION	
		when others then
			/* Borro el actual CSV con error*/
			DELETE FROM sta.articulos ar 
			WHERE ar.procesado = FALSE;
			raise EXCEPTION 'BULKART: error al cargar batch de articulos %: %', sqlstate,sqlerrm;

	END;

	RETURN TRUE;
END;
$function$
;

CREATE OR REPLACE FUNCTION sta.bulkload_articulos_etapa(p_archivo character varying, p_empr_id integer)
 RETURNS boolean
 LANGUAGE plpgsql
AS $function$
	DECLARE 
	v_codigo_aux varchar;
	v_descripcion_aux varchar;
 	v_umedida_aux varchar;
 	v_tipo_aux varchar;
	cur_articsv CURSOR FOR SELECT
						ltrim(rtrim(upper(ar."Código")))
						, ar."Descripción"
						, ltrim(rtrim(upper( ar."U. Medida")))
						, sta.calcula_tipo_articulo(ar."Código")
						FROM sta.articulos ar
						WHERE ar.procesado = FALSE;

 	BEGIN
		/**
		 * Carga de un archivo csv
		 * 	con columnas "Código","Descripción", "U. Medida"
		 * los datos en alm_articulos
		 * la primer fila de csv debe tener estos nombres no importa el orden
		 */
	    RAISE INFO 'BULKART: Cargando archivo % con empresa %',p_archivo, p_empr_id;

		BEGIN

		   EXECUTE 
			FORMAT('COPY sta.articulos (id,"Etapa","U. Medida","Código","Descripción") FROM %s WITH CSV HEADER'
		    ,p_archivo);
	       
		    RAISE INFO 'BULKART: Archivo cargado';
       
		    RAISE INFO 'BULKART: Eliminando registros sin codigo o descripcion con empresa %',p_empr_id;

			DELETE FROM sta.articulos ar 
			WHERE ar."Código" IS  NULL
			OR ar."Descripción" IS NULL;

			RAISE INFO 'BULKART: Insertando registros';
			open cur_articsv;
			loop
				fetch cur_articsv into v_codigo_aux,v_descripcion_aux,v_umedida_aux,v_tipo_aux;
				exit when NOT FOUND;
	    		
				RAISE INFO 'BULKART: Procesando registro  %-%-%-%',v_codigo_aux,v_descripcion_aux,v_umedida_aux,v_tipo_aux;
      		
				INSERT INTO
					alm.alm_articulos (
					    barcode 
					    ,descripcion 
					    ,costo 
					    ,es_caja 
					    ,cantidad_caja 
					    ,punto_pedido 
					    ,estado 
					    ,unidad_medida 
					    ,empr_id 
					    ,es_loteado
					    ,tipo)
				 VALUES(
						v_codigo_aux
						,v_descripcion_aux
						,0
						,FALSE
						,0
						,0
						,'AC'
						,v_umedida_aux
						,p_empr_id
						,FALSE
						,v_tipo_aux);
			end loop;
			CLOSE cur_articsv;
			RAISE INFO 'BULKART: Registros cargados, marcando batch como procesado';

			UPDATE
				sta.articulos
			SET
				procesado = TRUE
				, fec_proceso = now()
			WHERE
				procesado = FALSE;

			RAISE INFO 'BULKART: Carga bulk terminada exitosamente';
	EXCEPTION	
		when others then
			/* Borro el actual CSV con error*/
			DELETE FROM sta.articulos ar 
			WHERE ar.procesado = FALSE;
			raise EXCEPTION 'BULKART: error al cargar batch de articulos %: %', sqlstate,sqlerrm;

	END;

	RETURN TRUE;
END;
$function$
;

