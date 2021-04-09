DELIMITER $$
CREATE DEFINER=`root`@`%` PROCEDURE asp2.bulkload_ordenes_trabajo ()
BEGIN
	DECLARE fecha_program_aux varchar(255);
	DECLARE fecha_inicio_aux varchar(255);
	DECLARE fecha_entrega_aux varchar(255);
	DECLARE fecha_terminada_aux varchar(255);
	DECLARE fecha_aviso_aux varchar(255);
	DECLARE fecha_entregada_aux varchar(255);
	DECLARE descripcion_aux varchar(255);
	DECLARE estado_aux varchar(255);
	DECLARE nick_usuario_a_aux varchar(255);
	DECLARE id_usuario_a_aux int;
	DECLARE cod_equipo_aux varchar(255);
	DECLARE id_equipo_aux int;

	DECLARE cur_ots CURSOR FOR SELECT *
                               from sta_orden_trabajo
			       WHERE ar.procesado = FALSE;
 
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		    ROLLBACK;
			/* Borro el actual CSV con error*/
 			DELETE FROM sta_orden_trabajo sot 
 			WHERE sot.procesado = FALSE;
		
/*			SELECT 'BULKOT: error al cargar batch de articulos';*/
            /*SHOW ERRORS;*/
    END;
  
		/**
		 * Primero ejecutar laCarga de un archivo csv
		 * utilizando
		 * 	LOAD DATA INFILE p_archivo
			INTO TABLE sta_orden_trabajo
			CHARACTER SET 'utf8'
			FIELDS TERMINATED BY ',' 
			LINES TERMINATED BY '\n'
			IGNORE 1 LINES;
			
			el archivo debe tener las siguientes columnas:
            fecha_program fecha_inicio fecha_entrega fecha_terminada fecha_aviso fecha_entregada descripcion estado 
            id_usuario_a cod_equipo 
		 */


			SELECT 'BULKOT: Insertando registros';
			open cur_ots;
			lp: loop
				fetch cur_ots into fecha_program_aux, fecha_inicio_aux, fecha_entrega_aux, fecha_terminada_aux, fecha_aviso_aux, 
                                                    fecha_entregada_aux, descripcion_aux, estado_aux, id_usuario_a_aux, cod_equipo_aux; 

				if NOT FOUND then
                    			leave lp;
	    		        end if;
	    	
				SELECT CONCAT('BULKOT: Procesando registro equipo, desc, estado, user ',cod_equipo_aux,descripcion_aux, estado_aux ,nick_usuario_a_aux);

				select eq.id_equipo 
				into id_equipo_aux
				from equipos eq 
				where codigo = cod_equipo_aux;
                                
				select s.usrId
				into id_usuario_a_aux 
				from sisusers s				 
				where s.usrNick = nick_usuario_a_aux;

				SELECT CONCAT('BULKOT: datos traducidos equipo y user_a ',id_equipo_aux,id_usuario_a_aux);

				INSERT
					INTO
					orden_trabajo (
					fecha,
					fecha_program,
					fecha_inicio,
					fecha_entrega,
					fecha_terminada,
					fecha_aviso,
					fecha_entregada,
					descripcion,
					estado,
					id_usuario,
					id_usuario_a,
					id_usuario_e,
					id_proveedor,
					id_solicitud,
					tipo,
					id_equipo)
				VALUES(
					current_timestamp,
					str_to_date(fecha_program_aux,'%d-%m-%Y %H:%i'),
					str_to_date(fecha_inicio_aux,'%d-%m-%Y %H:%i'),
					str_to_date(fecha_entrega_aux,'%d-%m-%Y %H:%i'),
					str_to_date(fecha_terminada_aux,'%d-%m-%Y %H:%i'),
					str_to_date(fecha_aviso_aux,'%d-%m-%Y %H:%i'),
					str_to_date(fecha_entregada_aux,'%d-%m-%Y %H:%i'),
					descripcion_aux,
					estado_aux,
					1,
					id_usuario_a_aux,
					1,
					1,
					0,
					10, -- fuerzo a que sea tipo 10 como tipo externo o cargada bulk
					id_equipo_aux
				);
				

			end loop lp;
		
			CLOSE cur_ots;
			SELECT 'BULKOT: Registros cargados, marcando batch como procesado';

			UPDATE
				sta_orden_trabajo
			SET
				procesado = TRUE
				, fec_proceso = current_timestamp()
			WHERE
				procesado = FALSE;

			SELECT 'BULKOT: Carga bulk terminada exitosamente';
END; $$
DELIMITER ;
