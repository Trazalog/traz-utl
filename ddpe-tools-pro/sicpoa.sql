/*
 Navicat Premium Data Transfer

 Source Server         : DESA - Desarrollo - TRAZALOG
 Source Server Type    : PostgreSQL
 Source Server Version : 110011
 Source Host           : 10.142.0.13:5432
 Source Catalog        : tools_prod_t
 Source Schema         : sicpoa

 Target Server Type    : PostgreSQL
 Target Server Version : 110011
 File Encoding         : 65001

 Date: 05/05/2022 10:19:58
*/

-- ----------------------------
-- SCHEMA
-- ----------------------------
CREATE SCHEMA sicpoa AUTHORIZATION postgres;

-- ----------------------------
-- Sequence structure for depositos_depo_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "sicpoa"."depositos_depo_id_seq";
CREATE SEQUENCE "sicpoa"."depositos_depo_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for detalles_documento_dedo_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "sicpoa"."detalles_documento_dedo_id_seq";
CREATE SEQUENCE "sicpoa"."detalles_documento_dedo_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Table structure for choferes
-- ----------------------------
DROP TABLE IF EXISTS "sicpoa"."choferes";
CREATE TABLE "sicpoa"."choferes" (
  "dni" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "nombre" varchar COLLATE "pg_catalog"."default",
  "fec_alta" timestamp(6) NOT NULL DEFAULT now(),
  "usuario" varchar COLLATE "pg_catalog"."default" NOT NULL DEFAULT CURRENT_USER,
  "usuario_app" varchar COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Table structure for depositos
-- ----------------------------
DROP TABLE IF EXISTS "sicpoa"."depositos";
CREATE TABLE "sicpoa"."depositos" (
  "depo_id" int4 NOT NULL DEFAULT nextval('"sicpoa".depositos_depo_id_seq'::regclass),
  "calle" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "altura" varchar COLLATE "pg_catalog"."default",
  "depa_id" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "empr_id" varchar COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Table structure for deta_infracciones
-- ----------------------------
DROP TABLE IF EXISTS "sicpoa"."deta_infracciones";
CREATE TABLE "sicpoa"."deta_infracciones" (
  "fec_alta" timestamp(6) NOT NULL DEFAULT now(),
  "usuario" varchar COLLATE "pg_catalog"."default" NOT NULL DEFAULT CURRENT_USER,
  "usuario_app" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "case_id" int8 NOT NULL,
  "tiin_id" varchar COLLATE "pg_catalog"."default" NOT NULL
)
;
COMMENT ON COLUMN "sicpoa"."deta_infracciones"."tiin_id" IS 'infracciones en core.tablas';

-- ----------------------------
-- Table structure for detalles_documento
-- ----------------------------
DROP TABLE IF EXISTS "sicpoa"."detalles_documento";
CREATE TABLE "sicpoa"."detalles_documento" (
  "dedo_id" int4 NOT NULL DEFAULT nextval('"sicpoa".detalles_documento_dedo_id_seq'::regclass),
  "cantidad" float4 NOT NULL,
  "precio_unitario" float4,
  "descuento" float4,
  "fec_alta" timestamp(6) NOT NULL DEFAULT now(),
  "usuario" varchar COLLATE "pg_catalog"."default" DEFAULT CURRENT_USER,
  "usuario_app" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "docu_id" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "tido_id" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "tipr_id" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "unme_id" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "eliminado" bool NOT NULL DEFAULT false,
  "unidades" int4
)
;
COMMENT ON COLUMN "sicpoa"."detalles_documento"."tipr_id" IS 'tipo de producto en core.tablas';

-- ----------------------------
-- Table structure for documentos
-- ----------------------------
DROP TABLE IF EXISTS "sicpoa"."documentos";
CREATE TABLE "sicpoa"."documentos" (
  "num_documento" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "fec_emision" date NOT NULL,
  "fec_alta" timestamp(6) NOT NULL DEFAULT now(),
  "usuario" varchar COLLATE "pg_catalog"."default" NOT NULL DEFAULT CURRENT_USER,
  "usuario_app" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "tido_id" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "imag_id" int4,
  "empr_id_emisor" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "empr_id_destino" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "case_id" int8 NOT NULL,
  "eliminado" bool NOT NULL DEFAULT false
)
;
COMMENT ON COLUMN "sicpoa"."documentos"."tido_id" IS 'tipo documento en core.tablas';
COMMENT ON COLUMN "sicpoa"."documentos"."imag_id" IS 'imagen guardada en frm.instancias_formularios';

-- ----------------------------
-- Table structure for empresas
-- ----------------------------
DROP TABLE IF EXISTS "sicpoa"."empresas";
CREATE TABLE "sicpoa"."empresas" (
  "cuit" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "razon_social" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "num_establecimiento" varchar COLLATE "pg_catalog"."default",
  "fec_alta" timestamp(6) NOT NULL DEFAULT now(),
  "usuario" varchar COLLATE "pg_catalog"."default" NOT NULL DEFAULT CURRENT_USER,
  "usuario_app" varchar COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Table structure for infracciones
-- ----------------------------
DROP TABLE IF EXISTS "sicpoa"."infracciones";
CREATE TABLE "sicpoa"."infracciones" (
  "fec_alta" timestamp(6) NOT NULL DEFAULT now(),
  "usuario" varchar COLLATE "pg_catalog"."default" NOT NULL DEFAULT CURRENT_USER,
  "usuario_app" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "case_id" int8 NOT NULL,
  "depositario" varchar COLLATE "pg_catalog"."default",
  "documento" varchar COLLATE "pg_catalog"."default",
  "domicilio_legal" varchar COLLATE "pg_catalog"."default",
  "domicilio_comercial" varchar COLLATE "pg_catalog"."default",
  "telefono" varchar COLLATE "pg_catalog"."default",
  "email" varchar COLLATE "pg_catalog"."default",
  "detalle_infraccion" varchar COLLATE "pg_catalog"."default",
  "caracteristicas_organolepticas" varchar COLLATE "pg_catalog"."default",
  "caracteristicas_deposito" varchar COLLATE "pg_catalog"."default",
  "tipo_camara" varchar COLLATE "pg_catalog"."default",
  "temperatura_actual" float4,
  "fecha_hora" timestamp(6)
)
;

-- ----------------------------
-- Table structure for inspecciones
-- ----------------------------
DROP TABLE IF EXISTS "sicpoa"."inspecciones";
CREATE TABLE "sicpoa"."inspecciones" (
  "case_id" int8 NOT NULL,
  "patente_tractor" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "nro_senasa" varchar COLLATE "pg_catalog"."default",
  "productos" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "reprecintado" bool DEFAULT false,
  "bruto" float4,
  "tara" float4,
  "ticket" varchar COLLATE "pg_catalog"."default",
  "resultado" varchar COLLATE "pg_catalog"."default",
  "cant_fajas" int4,
  "bruto_reprecintado" float4,
  "ticket_reprecintado" varchar COLLATE "pg_catalog"."default",
  "fec_alta" timestamp(6) NOT NULL DEFAULT now(),
  "usuario" varchar COLLATE "pg_catalog"."default" NOT NULL DEFAULT CURRENT_USER,
  "usuario_app" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "petr_id" int4 NOT NULL,
  "chof_id" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "inca_id" int4,
  "observaciones" varchar COLLATE "pg_catalog"."default",
  "info_id_doc" int4,
  "eliminado" bool NOT NULL DEFAULT false,
  "tel_transportista" varchar COLLATE "pg_catalog"."default",
  "email_transportista" varchar COLLATE "pg_catalog"."default",
  "se_constituye" varchar COLLATE "pg_catalog"."default",
  "domicilio_constituye" varchar COLLATE "pg_catalog"."default",
  "propiedad_de" varchar COLLATE "pg_catalog"."default",
  "atendidos_por" varchar COLLATE "pg_catalog"."default",
  "caracter_de" varchar COLLATE "pg_catalog"."default",
  "proceden_a" varchar COLLATE "pg_catalog"."default",
  "departamento" varchar COLLATE "pg_catalog"."default",
  "localidad" varchar COLLATE "pg_catalog"."default",
  "inspectores" varchar COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "sicpoa"."inspecciones"."inca_id" IS 'acta infraccion en call en frm.instancias formulario';

-- ----------------------------
-- Table structure for inspecciones_empresas
-- ----------------------------
DROP TABLE IF EXISTS "sicpoa"."inspecciones_empresas";
CREATE TABLE "sicpoa"."inspecciones_empresas" (
  "rol" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "empr_id" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "case_id" int8 NOT NULL,
  "fec_alta" timestamp(6) NOT NULL DEFAULT now(),
  "usuario" varchar COLLATE "pg_catalog"."default" NOT NULL DEFAULT CURRENT_USER,
  "usuario_app" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "depo_id" int4,
  "eliminado" bool NOT NULL DEFAULT false
)
;

-- ----------------------------
-- Table structure for inspecciones_termicos
-- ----------------------------
DROP TABLE IF EXISTS "sicpoa"."inspecciones_termicos";
CREATE TABLE "sicpoa"."inspecciones_termicos" (
  "temperatura" float4 NOT NULL,
  "precintos" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "fec_alta" timestamp(6) NOT NULL DEFAULT now(),
  "usuario" varchar COLLATE "pg_catalog"."default" NOT NULL DEFAULT CURRENT_USER,
  "usuario_app" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "case_id" int8 NOT NULL,
  "term_id" varchar COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Table structure for permisos_transito
-- ----------------------------
DROP TABLE IF EXISTS "sicpoa"."permisos_transito";
CREATE TABLE "sicpoa"."permisos_transito" (
  "perm_id" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "lugar_emision" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "fecha_hora_salida" timestamp(6) NOT NULL,
  "tipo" varchar COLLATE "pg_catalog"."default",
  "fec_alta" timestamp(6) NOT NULL DEFAULT now(),
  "usuario" varchar COLLATE "pg_catalog"."default" NOT NULL DEFAULT CURRENT_USER,
  "usuario_app" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "case_id" int8 NOT NULL,
  "soli_num" varchar COLLATE "pg_catalog"."default",
  "origen" varchar COLLATE "pg_catalog"."default",
  "neto" varchar COLLATE "pg_catalog"."default",
  "bruto" varchar COLLATE "pg_catalog"."default",
  "temperatura" float4,
  "productos" varchar COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for termicos
-- ----------------------------
DROP TABLE IF EXISTS "sicpoa"."termicos";
CREATE TABLE "sicpoa"."termicos" (
  "patente" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "fec_alta" timestamp(6) NOT NULL DEFAULT now(),
  "usuario" varchar COLLATE "pg_catalog"."default" NOT NULL DEFAULT CURRENT_USER,
  "usuario_app" varchar COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "sicpoa"."depositos_depo_id_seq"
OWNED BY "sicpoa"."depositos"."depo_id";
SELECT setval('"sicpoa"."depositos_depo_id_seq"', 33, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "sicpoa"."detalles_documento_dedo_id_seq"
OWNED BY "sicpoa"."detalles_documento"."dedo_id";
SELECT setval('"sicpoa"."detalles_documento_dedo_id_seq"', 43, true);

-- ----------------------------
-- Primary Key structure for table choferes
-- ----------------------------
ALTER TABLE "sicpoa"."choferes" ADD CONSTRAINT "choferes_pk" PRIMARY KEY ("dni");

-- ----------------------------
-- Primary Key structure for table depositos
-- ----------------------------
ALTER TABLE "sicpoa"."depositos" ADD CONSTRAINT "depositos_pk" PRIMARY KEY ("depo_id");

-- ----------------------------
-- Primary Key structure for table deta_infracciones
-- ----------------------------
ALTER TABLE "sicpoa"."deta_infracciones" ADD CONSTRAINT "deta_infracciones_pk" PRIMARY KEY ("case_id", "tiin_id");

-- ----------------------------
-- Primary Key structure for table detalles_documento
-- ----------------------------
ALTER TABLE "sicpoa"."detalles_documento" ADD CONSTRAINT "detalles_documento_pk" PRIMARY KEY ("dedo_id");

-- ----------------------------
-- Indexes structure for table documentos
-- ----------------------------
CREATE INDEX "documentos_fec_alta_idx" ON "sicpoa"."documentos" USING btree (
  "fec_alta" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table documentos
-- ----------------------------
ALTER TABLE "sicpoa"."documentos" ADD CONSTRAINT "documentos_pk" PRIMARY KEY ("num_documento", "tido_id");

-- ----------------------------
-- Indexes structure for table empresas
-- ----------------------------
CREATE INDEX "empresas_num_establecimiento_idx" ON "sicpoa"."empresas" USING btree (
  "num_establecimiento" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "empresas_razon_social_idx" ON "sicpoa"."empresas" USING btree (
  "razon_social" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table empresas
-- ----------------------------
ALTER TABLE "sicpoa"."empresas" ADD CONSTRAINT "empresas_pk" PRIMARY KEY ("cuit");

-- ----------------------------
-- Primary Key structure for table infracciones
-- ----------------------------
ALTER TABLE "sicpoa"."infracciones" ADD CONSTRAINT "infracciones_pk" PRIMARY KEY ("case_id");

-- ----------------------------
-- Indexes structure for table inspecciones
-- ----------------------------
CREATE INDEX "inspecciones_fec_alta_idx" ON "sicpoa"."inspecciones" USING btree (
  "fec_alta" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "inspecciones_resultado_idx" ON "sicpoa"."inspecciones" USING btree (
  "resultado" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table inspecciones
-- ----------------------------
ALTER TABLE "sicpoa"."inspecciones" ADD CONSTRAINT "actas_pk" PRIMARY KEY ("case_id");

-- ----------------------------
-- Checks structure for table inspecciones_empresas
-- ----------------------------
ALTER TABLE "sicpoa"."inspecciones_empresas" ADD CONSTRAINT "inspecciones_empresas_check" CHECK ((((rol)::text = 'ORIGEN'::text) OR ((rol)::text = 'DESTINO'::text) OR ((rol)::text = 'TRANSPORTISTA'::text)));

-- ----------------------------
-- Primary Key structure for table inspecciones_empresas
-- ----------------------------
ALTER TABLE "sicpoa"."inspecciones_empresas" ADD CONSTRAINT "inspecciones_empresas_pk" PRIMARY KEY ("empr_id", "case_id", "rol");

-- ----------------------------
-- Primary Key structure for table inspecciones_termicos
-- ----------------------------
ALTER TABLE "sicpoa"."inspecciones_termicos" ADD CONSTRAINT "inspecciones_termicos_pk" PRIMARY KEY ("case_id", "term_id");

-- ----------------------------
-- Checks structure for table permisos_transito
-- ----------------------------
ALTER TABLE "sicpoa"."permisos_transito" ADD CONSTRAINT "permisos_transito_check" CHECK ((((tipo)::text = 'PT'::text) OR ((tipo)::text = 'PTR'::text)));

-- ----------------------------
-- Primary Key structure for table permisos_transito
-- ----------------------------
ALTER TABLE "sicpoa"."permisos_transito" ADD CONSTRAINT "permisos_transito_pk" PRIMARY KEY ("perm_id", "case_id");

-- ----------------------------
-- Primary Key structure for table termicos
-- ----------------------------
ALTER TABLE "sicpoa"."termicos" ADD CONSTRAINT "termicos_pk" PRIMARY KEY ("patente");

-- ----------------------------
-- Foreign Keys structure for table depositos
-- ----------------------------
ALTER TABLE "sicpoa"."depositos" ADD CONSTRAINT "depositos_depa_id_fk" FOREIGN KEY ("depa_id") REFERENCES "core"."tablas" ("tabl_id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "sicpoa"."depositos" ADD CONSTRAINT "depositos_empr_id_fk" FOREIGN KEY ("empr_id") REFERENCES "sicpoa"."empresas" ("cuit") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table deta_infracciones
-- ----------------------------
ALTER TABLE "sicpoa"."deta_infracciones" ADD CONSTRAINT "deta_infracciones_fk" FOREIGN KEY ("tiin_id") REFERENCES "core"."tablas" ("tabl_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table detalles_documento
-- ----------------------------
ALTER TABLE "sicpoa"."detalles_documento" ADD CONSTRAINT "detalles_documento_fk" FOREIGN KEY ("unme_id") REFERENCES "core"."tablas" ("tabl_id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "sicpoa"."detalles_documento" ADD CONSTRAINT "detalles_documento_num_documento_tido_id_fk" FOREIGN KEY ("docu_id", "tido_id") REFERENCES "sicpoa"."documentos" ("num_documento", "tido_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table documentos
-- ----------------------------
ALTER TABLE "sicpoa"."documentos" ADD CONSTRAINT "documentos_case_id_fk" FOREIGN KEY ("case_id") REFERENCES "sicpoa"."inspecciones" ("case_id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "sicpoa"."documentos" ADD CONSTRAINT "documentos_empr_id_destino_fk" FOREIGN KEY ("empr_id_destino") REFERENCES "sicpoa"."empresas" ("cuit") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "sicpoa"."documentos" ADD CONSTRAINT "documentos_empr_id_emisor_fk" FOREIGN KEY ("empr_id_emisor") REFERENCES "sicpoa"."empresas" ("cuit") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "sicpoa"."documentos" ADD CONSTRAINT "documentos_imag_id_fk" FOREIGN KEY ("imag_id") REFERENCES "frm"."instancias_formularios" ("inst_id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "sicpoa"."documentos" ADD CONSTRAINT "documentos_tido_id_fk" FOREIGN KEY ("tido_id") REFERENCES "core"."tablas" ("tabl_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table infracciones
-- ----------------------------
ALTER TABLE "sicpoa"."infracciones" ADD CONSTRAINT "infracciones_case_id_fk" FOREIGN KEY ("case_id") REFERENCES "sicpoa"."inspecciones" ("case_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table inspecciones
-- ----------------------------
ALTER TABLE "sicpoa"."inspecciones" ADD CONSTRAINT "inspecciones_chof_id_fk" FOREIGN KEY ("chof_id") REFERENCES "sicpoa"."choferes" ("dni") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "sicpoa"."inspecciones" ADD CONSTRAINT "inspecciones_fk" FOREIGN KEY ("departamento") REFERENCES "core"."tablas" ("tabl_id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "sicpoa"."inspecciones" ADD CONSTRAINT "inspecciones_inca_id_fk" FOREIGN KEY ("inca_id") REFERENCES "frm"."instancias_formularios" ("inst_id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "sicpoa"."inspecciones" ADD CONSTRAINT "inspecciones_petr_id_fk" FOREIGN KEY ("petr_id") REFERENCES "pro"."pedidos_trabajo" ("petr_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table inspecciones_empresas
-- ----------------------------
ALTER TABLE "sicpoa"."inspecciones_empresas" ADD CONSTRAINT "inspecciones_empresas_case_id_fk" FOREIGN KEY ("case_id") REFERENCES "sicpoa"."inspecciones" ("case_id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "sicpoa"."inspecciones_empresas" ADD CONSTRAINT "inspecciones_empresas_depo_id_fk" FOREIGN KEY ("depo_id") REFERENCES "sicpoa"."depositos" ("depo_id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "sicpoa"."inspecciones_empresas" ADD CONSTRAINT "inspecciones_empresas_empr_id_fk" FOREIGN KEY ("empr_id") REFERENCES "sicpoa"."empresas" ("cuit") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table inspecciones_termicos
-- ----------------------------
ALTER TABLE "sicpoa"."inspecciones_termicos" ADD CONSTRAINT "inspecciones_termicos_case_id_fk" FOREIGN KEY ("case_id") REFERENCES "sicpoa"."inspecciones" ("case_id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "sicpoa"."inspecciones_termicos" ADD CONSTRAINT "inspecciones_termicos_term_id_fk" FOREIGN KEY ("term_id") REFERENCES "sicpoa"."termicos" ("patente") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table permisos_transito
-- ----------------------------
ALTER TABLE "sicpoa"."permisos_transito" ADD CONSTRAINT "permisos_transito_case_id_fk" FOREIGN KEY ("case_id") REFERENCES "sicpoa"."inspecciones" ("case_id") ON DELETE NO ACTION ON UPDATE NO ACTION;
