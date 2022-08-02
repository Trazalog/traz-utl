-- sta.articulos definition

-- Drop table

-- DROP TABLE sta.articulos;

CREATE TABLE sta.articulos (
	unidad_medida varchar NULL,
	codigo varchar NULL,
	descripcion varchar NULL,
	tipo varchar NULL,
	procesado bool NULL DEFAULT false,
	fec_proceso date NULL
);