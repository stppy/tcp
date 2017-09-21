-- Adminer 4.3.1 PostgreSQL dump

\connect "tablero2015v3";

CREATE SEQUENCE accion_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."accion" (
    "id" integer DEFAULT nextval('accion_id_seq') NOT NULL,
    "costo" double precision,
    "fecha_inicio" date DEFAULT 2017-01-01,
    "fecha_fin" date DEFAULT 2017-12-31,
    "version" integer,
    "borrado" boolean DEFAULT false,
    "meta1" double precision,
    "meta2" double precision,
    "meta3" double precision,
    "meta4" double precision,
    "ins_linea_accion_id" integer,
    "depto_id" integer,
    "dist_id" integer,
    "id_accion_catalogo" integer,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    "peso" double precision,
    CONSTRAINT "accion_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "id_accion_uk" UNIQUE ("id"),
    CONSTRAINT "fk_accion_catalogo1" FOREIGN KEY (id_accion_catalogo) REFERENCES accion_catalogo(id) NOT DEFERRABLE
) WITH (oids = true);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."accion" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE accion_catalogo_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."accion_catalogo" (
    "id" integer DEFAULT nextval('accion_catalogo_id_seq') NOT NULL,
    "nombre" text,
    "descripcion" text,
    "id_unidad_medida" integer NOT NULL,
    "version" integer,
    "borrado" boolean,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "accion_catalogo_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "fk_unidad_medida1" FOREIGN KEY (id_unidad_medida) REFERENCES unidad_medida(id) NOT DEFERRABLE
) WITH (oids = true);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."accion_catalogo" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE TABLE "public"."accion_has_etiqueta" (
    "accion_id" integer NOT NULL,
    "etiqueta_id" integer NOT NULL,
    "proporcion" integer,
    "version" integer,
    "borrado" boolean,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "accion_has_etiqueta_pk" PRIMARY KEY ("accion_id", "etiqueta_id")
) WITH (oids = false);

CREATE INDEX "fk_accion_has_etiqueta_accion1_idx" ON "public"."accion_has_etiqueta" USING btree ("accion_id");

CREATE INDEX "fk_accion_has_etiqueta_etiqueta1_idx" ON "public"."accion_has_etiqueta" USING btree ("etiqueta_id");

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."accion_has_etiqueta" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE TABLE "public"."accion_has_geo_poligono" (
    "accion_id" integer NOT NULL,
    "geo_poligono_id" integer NOT NULL,
    "geo_poligono_geo_poligono_id" integer NOT NULL,
    "geo_poligono_tipo_id" integer NOT NULL,
    "proporcion" integer,
    "version" integer,
    "borrado" boolean,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "accion_has_geo_poligono_pk" PRIMARY KEY ("accion_id", "geo_poligono_id", "geo_poligono_geo_poligono_id")
) WITH (oids = false);

CREATE INDEX "fk_accion_has_geo_poligono_accion1_idx" ON "public"."accion_has_geo_poligono" USING btree ("accion_id");

CREATE INDEX "fk_accion_has_geo_poligono_geo_poligono1_idx" ON "public"."accion_has_geo_poligono" USING btree ("geo_poligono_id", "geo_poligono_geo_poligono_id");

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."accion_has_geo_poligono" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE accion_has_producto_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."accion_has_producto" (
    "id" integer DEFAULT nextval('accion_has_producto_id_seq') NOT NULL,
    "proporcion" integer,
    "accion_id" integer NOT NULL,
    "spr_producto_id" integer NOT NULL,
    "version" integer,
    "borrado" boolean DEFAULT false,
    "srp_proyecto_id" integer NOT NULL,
    "spr_subprograma_id" integer NOT NULL,
    "spr_programa_id" integer NOT NULL,
    "spr_tiprograma_id" integer NOT NULL,
    "spr_entidad_id" integer NOT NULL,
    "spr_nivel_id" integer NOT NULL,
    "spr_anho" integer NOT NULL,
    "spr_version" integer NOT NULL,
    "u_medida" text,
    "cant_fisica" double precision,
    "clase" text,
    "cant_financiera" double precision,
    "asignacion_financiera" double precision,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "accion_has_producto_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE INDEX "accion_has_producto_fk_accion_has_producto_accion1_idx" ON "public"."accion_has_producto" USING btree ("accion_id");

CREATE INDEX "accion_has_producto_fk_accion_has_producto_spr-producto1_idx" ON "public"."accion_has_producto" USING btree ("spr_producto_id");

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."accion_has_producto" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE actividad_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."actividad" (
    "id" integer DEFAULT nextval('actividad_id_seq') NOT NULL,
    "nombre" text,
    "descripcion" text,
    "proporcion" double precision,
    "peso" double precision,
    "version" integer,
    "borrado" boolean,
    "accion_id" integer NOT NULL,
    "unidad_medida_id" integer NOT NULL,
    "hito_tipo_id" integer NOT NULL,
    "acumulable" boolean DEFAULT true,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    "prod_concat" text,
    CONSTRAINT "actividad_id_UNIQUE" UNIQUE ("id"),
    CONSTRAINT "actividad_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "fk_actividad_accion1" FOREIGN KEY (accion_id) REFERENCES accion(id) NOT DEFERRABLE,
    CONSTRAINT "fk_actividad_hito_tipo1" FOREIGN KEY (hito_tipo_id) REFERENCES hito_tipo(id) NOT DEFERRABLE,
    CONSTRAINT "fk_actividad_unidad_medida1" FOREIGN KEY (unidad_medida_id) REFERENCES unidad_medida(id) NOT DEFERRABLE
) WITH (oids = false);

CREATE INDEX "actividad_fk_actividad_accion1_idx" ON "public"."actividad" USING btree ("accion_id");

CREATE INDEX "actividad_fk_actividad_hito_tipo1_idx" ON "public"."actividad" USING btree ("hito_tipo_id");

CREATE INDEX "actividad_fk_actividad_unidad_medida1_idx" ON "public"."actividad" USING btree ("unidad_medida_id");

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."actividad" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE avance_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."avance" (
    "id" integer DEFAULT nextval('avance_id_seq') NOT NULL,
    "justificacion" text,
    "cantidad" double precision,
    "fecha_entrega" date,
    "cantidad_beneficiarios" integer,
    "actividad_id" integer NOT NULL,
    "version" integer,
    "borrado" boolean DEFAULT false,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    "distrito_avance" integer,
    "departamento_id" integer,
    CONSTRAINT "avance_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "fk_avance_actividad1" FOREIGN KEY (actividad_id) REFERENCES actividad(id) NOT DEFERRABLE
) WITH (oids = false);

CREATE INDEX "avance_fk_avance_actividad1_idx" ON "public"."avance" USING btree ("actividad_id");

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."avance" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE avance_costo_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."avance_costo" (
    "id" integer DEFAULT nextval('avance_costo_id_seq') NOT NULL,
    "monto" double precision,
    "codigo_contratacionl" text,
    "objeto_gasto" integer,
    "avance_id" integer NOT NULL,
    "version" integer,
    "borrado" boolean DEFAULT false,
    "producto_concat" text,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "avance_costo_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "fk_avance_costo_avance" FOREIGN KEY (avance_id) REFERENCES avance(id) NOT DEFERRABLE
) WITH (oids = false);

CREATE INDEX "avance_costo_fk_avance_costo_avance_idx" ON "public"."avance_costo" USING btree ("avance_id");

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."avance_costo" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE "avancesHito_id_seq" INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."avanceshito" (
    "id" integer DEFAULT nextval('"avancesHito_id_seq"') NOT NULL,
    "cantidad" integer NOT NULL,
    "url" character(50) NOT NULL,
    "fecha" date NOT NULL,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT 
) WITH (oids = false);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."avanceshito" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE beneficiario_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."beneficiario" (
    "id" integer DEFAULT nextval('beneficiario_id_seq') NOT NULL,
    "nombre" text,
    "descripcion" text,
    "beneficiario_tipo_id" integer NOT NULL,
    "version" integer,
    "borrado" boolean DEFAULT false,
    "cantidad" integer,
    "avance_id" integer,
    "beneficiario_grupo_id" integer,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "beneficiario_pk" PRIMARY KEY ("id"),
    CONSTRAINT "avance_id_pk" FOREIGN KEY (avance_id) REFERENCES avance(id) NOT DEFERRABLE,
    CONSTRAINT "beneficiario_grupo_id_fk" FOREIGN KEY (beneficiario_grupo_id) REFERENCES beneficiario_grupo(id) NOT DEFERRABLE
) WITH (oids = true);

CREATE INDEX "fk_beneficiario_beneficiario_tipo1_idx" ON "public"."beneficiario" USING btree ("beneficiario_tipo_id");

CREATE INDEX "fki_avance_id_pk" ON "public"."beneficiario" USING btree ("avance_id");

CREATE INDEX "fki_beneficiario_grupo_id_fk" ON "public"."beneficiario" USING btree ("beneficiario_grupo_id");

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."beneficiario" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE beneficiario_detalle_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."beneficiario_detalle" (
    "id" integer DEFAULT nextval('beneficiario_detalle_id_seq') NOT NULL,
    "valor" text,
    "beneficiario_detalle_claves_id" integer NOT NULL,
    "beneficiario_id" integer NOT NULL,
    "version" integer,
    "borrado" boolean,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "beneficiario_detalle_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE INDEX "beneficiario_detalle_fk_beneficiario_detalle_beneficiario1_idx" ON "public"."beneficiario_detalle" USING btree ("beneficiario_id");

CREATE INDEX "fk_beneficiario_detalle_beneficiario1_idx" ON "public"."beneficiario_detalle" USING btree ("beneficiario_id");

CREATE INDEX "fk_beneficiario_detalle_beneficiario_detalle_claves1_idx" ON "public"."beneficiario_detalle" USING btree ("beneficiario_detalle_claves_id");

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."beneficiario_detalle" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE beneficiario_detalle_clave_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."beneficiario_detalle_clave" (
    "id" integer DEFAULT nextval('beneficiario_detalle_clave_id_seq') NOT NULL,
    "clave" text,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "beneficiario_detalle_clave_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."beneficiario_detalle_clave" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE beneficiario_tipo_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."beneficiario_tipo" (
    "id" integer DEFAULT nextval('beneficiario_tipo_id_seq') NOT NULL,
    "nombre" text,
    "descripcion" text,
    "version" integer,
    "borrado" boolean DEFAULT false,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "beneficiario_tipo_pk" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."beneficiario_tipo" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE clase_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."clase" (
    "id" integer DEFAULT nextval('clase_id_seq') NOT NULL,
    "codigo" character varying(30) NOT NULL,
    "descripcion" character varying(100) NOT NULL,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "pk_clase" PRIMARY KEY ("id"),
    CONSTRAINT "uq_clase_codigo" UNIQUE ("codigo")
) WITH (oids = true);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."clase" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE TABLE "public"."departamento" (
    "id" integer NOT NULL,
    "nombre" character varying(50),
    "paisid" character varying(2),
    "gobernador_id" integer,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "pk_id" PRIMARY KEY ("id"),
    CONSTRAINT "departamento_fk" FOREIGN KEY (paisid) REFERENCES pais(id) NOT DEFERRABLE
) WITH (oids = true);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."departamento" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE TABLE "public"."distrito" (
    "departamentoid" integer NOT NULL,
    "id" integer NOT NULL,
    "descripcion" character varying(50),
    "intendente_id" integer,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    "borrado" boolean DEFAULT false,
    CONSTRAINT "pk_distrito" PRIMARY KEY ("departamentoid", "id"),
    CONSTRAINT "distrito_fk" FOREIGN KEY (departamentoid) REFERENCES departamento(id) NOT DEFERRABLE
) WITH (oids = true);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."distrito" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE empresa_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."empresa" (
    "id" integer DEFAULT nextval('empresa_id_seq') NOT NULL,
    "razon_social" character varying(1000) NOT NULL,
    "localid" integer,
    "capsocial" numeric(18,2),
    "tiponegocioid" integer,
    "claseid" integer,
    "naturaleza" character varying(100),
    "fechainicio" date,
    "ruc" character varying(50) NOT NULL,
    "email" character varying(50),
    "contrasenha" character varying(50),
    "telefono" character varying(20),
    "celular" character varying(20),
    "fax" character varying(20),
    "tipo_sociedad" integer,
    "rubro" integer,
    "fecha_constitucion" date,
    "activo" character varying(1),
    "valido" character varying(1),
    "siglas" character varying(10),
    "codigo" character varying(10),
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "empresa_idx" UNIQUE ("ruc"),
    CONSTRAINT "empresa_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "empresa_fk" FOREIGN KEY (tiponegocioid) REFERENCES tiponegocio(id) NOT DEFERRABLE,
    CONSTRAINT "fk_empresa_clase" FOREIGN KEY (claseid) REFERENCES clase(id) NOT DEFERRABLE
) WITH (oids = true);

CREATE INDEX "empresa_idx_1" ON "public"."empresa" USING btree ("ruc");

CREATE INDEX "empresa_idx_2" ON "public"."empresa" USING btree ("razon_social");

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."empresa" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE etiqueta_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."etiqueta" (
    "id" integer DEFAULT nextval('etiqueta_id_seq') NOT NULL,
    "nombre" text,
    "descripcion" text,
    "version" integer,
    "borrado" boolean,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "etiqueta_pk" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."etiqueta" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE evidencia_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."evidencia" (
    "id" integer DEFAULT nextval('evidencia_id_seq') NOT NULL,
    "nombre" text,
    "descripcion" text,
    "url" text,
    "ws_id" integer NOT NULL,
    "version" integer,
    "borrado" boolean DEFAULT false,
    "avance_id" integer NOT NULL,
    "url_documento" text,
    "latitud" double precision,
    "longitud" double precision,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "evidencia_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "fk_evidencia_avance1" FOREIGN KEY (avance_id) REFERENCES avance(id) NOT DEFERRABLE,
    CONSTRAINT "fk_evidencia_ws1" FOREIGN KEY (ws_id) REFERENCES ws(id) NOT DEFERRABLE
) WITH (oids = false);

CREATE INDEX "evidencia_fk_evidencia_avance1_idx" ON "public"."evidencia" USING btree ("avance_id");

CREATE INDEX "evidencia_fk_evidencia_ws1_idx" ON "public"."evidencia" USING btree ("ws_id");

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."evidencia" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE TABLE "public"."geo_dgeec" (
    "dgeec_id" text,
    "departamento_id" integer,
    "departamento" text,
    "distrito_id" integer,
    "distrito" text,
    "area_id" integer,
    "area" text,
    "bar_loc_id" integer,
    "barrio_localidad" text,
    "version" integer,
    "borrado" boolean,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT 
) WITH (oids = false);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."geo_dgeec" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE geo_poligono_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."geo_poligono" (
    "id" integer DEFAULT nextval('geo_poligono_id_seq') NOT NULL,
    "nombre" text,
    "descripcion" text,
    "geo" text,
    "geo_poligono_id" integer NOT NULL,
    "geo_poligono_tipo_id" integer NOT NULL,
    "version" integer,
    "borrado" boolean,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT 
) WITH (oids = false);

CREATE INDEX "fk_geo_poligono_geo_poligono1_idx" ON "public"."geo_poligono" USING btree ("geo_poligono_id");

CREATE INDEX "fk_geo_poligono_geo_poligono_tipo1_idx" ON "public"."geo_poligono" USING btree ("geo_poligono_tipo_id");

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."geo_poligono" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE geo_poligono_tipo_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."geo_poligono_tipo" (
    "id" integer DEFAULT nextval('geo_poligono_tipo_id_seq') NOT NULL,
    "nombre" text,
    "descripcion" text,
    "version" integer,
    "borrado" boolean,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "geo_poligono_tipo_pk" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."geo_poligono_tipo" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE hito_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."hito" (
    "id" integer DEFAULT nextval('hito_id_seq') NOT NULL,
    "ins_linea_accion_id" integer,
    "nombre" text,
    "descripcion" text,
    "cantidad" double precision,
    "fecha_entrega" date,
    "unidad_medida_id" integer,
    "peso" integer,
    "hito_tipo_id" integer NOT NULL,
    "accion_id" integer NOT NULL,
    "evidencia_id" integer NOT NULL,
    "version" integer,
    "borrado" boolean,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT 
) WITH (oids = false);

CREATE INDEX "fk_hito_accion1_idx" ON "public"."hito" USING btree ("accion_id");

CREATE INDEX "fk_hito_evidencia1_idx" ON "public"."hito" USING btree ("evidencia_id");

CREATE INDEX "fk_hito_hito_tipo1_idx" ON "public"."hito" USING btree ("hito_tipo_id");

CREATE INDEX "fk_hito_unidad_medida1_idx" ON "public"."hito" USING btree ("unidad_medida_id");

CREATE INDEX "hito_fk_hito_accion1_idx" ON "public"."hito" USING btree ("accion_id");

CREATE INDEX "hito_fk_hito_evidencia1_idx" ON "public"."hito" USING btree ("evidencia_id");

CREATE INDEX "hito_fk_hito_hito_tipo1_idx" ON "public"."hito" USING btree ("hito_tipo_id");

CREATE INDEX "hito_fk_hito_unidad_medida1_idx" ON "public"."hito" USING btree ("unidad_medida_id");

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."hito" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE "hitoPrueba_id_seq" INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."hitoprueba" (
    "id" integer DEFAULT nextval('"hitoPrueba_id_seq"') NOT NULL,
    "accion" text,
    "nombrehito" text,
    "tipohito" text,
    "unidadmedida" text,
    "cantidadprevista" bigint,
    "cantidadreal" bigint,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT 
) WITH (oids = false);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."hitoprueba" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE TABLE "public"."hito_has_beneficiario" (
    "hito_id" integer NOT NULL,
    "hito_accion_id" integer NOT NULL,
    "beneficiario_id" integer NOT NULL,
    "version" integer,
    "borrado" boolean,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "hito_has_beneficiario_pk" PRIMARY KEY ("hito_id", "hito_accion_id", "beneficiario_id")
) WITH (oids = false);

CREATE INDEX "fk_hito_has_beneficiario_beneficiario1_idx" ON "public"."hito_has_beneficiario" USING btree ("beneficiario_id");

CREATE INDEX "fk_hito_has_beneficiario_hito1_idx" ON "public"."hito_has_beneficiario" USING btree ("hito_id", "hito_accion_id");

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."hito_has_beneficiario" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE hito_tipo_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."hito_tipo" (
    "id" integer DEFAULT nextval('hito_tipo_id_seq') NOT NULL,
    "nombre" text,
    "descripcion" text,
    "version" integer,
    "borrado" boolean,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "hito_tipo_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."hito_tipo" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE ins_linea_accion_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."ins_linea_accion" (
    "id" integer DEFAULT nextval('ins_linea_accion_id_seq') NOT NULL,
    "linea_accion_id" integer NOT NULL,
    "institucion_id" integer NOT NULL,
    "periodo_id" integer NOT NULL,
    "meta" double precision,
    "version" integer,
    "borrado" boolean,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "ins_linea_accion_id_pk" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE INDEX "fk_ins_linea_accion_institucion1_idx" ON "public"."ins_linea_accion" USING btree ("institucion_id");

CREATE INDEX "fk_ins_linea_accion_linea_accion1_idx" ON "public"."ins_linea_accion" USING btree ("linea_accion_id");

CREATE INDEX "fk_ins_linea_accion_periodo1_idx" ON "public"."ins_linea_accion" USING btree ("periodo_id");

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."ins_linea_accion" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE institucion_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."institucion" (
    "id" integer DEFAULT nextval('institucion_id_seq') NOT NULL,
    "nombre" text,
    "descripcion" text,
    "sigla" text,
    "orden" integer,
    "nivel_id" integer,
    "entidad_id" integer,
    "unidad_jerarquica_id" integer,
    "unidad_responsable_id" integer,
    "version" integer,
    "borrado" boolean,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "institucion_pk" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."institucion" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE linea_accion_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."linea_accion" (
    "id" integer DEFAULT nextval('linea_accion_id_seq') NOT NULL,
    "nombre" text,
    "descripcion" text,
    "peso" integer,
    "acumular" boolean,
    "tipo_accion_id" integer NOT NULL,
    "estrategia_id" integer NOT NULL,
    "unidad_medida_id" integer NOT NULL,
    "orden" integer,
    "version" integer,
    "borrado" boolean,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "linea_accion_pk" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE INDEX "fk_linea_accion_estrategia1_idx" ON "public"."linea_accion" USING btree ("estrategia_id");

CREATE INDEX "fk_linea_accion_tipo_accion1_idx" ON "public"."linea_accion" USING btree ("tipo_accion_id");

CREATE INDEX "fk_linea_accion_unidad_medida1_idx" ON "public"."linea_accion" USING btree ("unidad_medida_id");

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."linea_accion" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE linea_estrategica_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."linea_estrategica" (
    "id" integer DEFAULT nextval('linea_estrategica_id_seq') NOT NULL,
    "nombre" text,
    "descripcion" text,
    "orden" integer,
    "version" integer,
    "borrado" boolean,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "linea_estrategica_pk" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."linea_estrategica" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE TABLE "public"."pais" (
    "id" character varying(2) NOT NULL,
    "descripcion" character varying(200),
    "nacionalidad" character varying(200),
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "pais_pkey" PRIMARY KEY ("id")
) WITH (oids = true);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."pais" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE TABLE "public"."periodo" (
    "id" integer NOT NULL,
    "nombre" text,
    "descripcion" text,
    "fecha_inicio" date,
    "fecha_fin" date,
    "version" integer,
    "borrado" boolean,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT 
) WITH (oids = false);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."periodo" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE programacion_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."programacion" (
    "cantidad" double precision,
    "fecha_entrega" date,
    "version" integer,
    "borrado" boolean DEFAULT false,
    "actividad_id" integer NOT NULL,
    "id" integer DEFAULT nextval('programacion_id_seq') NOT NULL,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "fk_programacion_actividad" FOREIGN KEY (actividad_id) REFERENCES actividad(id) NOT DEFERRABLE
) WITH (oids = false);

CREATE INDEX "programacion_fk_programacion_actividad_idx" ON "public"."programacion" USING btree ("actividad_id");

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."programacion" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE spr_producto_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."spr_producto" (
    "id" integer DEFAULT nextval('spr_producto_id_seq') NOT NULL,
    "nivel_id" integer,
    "entidad_id" integer,
    "tipo_id" integer,
    "progama_id" integer,
    "subprograma_id" integer,
    "proyecto_id" integer,
    "funcional_id" integer,
    "unidad_responsable_id" integer,
    "producto_id" integer,
    "version" integer,
    "borrado" boolean,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "spr_producto_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."spr_producto" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE tipo_accion_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."tipo_accion" (
    "id" integer DEFAULT nextval('tipo_accion_id_seq') NOT NULL,
    "nombre" text,
    "descripcion" text,
    "version" integer,
    "borrado" boolean,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT 
) WITH (oids = false);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."tipo_accion" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE tipo_sociedad_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."tipo_sociedad" (
    "id" integer DEFAULT nextval('tipo_sociedad_id_seq') NOT NULL,
    "codigo" character varying(30) NOT NULL,
    "descripcion" character varying(100) NOT NULL,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT 
) WITH (oids = true);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."tipo_sociedad" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE tiponegocio_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."tiponegocio" (
    "id" integer DEFAULT nextval('tiponegocio_id_seq') NOT NULL,
    "descripcion" character varying(100) NOT NULL,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "pk_tiponegocio" PRIMARY KEY ("id"),
    CONSTRAINT "uq_tiponegocio_descripcion" UNIQUE ("descripcion")
) WITH (oids = true);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."tiponegocio" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE unidad_medida_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."unidad_medida" (
    "id" integer DEFAULT nextval('unidad_medida_id_seq') NOT NULL,
    "nombre" text,
    "descripcion" text,
    "sigla" text,
    "version" integer,
    "borrado" boolean,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "unidad_medida_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."unidad_medida" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE usuario_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."usuario" (
    "id" integer DEFAULT nextval('usuario_id_seq') NOT NULL,
    "correo" text NOT NULL,
    "passwd" text,
    "last_login" timestamp,
    "entidad" text,
    "role_id" integer NOT NULL,
    "entidad_id" integer,
    "nivel_id" integer,
    "nombre" text,
    "urlimagen" text,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    "email_real" character varying DEFAULT true,
    "unr_id" integer,
    "role_id_movil" integer,
    "role_id_tablero" integer,
    "role_identificaciones" integer,
    "borrado" character varying DEFAULT false,
    "url" text,
    CONSTRAINT "correo_pk" PRIMARY KEY ("correo")
) WITH (oids = false);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."usuario" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE usuario_linea_accion_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."usuario_linea_accion" (
    "id" integer DEFAULT nextval('usuario_linea_accion_id_seq') NOT NULL,
    "usuario_correo" text NOT NULL,
    "linea_accion_id" integer NOT NULL,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    "borrado" boolean DEFAULT false,
    CONSTRAINT "pk_uni_usuario_linea_accion_id" UNIQUE ("usuario_correo", "linea_accion_id")
) WITH (oids = false);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."usuario_linea_accion" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE ws_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."ws" (
    "id" integer DEFAULT nextval('ws_id_seq') NOT NULL,
    "nombre" text,
    "descripcion" text,
    "url" text,
    "metodo" text,
    "usuario" text,
    "pass" text,
    "id_clave" text,
    "id_valor" text,
    "ws_tipo_id" integer NOT NULL,
    "version" integer,
    "borrado" boolean DEFAULT false,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "ws_pk" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE INDEX "fk_ws_ws_tipo1_idx" ON "public"."ws" USING btree ("ws_tipo_id");

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."ws" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE ws_tipo_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."ws_tipo" (
    "id" integer DEFAULT nextval('ws_tipo_id_seq') NOT NULL,
    "nombre" text,
    "descripcion" text,
    "borrado" boolean DEFAULT false,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "ws_tipo_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."ws_tipo" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE beneficiario_grupo_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."beneficiario_grupo" (
    "id" integer DEFAULT nextval('beneficiario_grupo_id_seq') NOT NULL,
    "tipo_beneficiario_grupo_id" integer NOT NULL,
    "nombre" text,
    "descripcion" text,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "beneficiario_grupo_pk" PRIMARY KEY ("id"),
    CONSTRAINT "beneficiario_grupo_fk" FOREIGN KEY (tipo_beneficiario_grupo_id) REFERENCES beneficiario_tipo(id) NOT DEFERRABLE
) WITH (oids = false);

CREATE INDEX "fki_beneficiario_grupo_fk" ON "public"."beneficiario_grupo" USING btree ("tipo_beneficiario_grupo_id");

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."beneficiario_grupo" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE TABLE "public"."producto_presupuesto_financiero" (
    "id" double precision,
    "nivel" integer,
    "entidad" integer,
    "tipo" integer,
    "programa" integer,
    "subprograma" integer,
    "proyecto" integer,
    "grupo_objeto_gasto_id" integer,
    "subgrupo_objeto_gasto_id" integer,
    "objeto_gasto_id" integer,
    "fuente_id" integer,
    "funcional_id" integer,
    "funcional_nombre" character varying(21845),
    "departamento_id" integer,
    "producto_id" integer,
    "producto_nombre" character varying(21845),
    "unidad_medida_id" integer,
    "nombre_unidad_medida" character varying(21845),
    "mes" integer,
    "snip" integer,
    "meta" double precision,
    "asignacion" double precision,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT 
) WITH (oids = true);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."producto_presupuesto_financiero" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE TABLE "v_objetogastos" ("spr_producto_id" integer, "srp_proyecto_id" integer, "spr_subprograma_id" integer, "spr_programa_id" integer, "spr_tiprograma_id" integer, "spr_entidad_id" integer, "spr_nivel_id" integer, "objeto_gasto_id" integer, "accion_id" integer);


CREATE SEQUENCE ws_accion_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."ws_accion" (
    "id" integer DEFAULT nextval('ws_accion_id_seq') NOT NULL,
    "linea_accion_id" integer,
    "periodo_id" integer,
    "institucion_id" integer,
    "accion_id" integer,
    "dpto_id" integer,
    "dist_id" integer,
    "fecha_inicio" date,
    "fecha_fin" date,
    "meta_trim1" integer,
    "meta_trim2" integer,
    "meta_trim3" integer,
    "meta_trim4" integer,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "ws_accion_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."ws_accion" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE ws_cronograma_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."ws_cronograma" (
    "id" integer DEFAULT nextval('ws_cronograma_id_seq') NOT NULL,
    "linea_accion_id" integer,
    "periodo_id" integer,
    "institucion_id" integer,
    "accion_id" integer,
    "dpto_id" integer,
    "dist_id" integer,
    "cronograma_tipo_id" integer,
    "cronograma_um_id" integer,
    "cronograma_nombre" text,
    "peso" integer,
    "proporcion" integer,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "ws_cronograma_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."ws_cronograma" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE ws_hito_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."ws_hito" (
    "id" integer DEFAULT nextval('ws_hito_id_seq') NOT NULL,
    "linea_accion_id" integer,
    "periodo_id" integer,
    "institucion_id" integer,
    "accion_id" integer,
    "dpto_id" integer,
    "dist_id" integer,
    "cronograma_id" integer,
    "cantidad" integer,
    "fecha" date,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "ws_hito_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."ws_hito" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE accion_destinatario_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."accion_destinatario" (
    "id" integer DEFAULT nextval('accion_destinatario_id_seq') NOT NULL,
    "cantidad" integer,
    "descripcion" text,
    "version" integer DEFAULT 3,
    "borrado" boolean DEFAULT false,
    "beneficiario_tipo_id" integer NOT NULL,
    "accion_id" integer NOT NULL,
    "beneficiario_grupo_id" integer,
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    "fecha_actualizacion" timestamp DEFAULT now(),
    CONSTRAINT "accion_destinatario_pkey" PRIMARY KEY ("id", "beneficiario_tipo_id", "accion_id"),
    CONSTRAINT "benediciario_grupo_id" FOREIGN KEY (beneficiario_grupo_id) REFERENCES beneficiario_grupo(id) NOT DEFERRABLE
) WITH (oids = false);

CREATE INDEX "accion_destinatario_fk_accion_destinatario_accion1_idx" ON "public"."accion_destinatario" USING btree ("accion_id");

CREATE INDEX "accion_destinatarioeneficiario_tipo1_idx" ON "public"."accion_destinatario" USING btree ("beneficiario_tipo_id");

CREATE INDEX "fki_benediciario_grupo_id" ON "public"."accion_destinatario" USING btree ("beneficiario_grupo_id");

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."accion_destinatario" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE TABLE "acciones_cargadas" ("institicion" text, "linea_orden" integer, "linea_accion" text, "meta_linea_accion" double precision, "unidad_medida" text, "tipo_accion" text, "accion" text, "depto" character varying(50), "dist" character varying(50), "accion_fecha_inicio" date, "meta1" double precision, "meta2" double precision, "meta3" double precision, "meta4" double precision, "accion_fecha_fin" date);


CREATE SEQUENCE ws_producto_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."ws_producto" (
    "id" integer DEFAULT nextval('ws_producto_id_seq') NOT NULL,
    "clase" character varying(1),
    "unidad_medida_id" integer NOT NULL,
    "nombre" character varying(21845),
    "descripcion" character varying(21845),
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT 
) WITH (oids = false);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."ws_producto" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE TABLE "actividad_cantidad" ("id" integer, "cant_prog" double precision);


CREATE TABLE "producto_objeto_gasto" ("id" integer, "accion_id" integer, "spr_nivel_id" integer, "spr_entidad_id" integer, "spr_tiprograma_id" integer, "spr_programa_id" integer, "spr_subprograma_id" integer, "srp_proyecto_id" integer, "spr_producto_id" integer, "producto_concat" text, "version" integer, "borrado" boolean);


CREATE TABLE "acciones_repetidas" ("linea_accion_id" integer, "la_nomnbre" text, "institucion_id" integer, "sigla" text, "periodo_id" integer, "catalogo_id" integer, "accion_catalogo_nombre" text, "depto_id" integer, "dist_id" integer, "repetido" bigint);


CREATE TABLE "public"."dim_fecha" (
    "dim_fecha_pk" integer NOT NULL,
    "fecha" date,
    "dia" smallint,
    "mes" smallint,
    "mesano_texto" text,
    "ano" integer,
    "administracion" text,
    "trimestre" integer,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "dim_fecha_pkey" PRIMARY KEY ("dim_fecha_pk")
) WITH (oids = false);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."dim_fecha" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE TABLE "public"."asignacion_presi_temp" (
    "fila" integer,
    "nivel" integer DEFAULT 0 NOT NULL,
    "entidad" integer DEFAULT 0 NOT NULL,
    "tipo" integer DEFAULT 0 NOT NULL,
    "programa" integer DEFAULT 0 NOT NULL,
    "subprograma" integer DEFAULT 0 NOT NULL,
    "proyecto" integer DEFAULT 0 NOT NULL,
    "objeto_gasto" integer DEFAULT 0 NOT NULL,
    "fuente_financiamiento" integer DEFAULT 0 NOT NULL,
    "organismo_financiador" integer DEFAULT 0 NOT NULL,
    "pais" integer DEFAULT 0 NOT NULL,
    "departamento" integer DEFAULT 0 NOT NULL,
    "producto" integer DEFAULT 0 NOT NULL,
    "observacion" text,
    "planificado1" double precision,
    "ejecutado1" double precision,
    "planificado2" double precision,
    "ejecutado2" double precision,
    "planificado3" double precision,
    "ejecutado3" double precision,
    "planificado4" double precision,
    "ejecutado4" double precision,
    "planificado5" double precision,
    "ejecutado5" double precision,
    "planificado6" double precision,
    "ejecutado6" double precision,
    "planificado7" double precision,
    "ejecutado7" double precision,
    "planificado8" double precision,
    "ejecutado8" double precision,
    "planificado9" double precision,
    "ejecutado9" double precision,
    "planificado10" double precision,
    "ejecutado10" double precision,
    "planificado11" double precision,
    "ejecutado11" double precision,
    "planificado12" double precision,
    "ejecutado12" double precision,
    "anho" integer DEFAULT 0 NOT NULL,
    "version" integer DEFAULT 0 NOT NULL,
    "sumprog" double precision,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "asignacion_presi_temp_pkey" PRIMARY KEY ("anho", "version", "nivel", "entidad", "tipo", "programa", "subprograma", "proyecto", "objeto_gasto", "fuente_financiamiento", "organismo_financiador", "pais", "departamento", "producto")
) WITH (oids = false);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."asignacion_presi_temp" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE TABLE "apt" ("nivel" integer, "entidad" integer, "tipo" integer, "programa" integer, "subprograma" integer, "proyecto" integer, "producto" integer, "observacion" text, "anho" integer, "version" integer, "sum" double precision);


CREATE SEQUENCE documento_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."documento" (
    "id" integer DEFAULT nextval('documento_id_seq') NOT NULL,
    "nombre" text,
    "url" text,
    "descripcion" text,
    "borrado" boolean DEFAULT false,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "documento_pkey" PRIMARY KEY ("id")
) WITH (oids = true);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."documento" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE TABLE "public"."evidencia_has_documento" (
    "evidencia_id" integer NOT NULL,
    "documento_id" integer NOT NULL,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "evidencia_has_documento_pkey" PRIMARY KEY ("evidencia_id", "documento_id"),
    CONSTRAINT "fk_evidencia_has_documento_documento1" FOREIGN KEY (documento_id) REFERENCES documento(id) NOT DEFERRABLE,
    CONSTRAINT "fk_evidencia_has_documento_evidencia1" FOREIGN KEY (evidencia_id) REFERENCES evidencia(id) NOT DEFERRABLE
) WITH (oids = true);

CREATE INDEX "fk_evidencia_has_documento_documento1_idx" ON "public"."evidencia_has_documento" USING btree ("evidencia_id");

CREATE INDEX "fk_evidencia_has_documento_evidencia1_idx" ON "public"."evidencia_has_documento" USING btree ("documento_id");

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."evidencia_has_documento" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE trimestre_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."trimestre" (
    "id" integer DEFAULT nextval('trimestre_id_seq') NOT NULL,
    "nro" integer,
    "anho" integer,
    "descripcion" text,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "id" PRIMARY KEY ("id"),
    CONSTRAINT "nro_anho" UNIQUE ("nro", "anho")
) WITH (oids = true);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."trimestre" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE avance_cualitativo_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."avance_cualitativo" (
    "id" integer DEFAULT nextval('avance_cualitativo_id_seq') NOT NULL,
    "accion_catalogo_id" integer,
    "ins_linea_accion_id" integer,
    "trimestre_id" integer,
    "gestiones_realizadas" text,
    "principales_logros_alcanzados" text,
    "dificultades_lecciones_aprendidas" text,
    "objetivos_del_siguiente_trimestre" text,
    "borrado" boolean DEFAULT false,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "accion_catalogo_id_fk" FOREIGN KEY (accion_catalogo_id) REFERENCES accion_catalogo(id) NOT DEFERRABLE,
    CONSTRAINT "ins_linea_accion_fk" FOREIGN KEY (ins_linea_accion_id) REFERENCES ins_linea_accion(id) NOT DEFERRABLE,
    CONSTRAINT "trimestre_id" FOREIGN KEY (trimestre_id) REFERENCES trimestre(id) NOT DEFERRABLE
) WITH (oids = true);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."avance_cualitativo" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE producto_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."producto" (
    "id" integer DEFAULT nextval('producto_id_seq') NOT NULL,
    "nombre" text,
    "descripcion" text,
    "clase" text,
    "unidad_medida_id" integer,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT 
) WITH (oids = true);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."producto" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE TABLE "ins_linea_accion_base" ("institucion_id" integer, "institucion_orden" integer, "institucion_sigla" text, "linea_accion_id" integer, "la_orden" integer, "linea_accion_nombre" text, "linea_accion_acu" boolean, "linea_tipo" integer, "linea_estrategia" integer, "linea_um_id" integer, "linea_um_nombre" text, "ins_linea_accion_id" integer, "periodo" integer, "meta" double precision);


CREATE TABLE "actividad_avance_cantidad" ("id" integer, "cant_avance" double precision);


CREATE TABLE "actividad_cantidad_hoy" ("id" integer, "cant_prog" double precision);


CREATE TABLE "ins_linea_accion_costo" ("ins_linea_accion_id" integer, "costo" double precision);


CREATE TABLE "ins_linea_accion_costo_estimado" ("ins_linea_accion_id" integer, "inversion_estimada" double precision);


CREATE TABLE "avance_cantidad_beneficiario" ("avance_id" integer, "cantidad" bigint);


CREATE TABLE "actividad_avance_destinatarios" ("id" integer, "cantidad_destinatarios" numeric);


CREATE TABLE "ins_linea_accion_base_dd" ("institucion_id" integer, "institucion_orden" integer, "institucion_sigla" text, "linea_accion_id" integer, "la_orden" integer, "linea_accion_nombre" text, "linea_accion_acu" boolean, "linea_tipo" integer, "linea_estrategia" integer, "linea_um_id" integer, "linea_um_nombre" text, "ins_linea_accion_id" integer, "periodo" integer, "meta" double precision, "depto_id" integer, "depto_nombre" character varying(50), "dist_id" integer, "dist_nombre" character varying(50));


CREATE TABLE "ins_linea_accion_costo_dd" ("ins_linea_accion_id" integer, "depto_id" integer, "dist_id" integer, "costo" double precision);


CREATE TABLE "ins_linea_accion_costo_estimado_dd" ("ins_linea_accion_id" integer, "depto_id" integer, "dist_id" integer, "inversion_estimada" double precision);


CREATE TABLE "ins_linea_accion_destinatario_real_dd" ("ins_linea_accion_id" integer, "depto_id" integer, "dist_id" integer, "beneficiarios_real" numeric);


CREATE TABLE "ins_linea_accion_destinatarios_dd" ("ila_id" integer, "depto_id" integer, "dist_id" integer, "cant_dest" bigint);


CREATE TABLE "ins_linea_accion_destinatario_real" ("ins_linea_accion_id" integer, "beneficiarios_real" numeric);


CREATE TABLE "ins_linea_accion_destinatarios" ("ila_id" integer, "cant_dest" bigint);


CREATE TABLE "ins_lin_acc_ava" ("ins_linea_accion_id" integer, "periodo_id" integer, "linea_accion_nombre" text, "accion_id" integer, "accion_catalogo_nombre" text, "accion_depto_id" integer, "accion_dist_id" integer, "institucion_id" integer, "institucion_sigla" text, "actividad_id" integer, "avance_cantidad" double precision, "avance_cantidad_beneficiarios" integer, "avance_fecha_entrega" date);


CREATE TABLE "public"."ins_linea_accion_has_etiqueta" (
    "ins_linea_accion_id" integer NOT NULL,
    "etiqueta_id" integer NOT NULL,
    "version" integer,
    "borrado" boolean DEFAULT false,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "ins_linea_accion_has_etiqueta_pkey" PRIMARY KEY ("ins_linea_accion_id", "etiqueta_id"),
    CONSTRAINT "fk_ins_linea_accion_has_etiqueta_etiqueta1" FOREIGN KEY (etiqueta_id) REFERENCES etiqueta(id) NOT DEFERRABLE,
    CONSTRAINT "fk_ins_linea_accion_has_etiqueta_ins_linea_accion1" FOREIGN KEY (ins_linea_accion_id) REFERENCES ins_linea_accion(id) NOT DEFERRABLE
) WITH (oids = false);

CREATE INDEX "fk_ins_linea_accion_has_etiqueta1_idx" ON "public"."ins_linea_accion_has_etiqueta" USING btree ("etiqueta_id");

CREATE INDEX "fk_ins_linea_accion_has_etiqueta2_idx" ON "public"."ins_linea_accion_has_etiqueta" USING btree ("ins_linea_accion_id");

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."ins_linea_accion_has_etiqueta" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE TABLE "public"."grupo_subgrupo_objeto_gasto" (
    "nombre" text,
    "descripcion" text,
    "abrev" text,
    "es_imputable" text,
    "numero_fila" integer,
    "anho" integer,
    "borrado" boolean,
    "version" integer,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    "grupo" double precision,
    "subgrupo" double precision,
    "id" integer
) WITH (oids = true);


CREATE TABLE "public"."asignacion_presi" (
    "fila" integer,
    "nivel" integer DEFAULT 0 NOT NULL,
    "entidad" integer DEFAULT 0 NOT NULL,
    "tipo" integer DEFAULT 0 NOT NULL,
    "programa" integer DEFAULT 0 NOT NULL,
    "subprograma" integer DEFAULT 0 NOT NULL,
    "proyecto" integer DEFAULT 0 NOT NULL,
    "objeto_gasto" integer DEFAULT 0 NOT NULL,
    "fuente_financiamiento" integer DEFAULT 0 NOT NULL,
    "organismo_financiador" integer DEFAULT 0 NOT NULL,
    "pais" integer DEFAULT 0 NOT NULL,
    "departamento" integer DEFAULT 0 NOT NULL,
    "producto" integer DEFAULT 0 NOT NULL,
    "observacion" text,
    "planificado1" double precision,
    "ejecutado1" double precision,
    "planificado2" double precision,
    "ejecutado2" double precision,
    "planificado3" double precision,
    "ejecutado3" double precision,
    "planificado4" double precision,
    "ejecutado4" double precision,
    "planificado5" double precision,
    "ejecutado5" double precision,
    "planificado6" double precision,
    "ejecutado6" double precision,
    "planificado7" double precision,
    "ejecutado7" double precision,
    "planificado8" double precision,
    "ejecutado8" double precision,
    "planificado9" double precision,
    "ejecutado9" double precision,
    "planificado10" double precision,
    "ejecutado10" double precision,
    "planificado11" double precision,
    "ejecutado11" double precision,
    "planificado12" double precision,
    "ejecutado12" double precision,
    "anho" integer DEFAULT 0 NOT NULL,
    "version" integer DEFAULT 0 NOT NULL,
    "borrado" boolean DEFAULT false,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT 
) WITH (oids = true);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."asignacion_presi" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE usuario_etiqueta_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."usuario_etiqueta" (
    "id" integer DEFAULT nextval('usuario_etiqueta_id_seq') NOT NULL,
    "usuario_correo" text NOT NULL,
    "etiqueta_id" integer NOT NULL,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    "borrado" boolean DEFAULT false,
    CONSTRAINT "usuario_etiqueta_pk" PRIMARY KEY ("id"),
    CONSTRAINT "usuario_etiquetas_unica" UNIQUE ("usuario_correo", "etiqueta_id")
) WITH (oids = true);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."usuario_etiqueta" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE TABLE "public"."poblacion_con_localizacion_y_situacion_de_pobreza_090816_actual" (
    "depto_cod" text,
    "depto_desc" text,
    "dist_cod" text,
    "barloc_cod" text,
    "dist_desc" text,
    "barloc_desc_localidad" text,
    "area" text,
    "manzana" text,
    "direccion" text,
    "nro_casa" text,
    "coordenada_x" text,
    "coordenada_y" text,
    "n_persona" text,
    "nombre" text,
    "apellido" text,
    "edad" text,
    "sexo" text,
    "parentesco" text,
    "jefe" text,
    "dia" text,
    "mes" text,
    "ano" text,
    "nro_cedula" text,
    "telefono" text,
    "estado_de_pobreza" text,
    "ano_apliacion_ficha" text,
    "the_geom" double precision,
    "cartodb_id" integer,
    "created_at" timestamptz DEFAULT now() NOT NULL,
    "updated_at" timestamptz DEFAULT now() NOT NULL,
    "the_geom_webmercator" double precision
) WITH (oids = false);


CREATE SEQUENCE ci_destinatarios_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."ci_destinatarios" (
    "id" integer DEFAULT nextval('ci_destinatarios_id_seq') NOT NULL,
    "avance_id" integer,
    "ci" text,
    "nombre" text,
    "apellido" text,
    "sexo" text,
    "estado_civil" text,
    "nacionalidad" text,
    "profesion" text,
    "fecha_nacimiento" text,
    "anho" integer,
    "version" integer,
    "borrado" boolean,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT 
) WITH (oids = true);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."ci_destinatarios" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE tareas_estados_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."tareas_estados" (
    "id" integer DEFAULT nextval('tareas_estados_id_seq') NOT NULL,
    "nombre" text,
    "decripcion" text,
    "fecha_insercion" timestamp DEFAULT now(),
    "fecha_actualizacion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "tareas_estados_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."tareas_estados" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE SEQUENCE tipos_relaciones_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."tipos_relaciones" (
    "id" integer DEFAULT nextval('tipos_relaciones_id_seq') NOT NULL,
    "nombre" text,
    "usuario_responsable" text DEFAULT ,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    CONSTRAINT "tipos_relaciones_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."tipos_relaciones" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE TABLE "public"."tareas" (
    "id" integer NOT NULL,
    "asunto" text,
    "descripcion" text,
    "fecha_inicio" timestamp DEFAULT now(),
    "fecha_fin" timestamp DEFAULT now(),
    "tareas_padre_id" integer,
    "dias" integer,
    "porcentaje_avance" integer,
    "justificacion" text,
    "tareas_estados_id" integer NOT NULL,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "tareas_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "fk_tareas_tareas" FOREIGN KEY (tareas_padre_id) REFERENCES tareas(id) NOT DEFERRABLE,
    CONSTRAINT "fk_tareas_tareas_estados1" FOREIGN KEY (tareas_estados_id) REFERENCES tareas_estados(id) NOT DEFERRABLE
) WITH (oids = false);

CREATE INDEX "fk_tareas_tareas1_idx" ON "public"."tareas" USING btree ("tareas_padre_id");

CREATE INDEX "fk_tareas_tareas_estados1_idx" ON "public"."tareas" USING btree ("tareas_estados_id");

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."tareas" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE TABLE "public"."tareas_has_institucion" (
    "tareas_id" integer NOT NULL,
    "institucion_id" integer NOT NULL,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "tareas_has_institucion_pkey" PRIMARY KEY ("tareas_id", "institucion_id"),
    CONSTRAINT "fk_tareas_has_institucion_institucion1" FOREIGN KEY (institucion_id) REFERENCES institucion(id) NOT DEFERRABLE,
    CONSTRAINT "fk_tareas_has_institucion_tareas1" FOREIGN KEY (tareas_id) REFERENCES tareas(id) NOT DEFERRABLE
) WITH (oids = false);

CREATE INDEX "fk_tareas_has_institucion_institucion1_idx" ON "public"."tareas_has_institucion" USING btree ("institucion_id");

CREATE INDEX "fk_tareas_has_institucion_tareas1_id" ON "public"."tareas_has_institucion" USING btree ("tareas_id");

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."tareas_has_institucion" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE TABLE "public"."tareas_has_tareas" (
    "tareas_id" integer NOT NULL,
    "tareas_id1" integer NOT NULL,
    "tipores_relaciones_id" integer NOT NULL,
    "usuario_responsable" text DEFAULT ,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    CONSTRAINT "tareas_has_tareas_pkey" PRIMARY KEY ("tareas_id", "tareas_id1"),
    CONSTRAINT "fk_tareas_has_tareas_tareas1" FOREIGN KEY (tareas_id) REFERENCES tareas(id) NOT DEFERRABLE,
    CONSTRAINT "fk_tareas_has_tareas_tareas2" FOREIGN KEY (tareas_id1) REFERENCES tareas(id) NOT DEFERRABLE,
    CONSTRAINT "fk_tareas_has_tareas_tipores_relaciones1" FOREIGN KEY (tipores_relaciones_id) REFERENCES tipos_relaciones(id) NOT DEFERRABLE
) WITH (oids = false);

CREATE INDEX "fk_tareas_has_tareas_tareas1_idx" ON "public"."tareas_has_tareas" USING btree ("tareas_id");

CREATE INDEX "fk_tareas_has_tareas_tareas2_idx" ON "public"."tareas_has_tareas" USING btree ("tareas_id1");

CREATE INDEX "fk_tareas_has_tareas_tipores_relaciones1_id" ON "public"."tareas_has_tareas" USING btree ("tipores_relaciones_id");

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."tareas_has_tareas" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE TABLE "public"."tareas_has_usuario" (
    "tareas_id" integer NOT NULL,
    "usuario_correo" text NOT NULL,
    "fecha_insercion" timestamp DEFAULT now(),
    "fecha_actualizacion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    CONSTRAINT "tareas_has_usuario_pkey" PRIMARY KEY ("tareas_id", "usuario_correo"),
    CONSTRAINT "fk_tareas_has_usuario_tareas1" FOREIGN KEY (tareas_id) REFERENCES tareas(id) NOT DEFERRABLE,
    CONSTRAINT "fk_tareas_has_usuario_usuario1" FOREIGN KEY (usuario_correo) REFERENCES usuario(correo) NOT DEFERRABLE
) WITH (oids = false);

CREATE TRIGGER "auditoria" BEFORE INSERT OR UPDATE ON "public"."tareas_has_usuario" FOR EACH ROW EXECUTE PROCEDURE auditoria();


CREATE TABLE "actividad_avance_cantidad_mes" ("id" integer, "cant_avance" double precision, "mes" text);


CREATE TABLE "actividad_cantidad_hoy_mes" ("id" integer, "cant_prog" double precision, "mes" text);


CREATE TABLE "accion_accion_catalogo_unidad_medida" ("accion_id" integer, "accion" text, "accion_unidad_medida" text);


CREATE SEQUENCE pnd_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."pnd" (
    "id" integer DEFAULT nextval('pnd_id_seq') NOT NULL,
    "nombre" text,
    "abrev" text,
    CONSTRAINT "pk_pnd" PRIMARY KEY ("id")
) WITH (oids = true);


CREATE SEQUENCE ods_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."ods" (
    "id" integer DEFAULT nextval('ods_id_seq') NOT NULL,
    "nombre" text,
    "abrev" text,
    CONSTRAINT "pk_ods" PRIMARY KEY ("id")
) WITH (oids = true);


CREATE TABLE "public"."accion_catalogo_has_pnd" (
    "accion_catalogo_id" integer NOT NULL,
    "pnd_id" integer NOT NULL,
    "peso" double precision,
    CONSTRAINT "pk_accion_catalogo_has_pnd" PRIMARY KEY ("accion_catalogo_id", "pnd_id"),
    CONSTRAINT "fk_accion_catalogo_has_pnd1" FOREIGN KEY (accion_catalogo_id) REFERENCES accion_catalogo(id) NOT DEFERRABLE,
    CONSTRAINT "fk_accion_catalogo_has_pnd2" FOREIGN KEY (pnd_id) REFERENCES pnd(id) NOT DEFERRABLE
) WITH (oids = true);


CREATE TABLE "public"."accion_catalogo_has_ods" (
    "accion_catalogo_id" integer NOT NULL,
    "ods_id" integer NOT NULL,
    "peso" double precision,
    CONSTRAINT "pk_accion_catalogo_has_ods" PRIMARY KEY ("accion_catalogo_id", "ods_id"),
    CONSTRAINT "fk_accion_catalogo_has_ods1" FOREIGN KEY (accion_catalogo_id) REFERENCES accion_catalogo(id) NOT DEFERRABLE,
    CONSTRAINT "fk_accion_catalogo_has_ods2" FOREIGN KEY (ods_id) REFERENCES ods(id) NOT DEFERRABLE
) WITH (oids = true);


CREATE SEQUENCE areas_aga_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."areas_aga" (
    "id" integer DEFAULT nextval('areas_aga_id_seq') NOT NULL,
    "nombre" text NOT NULL,
    CONSTRAINT "areas_aga_id" PRIMARY KEY ("id")
) WITH (oids = false);


CREATE TABLE "public"."la_has_ods" (
    "linea_accion_id" integer NOT NULL,
    "ods_id" integer NOT NULL,
    "peso" double precision,
    CONSTRAINT "pk_la_has_ods" PRIMARY KEY ("linea_accion_id", "ods_id"),
    CONSTRAINT "fk_la_has_ods1" FOREIGN KEY (linea_accion_id) REFERENCES linea_accion(id) NOT DEFERRABLE,
    CONSTRAINT "fk_la_has_ods2" FOREIGN KEY (ods_id) REFERENCES ods(id) NOT DEFERRABLE
) WITH (oids = true);


CREATE TABLE "public"."la_has_areas_aga" (
    "linea_accion_id" integer NOT NULL,
    "areas_aga_id" integer NOT NULL,
    "peso" double precision DEFAULT 0,
    CONSTRAINT "pk_areas_aga_id" PRIMARY KEY ("linea_accion_id", "areas_aga_id"),
    CONSTRAINT "fk_areas_aga_id1" FOREIGN KEY (linea_accion_id) REFERENCES linea_accion(id) NOT DEFERRABLE,
    CONSTRAINT "fk_areas_aga_id2" FOREIGN KEY (areas_aga_id) REFERENCES areas_aga(id) NOT DEFERRABLE
) WITH (oids = true);


CREATE TABLE "public"."la_has_pnd" (
    "linea_accion_id" integer NOT NULL,
    "pnd_id" integer NOT NULL,
    "peso" double precision,
    CONSTRAINT "pk_la_has_pnd" PRIMARY KEY ("linea_accion_id", "pnd_id"),
    CONSTRAINT "fk_la_has_pnd1" FOREIGN KEY (linea_accion_id) REFERENCES linea_accion(id) NOT DEFERRABLE,
    CONSTRAINT "fk_la_has_pnd2" FOREIGN KEY (pnd_id) REFERENCES pnd(id) NOT DEFERRABLE
) WITH (oids = true);


CREATE SEQUENCE usuario_spr_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."usuario_spr" (
    "id" integer DEFAULT nextval('usuario_spr_id_seq') NOT NULL,
    "correo" text,
    "passwd" text,
    "last_login" timestamp,
    "entidad" text,
    "role_id" integer DEFAULT 4 NOT NULL,
    "entidad_id" integer,
    "nivel_id" integer,
    "nombre" text,
    "urlimagen" text,
    "unr_id" integer DEFAULT 0 NOT NULL,
    "borrado" text,
    "url" text,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT ,
    "role_id_movil" integer DEFAULT 4 NOT NULL,
    "role_id_tablero" integer DEFAULT 4 NOT NULL,
    "role_identificaciones" integer DEFAULT 4 NOT NULL,
    "email_real" text
) WITH (oids = true);


CREATE SEQUENCE entidad_spr_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."entidad_spr" (
    "id" integer DEFAULT nextval('entidad_spr_id_seq') NOT NULL,
    "nombre" text,
    "descripcion" text,
    "anho" integer,
    "nivel_id" integer NOT NULL,
    "abrev" character varying(45),
    "sigla" character varying(45),
    "base_legal" text,
    "mision" text,
    "vision" text,
    "politica" text,
    "objetivo" text,
    "diagnostico" text,
    "fecha_creacion" timestamp,
    "version" integer,
    "numero_fila" integer,
    "ruc" text,
    "borrado" text,
    "fecha_actualizacion" timestamp DEFAULT now(),
    "fecha_insercion" timestamp DEFAULT now(),
    "usuario_responsable" text DEFAULT 
) WITH (oids = true);


CREATE TABLE "public"."usuario_tablero" (
    "correo" text NOT NULL,
    "nivel" integer NOT NULL,
    "entidad" integer NOT NULL,
    "uni_responsable" integer NOT NULL
) WITH (oids = false);


CREATE TABLE "ins_linea_accion_destinatarios_corregido" ("ila_id" integer, "cant_dest" bigint);


CREATE TABLE "linea_accion_presupuesto" ("ins_id" integer, "sigla" text, "ins_ver" integer, "ins_borr" boolean, "la_id" integer, "la_nombre" text, "la_tipo_id" integer, "la_estrategia_id" integer, "la_um_id" integer, "la_um_descp" text, "la_ver" integer, "la_borr" boolean, "ila_id" integer, "periodo" integer, "ila_meta" double precision, "ila_ver" integer, "ila_borr" boolean, "accion_id" integer, "accion_peso" double precision, "accion_fecha_ini" date, "accion_fecha_fin" date, "accion_ver" integer, "accion_bor" boolean, "m1" double precision, "m2" double precision, "m3" double precision, "m4" double precision, "depto_id" integer, "depto_nombre" character varying(50), "dist_id" integer, "dist_nombre" character varying(50), "id_accion_catalogo" integer, "ac_nombre" text, "ac_um_id" integer, "ac_um_descp" text, "ac_ver" integer, "ac_borr" boolean, "proporcion" integer, "version" integer, "borrado" boolean, "spr_nivel_id" integer, "spr_entidad_id" integer, "spr_tiprograma_id" integer, "spr_programa_id" integer, "spr_subprograma_id" integer, "srp_proyecto_id" integer, "spr_producto_id" integer, "u_medida" text, "cant_fisica" double precision, "clase" text, "prod_asig_financiera" double precision, "accion_costo" double precision, "spr_anho" integer, "spr_version" integer, "producto_concat" text, "prod_id" integer, "prod_nombre" text, "prod_desc" text, "prod_clase" text, "prod_um_id" integer);


CREATE TABLE "linea_accion_destinatarios" ("ins_id" integer, "sigla" text, "ins_ver" integer, "ins_borr" boolean, "la_id" integer, "la_nombre" text, "la_tipo_id" integer, "la_estrategia_id" integer, "la_um_id" integer, "la_um_descp" text, "la_ver" integer, "la_borr" boolean, "ila_id" integer, "periodo" integer, "ila_meta" double precision, "ila_ver" integer, "ila_borr" boolean, "accion_id" integer, "accion_peso" double precision, "accion_fecha_ini" date, "accion_fecha_fin" date, "accion_ver" integer, "accion_bor" boolean, "m1" double precision, "m2" double precision, "m3" double precision, "m4" double precision, "depto_id" integer, "depto_nombre" character varying(50), "dist_id" integer, "dist_nombre" character varying(50), "id_accion_catalogo" integer, "ac_nombre" text, "ac_um_id" integer, "ac_um_descp" text, "ac_ver" integer, "ac_borr" boolean, "tipo_dest_nombre" text, "grupo_dest_nombre" text, "cant_dest" integer, "dest_ver" integer, "dest_borr" boolean, "desc_dest" text, "hito_tipo_id" integer, "nombre_hito_tipo" text, "tipo_dest_id" integer, "grupo_dest_id" integer);


CREATE TABLE "costos" ("ins_id" integer, "sigla" text, "ins_ver" integer, "ins_borr" boolean, "la_id" integer, "la_nombre" text, "la_est_id" integer, "la_tipo_id" integer, "la_um_id" integer, "la_um_descp" text, "la_ver" integer, "la_borr" boolean, "ila_id" integer, "periodo" integer, "ila_meta" double precision, "ila_ver" integer, "ila_borr" boolean, "accion_id" integer, "accion_peso" double precision, "ac_id" integer, "ac_nombre" text, "ac_um_id" integer, "ac_um_descp" text, "accion_fecha_ini" date, "accion_fecha_fin" date, "depto_id" integer, "depto_nombre" character varying(50), "dist_id" integer, "dist_nombre" character varying(50), "m1" double precision, "m2" double precision, "m3" double precision, "m4" double precision, "ac_ver" integer, "ac_borr" boolean, "accion_ver" integer, "accion_bor" boolean, "crono_id" integer, "crono_nombre" text, "crono_descp" text, "crono_prop" double precision, "crono_peso" double precision, "crono_ver" integer, "crono_borr" boolean, "crono_um_id" integer, "crono_um_descp" text, "crono_tipo_id" integer, "crono_tipo_nombre" text, "acumula" boolean, "avance_id" integer, "avance_fecha" date, "avance_cant" double precision, "avance_just" text, "avance_borr" boolean, "av_costo_id" integer, "av_costo_monto" double precision, "av_costo_cc" text, "av_costo_og" integer, "av_ver" integer, "av_borr" boolean, "av_prod_concat" text);


CREATE TABLE "destinatarios" ("ins_id" integer, "sigla" text, "ins_ver" integer, "ins_borr" boolean, "la_id" integer, "la_nombre" text, "la_est_id" integer, "la_tipo_id" integer, "la_um_id" integer, "la_um_descp" text, "la_ver" integer, "la_borr" boolean, "ila_id" integer, "periodo" integer, "ila_meta" double precision, "ila_ver" integer, "ila_borr" boolean, "accion_id" integer, "accion_peso" double precision, "ac_id" integer, "ac_nombre" text, "ac_um_id" integer, "ac_um_descp" text, "accion_fecha_ini" date, "accion_fecha_fin" date, "depto_id" integer, "depto_nombre" character varying(50), "dist_id" integer, "dist_nombre" character varying(50), "m1" double precision, "m2" double precision, "m3" double precision, "m4" double precision, "ac_ver" integer, "ac_borr" boolean, "accion_ver" integer, "accion_bor" boolean, "crono_id" integer, "crono_nombre" text, "crono_descp" text, "crono_prop" double precision, "crono_peso" double precision, "crono_ver" integer, "crono_borr" boolean, "crono_um_id" integer, "crono_um_descp" text, "crono_tipo_id" integer, "crono_tipo_nombre" text, "acumula" boolean, "avance_id" integer, "avance_fecha" date, "avance_cant" double precision, "avance_just" text, "avance_borr" boolean, "tipo_dest" text, "grupo_dest" text, "dest_id" integer, "dest_cant" integer, "dest_desc" text);


CREATE TABLE "evidencias" ("ins_id" integer, "sigla" text, "ins_ver" integer, "ins_borr" boolean, "la_id" integer, "la_nombre" text, "la_est_id" integer, "la_tipo_id" integer, "la_um_id" integer, "la_um_descp" text, "la_ver" integer, "la_borr" boolean, "ila_id" integer, "periodo" integer, "ila_meta" double precision, "ila_ver" integer, "ila_borr" boolean, "accion_id" integer, "accion_peso" double precision, "ac_id" integer, "ac_nombre" text, "ac_um_id" integer, "ac_um_descp" text, "accion_fecha_ini" date, "accion_fecha_fin" date, "depto_id" integer, "depto_nombre" character varying(50), "dist_id" integer, "dist_nombre" character varying(50), "m1" double precision, "m2" double precision, "m3" double precision, "m4" double precision, "ac_ver" integer, "ac_borr" boolean, "accion_ver" integer, "accion_bor" boolean, "crono_id" integer, "crono_nombre" text, "crono_descp" text, "crono_prop" double precision, "crono_peso" double precision, "crono_ver" integer, "crono_borr" boolean, "crono_um_id" integer, "crono_um_descp" text, "crono_tipo_id" integer, "crono_tipo_nombre" text, "acumula" boolean, "avance_id" integer, "avance_fecha" date, "avance_cant" double precision, "avance_just" text, "avance_borr" boolean, "evid_id" integer, "evid_nom" text, "evid_desc" text, "evid_url" text, "evid_doc" text, "evid_borr" boolean);


CREATE TABLE "hitos_avances" ("accion_id" integer, "accion_catalogo_nombre" text, "accion_departamento_id" integer, "accion_distrito_id" integer, "accion_departamento" character varying(50), "accion_distrito" character varying(50), "accion_costo" double precision, "institucion_id" integer, "institucion" text, "ila_meta" double precision, "actividad_cantidad_programada" double precision, "hito_porcentaje_programado" double precision, "hito_porcentaje_ejecutado" double precision, "hito_fecha_entrega" date, "hito_cantidad_programado" double precision, "cantidad_programado" double precision, "cantidad_ejecutado" double precision, "accion_unidad_medida" text);


CREATE TABLE "ins_linea_accion_avance" ("ins_linea_accion_id" integer, "cantidad" double precision);


CREATE TABLE "ins_linea_accion_avance_dd" ("ins_linea_accion_id" integer, "depto_id" integer, "dist_id" integer, "cantidad" double precision);


CREATE TABLE "ins_linea_accion_programacion_anho" ("ins_linea_accion_id" integer, "cantidad_anho" double precision);


CREATE TABLE "ins_linea_accion_programacion_anho_dd" ("ins_linea_accion_id" integer, "depto_id" integer, "dist_id" integer, "cantidad_anho" double precision);


CREATE TABLE "ins_linea_accion_programacion_hoy" ("ins_linea_accion_id" integer, "cantidad_hoy" double precision);


CREATE TABLE "ins_linea_accion_programacion_hoy_dd" ("ins_linea_accion_id" integer, "depto_id" integer, "dist_id" integer, "cantidad_hoy" double precision);


CREATE TABLE "linea_accion_acciones" ("linea_accion_id" integer, "linea_accion_nombre" text, "accion_id" integer, "accion_catalogo_nombre" text, "accion_departamento_id" integer, "accion_distrito_id" integer, "accion_depto_nombre" character varying(50), "accion_dist_nombre" character varying(50), "accion_fecha_inicio" date, "accion_fecha_fin" date, "institucion_id" integer, "institucion" text, "cantidad_programado" double precision, "cantidad_ejecutado" double precision, "accion_unidad_medida" text, "periodo_id" integer);


CREATE TABLE "linea_accion_acumulado_mes" ("linea_accion_id" integer, "linea_accion" text, "institucion_id" integer, "institucion" text, "accion_unidad_medida" text, "mes" text, "actividad_acumulable" boolean, "cantidad_programada" double precision, "cantidad_ejecutada" double precision);


CREATE TABLE "linea_accion_acumulado_mes_depto" ("linea_accion_id" integer, "linea_accion" text, "institucion_id" integer, "institucion" text, "accion_unidad_medida" text, "mes" text, "actividad_acumulable" boolean, "cantidad_programada" double precision, "cantidad_ejecutada" double precision, "accion_departamento_id" integer, "accion_depto_nombre" character varying(50));


CREATE TABLE "linea_accion_acumulado_mes_distrito" ("linea_accion_id" integer, "linea_accion" text, "institucion_id" integer, "institucion" text, "accion_unidad_medida" text, "mes" text, "actividad_acumulable" boolean, "cantidad_programada" double precision, "cantidad_ejecutada" double precision, "accion_departamento_id" integer, "accion_distrito_id" integer, "accion_depto_nombre" character varying(50), "accion_dist_nombre" character varying(50));


CREATE TABLE "linea_accion_destinatarios1" ("ins_id" integer, "sigla" text, "ins_ver" integer, "ins_borr" boolean, "la_id" integer, "la_nombre" text, "la_tipo_id" integer, "la_estrategia_id" integer, "la_um_id" integer, "la_um_descp" text, "la_ver" integer, "la_borr" boolean, "ila_id" integer, "periodo" integer, "ila_meta" double precision, "ila_ver" integer, "ila_borr" boolean, "accion_id" integer, "accion_peso" double precision, "accion_fecha_ini" date, "accion_fecha_fin" date, "accion_ver" integer, "accion_bor" boolean, "m1" double precision, "m2" double precision, "m3" double precision, "m4" double precision, "depto_id" integer, "depto_nombre" character varying(50), "dist_id" integer, "dist_nombre" character varying(50), "id_accion_catalogo" integer, "ac_nombre" text, "ac_um_id" integer, "ac_um_descp" text, "ac_ver" integer, "ac_borr" boolean, "tipo_dest_nombre" text, "grupo_dest_nombre" text, "cant_dest" integer, "dest_ver" integer, "dest_borr" boolean, "desc_dest" text, "hito_tipo_id" integer, "nombre_hito_tipo" text, "tipo_dest_id" integer, "grupo_dest_id" integer);


CREATE TABLE "linea_accion_destinatarios_1" ("ins_id" integer, "sigla" text, "ins_ver" integer, "ins_borr" boolean, "la_id" integer, "la_nombre" text, "la_tipo_id" integer, "la_estrategia_id" integer, "la_um_id" integer, "la_um_descp" text, "la_ver" integer, "la_borr" boolean, "ila_id" integer, "periodo" integer, "ila_meta" double precision, "ila_ver" integer, "ila_borr" boolean, "accion_id" integer, "accion_peso" double precision, "accion_fecha_ini" date, "accion_fecha_fin" date, "accion_ver" integer, "accion_bor" boolean, "m1" double precision, "m2" double precision, "m3" double precision, "m4" double precision, "depto_id" integer, "depto_nombre" character varying(50), "dist_id" integer, "dist_nombre" character varying(50), "id_accion_catalogo" integer, "ac_nombre" text, "ac_um_id" integer, "ac_um_descp" text, "ac_ver" integer, "ac_borr" boolean, "tipo_dest_nombre" text, "grupo_dest_nombre" text, "cant_dest" integer, "dest_ver" integer, "dest_borr" boolean, "desc_dest" text, "tipo_dest_id" integer, "grupo_dest_id" integer);


CREATE TABLE "linea_accion_presupuesto_old" ("ins_id" integer, "sigla" text, "ins_ver" integer, "ins_borr" boolean, "la_id" integer, "la_nombre" text, "la_tipo_id" integer, "la_estrategia_id" integer, "la_um_id" integer, "la_um_descp" text, "la_ver" integer, "la_borr" boolean, "ila_id" integer, "periodo" integer, "ila_meta" double precision, "ila_ver" integer, "ila_borr" boolean, "accion_id" integer, "accion_peso" double precision, "accion_fecha_ini" date, "accion_fecha_fin" date, "accion_ver" integer, "accion_bor" boolean, "m1" double precision, "m2" double precision, "m3" double precision, "m4" double precision, "depto_id" integer, "depto_nombre" character varying(50), "dist_id" integer, "dist_nombre" character varying(50), "id_accion_catalogo" integer, "ac_nombre" text, "ac_um_id" integer, "ac_um_descp" text, "ac_ver" integer, "ac_borr" boolean, "proporcion" integer, "version" integer, "borrado" boolean, "spr_nivel_id" integer, "spr_entidad_id" integer, "spr_tiprograma_id" integer, "spr_programa_id" integer, "spr_subprograma_id" integer, "srp_proyecto_id" integer, "spr_producto_id" integer, "u_medida" text, "cant_fisica" double precision, "clase" text, "prod_asig_financiera" double precision, "accion_costo" double precision, "spr_anho" integer, "spr_version" integer, "producto_concat" text);


CREATE TABLE "linea_accion_programado2" ("ins_id" integer, "institucion" text, "ins_orden" integer, "ins_ver" integer, "ins_borr" boolean, "la_id" integer, "la_orden" integer, "la_nombre" text, "la_tipo_id" integer, "la_estrategia_id" integer, "la_um_id" integer, "la_um_descp" text, "la_ver" integer, "la_borr" boolean, "ila_id" integer, "periodo" integer, "ila_meta" double precision, "ila_ver" integer, "ila_borr" boolean, "accion_id" integer, "accion_peso" double precision, "accion_fecha_ini" date, "accion_fecha_fin" date, "accion_ver" integer, "accion_bor" boolean, "m1" double precision, "m2" double precision, "m3" double precision, "m4" double precision, "depto_id" integer, "depto_nombre" character varying(50), "dist_id" integer, "dist_nombre" character varying(50), "id_accion_catalogo" integer, "ac_nombre" text, "ac_um_id" integer, "ac_um_descp" text, "ac_ver" integer, "ac_borr" boolean, "crono_id" integer, "crono_nombre" text, "crono_descp" text, "crono_prop" double precision, "crono_peso" double precision, "crono_ver" integer, "crono_borr" boolean, "crono_um_id" integer, "crono_tipo_id" integer, "crono_tipo_nombre" text, "cant_prog" double precision, "fecha_entrega" date, "prog_ver" integer, "prog_borr" boolean, "crono_um_descp" text, "acumula" boolean, "prog_id" integer);


CREATE TABLE "linea_accion_programado_old" ("ins_id" integer, "sigla" text, "ins_ver" integer, "ins_borr" boolean, "la_id" integer, "la_nombre" text, "la_tipo_id" integer, "la_estrategia_id" integer, "la_um_id" integer, "la_um_descp" text, "la_ver" integer, "la_borr" boolean, "ila_id" integer, "periodo" integer, "ila_meta" double precision, "ila_ver" integer, "ila_borr" boolean, "accion_id" integer, "accion_peso" double precision, "accion_fecha_ini" date, "accion_fecha_fin" date, "accion_ver" integer, "accion_bor" boolean, "m1" double precision, "m2" double precision, "m3" double precision, "m4" double precision, "depto_id" integer, "depto_nombre" character varying(50), "dist_id" integer, "dist_nombre" character varying(50), "id_accion_catalogo" integer, "ac_nombre" text, "ac_um_id" integer, "ac_um_descp" text, "ac_ver" integer, "ac_borr" boolean, "crono_id" integer, "crono_nombre" text, "crono_descp" text, "crono_prop" double precision, "crono_peso" double precision, "crono_ver" integer, "crono_borr" boolean, "crono_um_id" integer, "crono_tipo_id" integer, "crono_tipo_nombre" text, "cant_prog" double precision, "fecha_entrega" date, "prog_ver" integer, "prog_borr" boolean, "crono_um_nombre" text);


CREATE TABLE "plan_accion_avances" ("institucion" text, "la_id" integer, "linea_accion" text, "la_unidad" text, "anho" integer, "la_meta" double precision, "a_id" integer, "accion" text, "a_peso" double precision, "a_unidad" text, "depto_id" integer, "departamento" character varying(50), "dist_id" integer, "distrito" character varying(50), "crono_id" integer, "cronograma" text, "crono_descripcion" text, "contribucion" double precision, "influencia" double precision, "crono_unidad" text, "crono_tipo" text, "crono_acumula" boolean, "fecha" date, "mes" text, "programacion_cantidad" text, "avance_cantidad" text, "justificacion" text, "avance_costo" text, "avance_destinatarios" text, "avance_evidencias" text, "distrito_avance" character varying, "departamento_avance" character varying);


CREATE TABLE "plan_accion_scs" ("institucion" text, "la_id" integer, "linea_accion" text, "la_unidad" text, "anho" integer, "la_meta" double precision, "a_id" integer, "accion" text, "a_peso" double precision, "a_unidad" text, "depto_id" integer, "departamento" character varying(50), "dist_id" integer, "distrito" character varying(50), "crono_id" integer, "cronograma" text, "crono_descripcion" text, "contribucion" double precision, "influencia" double precision, "crono_unidad" text, "crono_tipo" text, "crono_acumula" boolean, "fecha" date, "prog_id" integer, "av_id" integer, "mes" text, "programacion_cantidad" numeric, "avance_cantidad" numeric, "justificacion" text, "avance_costo" numeric, "avance_destinatarios" numeric, "avance_evidencias" numeric);


CREATE TABLE "resumen_linea_accion" ("ins_id" integer, "sigla" text, "la_id" integer, "la_nombre" text, "la_tipo_id" integer, "la_estrategia_id" integer, "la_um_id" integer, "la_um_descp" text, "ila_id" integer, "periodo" integer, "ila_meta" double precision, "meta_accion" double precision, "cant_prog" double precision, "ins_orden" integer, "la_orden" integer, "cant_dest" bigint, "costo_ac" double precision);


CREATE TABLE "v_linea_accion_avance" ("ins_id" integer, "ins_sigla" text, "ins_ver" integer, "ins_borr" boolean, "ila_id" integer, "periodo" integer, "ila_meta" double precision, "ila_ver" integer, "ila_bor" boolean, "accion_id" integer, "accion_costo" double precision, "accion_peso" double precision, "accion_fecha_ini" date, "accion_fecha_fin" date, "accion_ver" integer, "accion_bor" boolean, "m1" double precision, "m2" double precision, "m3" double precision, "m4" double precision, "depto_id" integer, "dist_id" integer, "crono_id" integer, "crono_nombre" text, "crono_descp" text, "crono_prop" double precision, "crono_peso" double precision, "crono_ver" integer, "crono_borr" boolean, "crono_um_id" integer, "crono_tipo_id" integer, "crono_tipo_nombre" text, "crono_tipo_descripcion" text, "crono_tipo_version" integer, "crono_tipo_borrado" boolean, "avance_justificacion" text, "avance_cantidad" double precision, "avance_fecha_entrega" date, "avance_cantidad_beneficiarios" integer, "avance_version" integer, "avance_borrado" boolean, "avance_costo_id" integer, "avance_costo_monto" double precision, "avance_costo_codigo_contratacional" text, "avance_costo_objeto_gasto" integer, "avance_costo_version" integer, "avance_costo_borrado" boolean);


CREATE TABLE "avances" ("ins_id" integer, "sigla" text, "ins_ver" integer, "ins_borr" boolean, "la_id" integer, "la_nombre" text, "la_est_id" integer, "la_tipo_id" integer, "la_um_id" integer, "la_um_descp" text, "la_ver" integer, "la_borr" boolean, "ila_id" integer, "periodo" integer, "ila_meta" double precision, "ila_ver" integer, "ila_borr" boolean, "accion_id" integer, "accion_peso" double precision, "ac_id" integer, "ac_nombre" text, "ac_um_id" integer, "ac_um_descp" text, "accion_fecha_ini" date, "accion_fecha_fin" date, "depto_id" integer, "depto_nombre" character varying(50), "dist_id" integer, "dist_nombre" character varying(50), "m1" double precision, "m2" double precision, "m3" double precision, "m4" double precision, "ac_ver" integer, "ac_borr" boolean, "accion_ver" integer, "accion_bor" boolean, "crono_id" integer, "crono_nombre" text, "crono_descp" text, "crono_prop" double precision, "crono_peso" double precision, "crono_ver" integer, "crono_borr" boolean, "crono_um_id" integer, "crono_um_descp" text, "crono_tipo_id" integer, "crono_tipo_nombre" text, "acumula" boolean, "avance_id" integer, "avance_fecha" date, "avance_cant" double precision, "avance_just" text, "avance_borr" boolean, "distrito_avance" character varying, "departamento_avance" character varying);


DROP TABLE IF EXISTS "v_objetogastos";
CREATE TABLE "public"."v_objetogastos" (
    "spr_producto_id" integer,
    "srp_proyecto_id" integer,
    "spr_subprograma_id" integer,
    "spr_programa_id" integer,
    "spr_tiprograma_id" integer,
    "spr_entidad_id" integer,
    "spr_nivel_id" integer,
    "objeto_gasto_id" integer,
    "accion_id" integer
) WITH (oids = false);

DROP TABLE IF EXISTS "acciones_cargadas";
CREATE TABLE "public"."acciones_cargadas" (
    "institicion" text,
    "linea_orden" integer,
    "linea_accion" text,
    "meta_linea_accion" double precision,
    "unidad_medida" text,
    "tipo_accion" text,
    "accion" text,
    "depto" character varying(50),
    "dist" character varying(50),
    "accion_fecha_inicio" date,
    "meta1" double precision,
    "meta2" double precision,
    "meta3" double precision,
    "meta4" double precision,
    "accion_fecha_fin" date
) WITH (oids = false);

DROP TABLE IF EXISTS "actividad_cantidad";
CREATE TABLE "public"."actividad_cantidad" (
    "id" integer,
    "cant_prog" double precision
) WITH (oids = false);

DROP TABLE IF EXISTS "producto_objeto_gasto";
CREATE TABLE "public"."producto_objeto_gasto" (
    "id" integer,
    "accion_id" integer,
    "spr_nivel_id" integer,
    "spr_entidad_id" integer,
    "spr_tiprograma_id" integer,
    "spr_programa_id" integer,
    "spr_subprograma_id" integer,
    "srp_proyecto_id" integer,
    "spr_producto_id" integer,
    "producto_concat" text,
    "version" integer,
    "borrado" boolean
) WITH (oids = false);

DROP TABLE IF EXISTS "acciones_repetidas";
CREATE TABLE "public"."acciones_repetidas" (
    "linea_accion_id" integer,
    "la_nomnbre" text,
    "institucion_id" integer,
    "sigla" text,
    "periodo_id" integer,
    "catalogo_id" integer,
    "accion_catalogo_nombre" text,
    "depto_id" integer,
    "dist_id" integer,
    "repetido" bigint
) WITH (oids = false);

DROP TABLE IF EXISTS "apt";
CREATE TABLE "public"."apt" (
    "nivel" integer,
    "entidad" integer,
    "tipo" integer,
    "programa" integer,
    "subprograma" integer,
    "proyecto" integer,
    "producto" integer,
    "observacion" text,
    "anho" integer,
    "version" integer,
    "sum" double precision
) WITH (oids = false);

DROP TABLE IF EXISTS "ins_linea_accion_base";
CREATE TABLE "public"."ins_linea_accion_base" (
    "institucion_id" integer,
    "institucion_orden" integer,
    "institucion_sigla" text,
    "linea_accion_id" integer,
    "la_orden" integer,
    "linea_accion_nombre" text,
    "linea_accion_acu" boolean,
    "linea_tipo" integer,
    "linea_estrategia" integer,
    "linea_um_id" integer,
    "linea_um_nombre" text,
    "ins_linea_accion_id" integer,
    "periodo" integer,
    "meta" double precision
) WITH (oids = false);

DROP TABLE IF EXISTS "actividad_avance_cantidad";
CREATE TABLE "public"."actividad_avance_cantidad" (
    "id" integer,
    "cant_avance" double precision
) WITH (oids = false);

DROP TABLE IF EXISTS "actividad_cantidad_hoy";
CREATE TABLE "public"."actividad_cantidad_hoy" (
    "id" integer,
    "cant_prog" double precision
) WITH (oids = false);

DROP TABLE IF EXISTS "ins_linea_accion_costo";
CREATE TABLE "public"."ins_linea_accion_costo" (
    "ins_linea_accion_id" integer,
    "costo" double precision
) WITH (oids = false);

DROP TABLE IF EXISTS "ins_linea_accion_costo_estimado";
CREATE TABLE "public"."ins_linea_accion_costo_estimado" (
    "ins_linea_accion_id" integer,
    "inversion_estimada" double precision
) WITH (oids = false);

DROP TABLE IF EXISTS "avance_cantidad_beneficiario";
CREATE TABLE "public"."avance_cantidad_beneficiario" (
    "avance_id" integer,
    "cantidad" bigint
) WITH (oids = false);

DROP TABLE IF EXISTS "actividad_avance_destinatarios";
CREATE TABLE "public"."actividad_avance_destinatarios" (
    "id" integer,
    "cantidad_destinatarios" numeric
) WITH (oids = false);

DROP TABLE IF EXISTS "ins_linea_accion_base_dd";
CREATE TABLE "public"."ins_linea_accion_base_dd" (
    "institucion_id" integer,
    "institucion_orden" integer,
    "institucion_sigla" text,
    "linea_accion_id" integer,
    "la_orden" integer,
    "linea_accion_nombre" text,
    "linea_accion_acu" boolean,
    "linea_tipo" integer,
    "linea_estrategia" integer,
    "linea_um_id" integer,
    "linea_um_nombre" text,
    "ins_linea_accion_id" integer,
    "periodo" integer,
    "meta" double precision,
    "depto_id" integer,
    "depto_nombre" character varying(50),
    "dist_id" integer,
    "dist_nombre" character varying(50)
) WITH (oids = false);

DROP TABLE IF EXISTS "ins_linea_accion_costo_dd";
CREATE TABLE "public"."ins_linea_accion_costo_dd" (
    "ins_linea_accion_id" integer,
    "depto_id" integer,
    "dist_id" integer,
    "costo" double precision
) WITH (oids = false);

DROP TABLE IF EXISTS "ins_linea_accion_costo_estimado_dd";
CREATE TABLE "public"."ins_linea_accion_costo_estimado_dd" (
    "ins_linea_accion_id" integer,
    "depto_id" integer,
    "dist_id" integer,
    "inversion_estimada" double precision
) WITH (oids = false);

DROP TABLE IF EXISTS "ins_linea_accion_destinatario_real_dd";
CREATE TABLE "public"."ins_linea_accion_destinatario_real_dd" (
    "ins_linea_accion_id" integer,
    "depto_id" integer,
    "dist_id" integer,
    "beneficiarios_real" numeric
) WITH (oids = false);

DROP TABLE IF EXISTS "ins_linea_accion_destinatarios_dd";
CREATE TABLE "public"."ins_linea_accion_destinatarios_dd" (
    "ila_id" integer,
    "depto_id" integer,
    "dist_id" integer,
    "cant_dest" bigint
) WITH (oids = false);

DROP TABLE IF EXISTS "ins_linea_accion_destinatario_real";
CREATE TABLE "public"."ins_linea_accion_destinatario_real" (
    "ins_linea_accion_id" integer,
    "beneficiarios_real" numeric
) WITH (oids = false);

DROP TABLE IF EXISTS "ins_linea_accion_destinatarios";
CREATE TABLE "public"."ins_linea_accion_destinatarios" (
    "ila_id" integer,
    "cant_dest" bigint
) WITH (oids = false);

DROP TABLE IF EXISTS "ins_lin_acc_ava";
CREATE TABLE "public"."ins_lin_acc_ava" (
    "ins_linea_accion_id" integer,
    "periodo_id" integer,
    "linea_accion_nombre" text,
    "accion_id" integer,
    "accion_catalogo_nombre" text,
    "accion_depto_id" integer,
    "accion_dist_id" integer,
    "institucion_id" integer,
    "institucion_sigla" text,
    "actividad_id" integer,
    "avance_cantidad" double precision,
    "avance_cantidad_beneficiarios" integer,
    "avance_fecha_entrega" date
) WITH (oids = false);

DROP TABLE IF EXISTS "actividad_avance_cantidad_mes";
CREATE TABLE "public"."actividad_avance_cantidad_mes" (
    "id" integer,
    "cant_avance" double precision,
    "mes" text
) WITH (oids = false);

DROP TABLE IF EXISTS "actividad_cantidad_hoy_mes";
CREATE TABLE "public"."actividad_cantidad_hoy_mes" (
    "id" integer,
    "cant_prog" double precision,
    "mes" text
) WITH (oids = false);

DROP TABLE IF EXISTS "accion_accion_catalogo_unidad_medida";
CREATE TABLE "public"."accion_accion_catalogo_unidad_medida" (
    "accion_id" integer,
    "accion" text,
    "accion_unidad_medida" text
) WITH (oids = false);

DROP TABLE IF EXISTS "ins_linea_accion_destinatarios_corregido";
CREATE TABLE "public"."ins_linea_accion_destinatarios_corregido" (
    "ila_id" integer,
    "cant_dest" bigint
) WITH (oids = false);

DROP TABLE IF EXISTS "linea_accion_presupuesto";
CREATE TABLE "public"."linea_accion_presupuesto" (
    "ins_id" integer,
    "sigla" text,
    "ins_ver" integer,
    "ins_borr" boolean,
    "la_id" integer,
    "la_nombre" text,
    "la_tipo_id" integer,
    "la_estrategia_id" integer,
    "la_um_id" integer,
    "la_um_descp" text,
    "la_ver" integer,
    "la_borr" boolean,
    "ila_id" integer,
    "periodo" integer,
    "ila_meta" double precision,
    "ila_ver" integer,
    "ila_borr" boolean,
    "accion_id" integer,
    "accion_peso" double precision,
    "accion_fecha_ini" date,
    "accion_fecha_fin" date,
    "accion_ver" integer,
    "accion_bor" boolean,
    "m1" double precision,
    "m2" double precision,
    "m3" double precision,
    "m4" double precision,
    "depto_id" integer,
    "depto_nombre" character varying(50),
    "dist_id" integer,
    "dist_nombre" character varying(50),
    "id_accion_catalogo" integer,
    "ac_nombre" text,
    "ac_um_id" integer,
    "ac_um_descp" text,
    "ac_ver" integer,
    "ac_borr" boolean,
    "proporcion" integer,
    "version" integer,
    "borrado" boolean,
    "spr_nivel_id" integer,
    "spr_entidad_id" integer,
    "spr_tiprograma_id" integer,
    "spr_programa_id" integer,
    "spr_subprograma_id" integer,
    "srp_proyecto_id" integer,
    "spr_producto_id" integer,
    "u_medida" text,
    "cant_fisica" double precision,
    "clase" text,
    "prod_asig_financiera" double precision,
    "accion_costo" double precision,
    "spr_anho" integer,
    "spr_version" integer,
    "producto_concat" text,
    "prod_id" integer,
    "prod_nombre" text,
    "prod_desc" text,
    "prod_clase" text,
    "prod_um_id" integer
) WITH (oids = false);

DROP TABLE IF EXISTS "linea_accion_destinatarios";
CREATE TABLE "public"."linea_accion_destinatarios" (
    "ins_id" integer,
    "sigla" text,
    "ins_ver" integer,
    "ins_borr" boolean,
    "la_id" integer,
    "la_nombre" text,
    "la_tipo_id" integer,
    "la_estrategia_id" integer,
    "la_um_id" integer,
    "la_um_descp" text,
    "la_ver" integer,
    "la_borr" boolean,
    "ila_id" integer,
    "periodo" integer,
    "ila_meta" double precision,
    "ila_ver" integer,
    "ila_borr" boolean,
    "accion_id" integer,
    "accion_peso" double precision,
    "accion_fecha_ini" date,
    "accion_fecha_fin" date,
    "accion_ver" integer,
    "accion_bor" boolean,
    "m1" double precision,
    "m2" double precision,
    "m3" double precision,
    "m4" double precision,
    "depto_id" integer,
    "depto_nombre" character varying(50),
    "dist_id" integer,
    "dist_nombre" character varying(50),
    "id_accion_catalogo" integer,
    "ac_nombre" text,
    "ac_um_id" integer,
    "ac_um_descp" text,
    "ac_ver" integer,
    "ac_borr" boolean,
    "tipo_dest_nombre" text,
    "grupo_dest_nombre" text,
    "cant_dest" integer,
    "dest_ver" integer,
    "dest_borr" boolean,
    "desc_dest" text,
    "hito_tipo_id" integer,
    "nombre_hito_tipo" text,
    "tipo_dest_id" integer,
    "grupo_dest_id" integer
) WITH (oids = false);

DROP TABLE IF EXISTS "costos";
CREATE TABLE "public"."costos" (
    "ins_id" integer,
    "sigla" text,
    "ins_ver" integer,
    "ins_borr" boolean,
    "la_id" integer,
    "la_nombre" text,
    "la_est_id" integer,
    "la_tipo_id" integer,
    "la_um_id" integer,
    "la_um_descp" text,
    "la_ver" integer,
    "la_borr" boolean,
    "ila_id" integer,
    "periodo" integer,
    "ila_meta" double precision,
    "ila_ver" integer,
    "ila_borr" boolean,
    "accion_id" integer,
    "accion_peso" double precision,
    "ac_id" integer,
    "ac_nombre" text,
    "ac_um_id" integer,
    "ac_um_descp" text,
    "accion_fecha_ini" date,
    "accion_fecha_fin" date,
    "depto_id" integer,
    "depto_nombre" character varying(50),
    "dist_id" integer,
    "dist_nombre" character varying(50),
    "m1" double precision,
    "m2" double precision,
    "m3" double precision,
    "m4" double precision,
    "ac_ver" integer,
    "ac_borr" boolean,
    "accion_ver" integer,
    "accion_bor" boolean,
    "crono_id" integer,
    "crono_nombre" text,
    "crono_descp" text,
    "crono_prop" double precision,
    "crono_peso" double precision,
    "crono_ver" integer,
    "crono_borr" boolean,
    "crono_um_id" integer,
    "crono_um_descp" text,
    "crono_tipo_id" integer,
    "crono_tipo_nombre" text,
    "acumula" boolean,
    "avance_id" integer,
    "avance_fecha" date,
    "avance_cant" double precision,
    "avance_just" text,
    "avance_borr" boolean,
    "av_costo_id" integer,
    "av_costo_monto" double precision,
    "av_costo_cc" text,
    "av_costo_og" integer,
    "av_ver" integer,
    "av_borr" boolean,
    "av_prod_concat" text
) WITH (oids = false);

DROP TABLE IF EXISTS "destinatarios";
CREATE TABLE "public"."destinatarios" (
    "ins_id" integer,
    "sigla" text,
    "ins_ver" integer,
    "ins_borr" boolean,
    "la_id" integer,
    "la_nombre" text,
    "la_est_id" integer,
    "la_tipo_id" integer,
    "la_um_id" integer,
    "la_um_descp" text,
    "la_ver" integer,
    "la_borr" boolean,
    "ila_id" integer,
    "periodo" integer,
    "ila_meta" double precision,
    "ila_ver" integer,
    "ila_borr" boolean,
    "accion_id" integer,
    "accion_peso" double precision,
    "ac_id" integer,
    "ac_nombre" text,
    "ac_um_id" integer,
    "ac_um_descp" text,
    "accion_fecha_ini" date,
    "accion_fecha_fin" date,
    "depto_id" integer,
    "depto_nombre" character varying(50),
    "dist_id" integer,
    "dist_nombre" character varying(50),
    "m1" double precision,
    "m2" double precision,
    "m3" double precision,
    "m4" double precision,
    "ac_ver" integer,
    "ac_borr" boolean,
    "accion_ver" integer,
    "accion_bor" boolean,
    "crono_id" integer,
    "crono_nombre" text,
    "crono_descp" text,
    "crono_prop" double precision,
    "crono_peso" double precision,
    "crono_ver" integer,
    "crono_borr" boolean,
    "crono_um_id" integer,
    "crono_um_descp" text,
    "crono_tipo_id" integer,
    "crono_tipo_nombre" text,
    "acumula" boolean,
    "avance_id" integer,
    "avance_fecha" date,
    "avance_cant" double precision,
    "avance_just" text,
    "avance_borr" boolean,
    "tipo_dest" text,
    "grupo_dest" text,
    "dest_id" integer,
    "dest_cant" integer,
    "dest_desc" text
) WITH (oids = false);

DROP TABLE IF EXISTS "evidencias";
CREATE TABLE "public"."evidencias" (
    "ins_id" integer,
    "sigla" text,
    "ins_ver" integer,
    "ins_borr" boolean,
    "la_id" integer,
    "la_nombre" text,
    "la_est_id" integer,
    "la_tipo_id" integer,
    "la_um_id" integer,
    "la_um_descp" text,
    "la_ver" integer,
    "la_borr" boolean,
    "ila_id" integer,
    "periodo" integer,
    "ila_meta" double precision,
    "ila_ver" integer,
    "ila_borr" boolean,
    "accion_id" integer,
    "accion_peso" double precision,
    "ac_id" integer,
    "ac_nombre" text,
    "ac_um_id" integer,
    "ac_um_descp" text,
    "accion_fecha_ini" date,
    "accion_fecha_fin" date,
    "depto_id" integer,
    "depto_nombre" character varying(50),
    "dist_id" integer,
    "dist_nombre" character varying(50),
    "m1" double precision,
    "m2" double precision,
    "m3" double precision,
    "m4" double precision,
    "ac_ver" integer,
    "ac_borr" boolean,
    "accion_ver" integer,
    "accion_bor" boolean,
    "crono_id" integer,
    "crono_nombre" text,
    "crono_descp" text,
    "crono_prop" double precision,
    "crono_peso" double precision,
    "crono_ver" integer,
    "crono_borr" boolean,
    "crono_um_id" integer,
    "crono_um_descp" text,
    "crono_tipo_id" integer,
    "crono_tipo_nombre" text,
    "acumula" boolean,
    "avance_id" integer,
    "avance_fecha" date,
    "avance_cant" double precision,
    "avance_just" text,
    "avance_borr" boolean,
    "evid_id" integer,
    "evid_nom" text,
    "evid_desc" text,
    "evid_url" text,
    "evid_doc" text,
    "evid_borr" boolean
) WITH (oids = false);

DROP TABLE IF EXISTS "hitos_avances";
CREATE TABLE "public"."hitos_avances" (
    "accion_id" integer,
    "accion_catalogo_nombre" text,
    "accion_departamento_id" integer,
    "accion_distrito_id" integer,
    "accion_departamento" character varying(50),
    "accion_distrito" character varying(50),
    "accion_costo" double precision,
    "institucion_id" integer,
    "institucion" text,
    "ila_meta" double precision,
    "actividad_cantidad_programada" double precision,
    "hito_porcentaje_programado" double precision,
    "hito_porcentaje_ejecutado" double precision,
    "hito_fecha_entrega" date,
    "hito_cantidad_programado" double precision,
    "cantidad_programado" double precision,
    "cantidad_ejecutado" double precision,
    "accion_unidad_medida" text
) WITH (oids = false);

DROP TABLE IF EXISTS "ins_linea_accion_avance";
CREATE TABLE "public"."ins_linea_accion_avance" (
    "ins_linea_accion_id" integer,
    "cantidad" double precision
) WITH (oids = false);

DROP TABLE IF EXISTS "ins_linea_accion_avance_dd";
CREATE TABLE "public"."ins_linea_accion_avance_dd" (
    "ins_linea_accion_id" integer,
    "depto_id" integer,
    "dist_id" integer,
    "cantidad" double precision
) WITH (oids = false);

DROP TABLE IF EXISTS "ins_linea_accion_programacion_anho";
CREATE TABLE "public"."ins_linea_accion_programacion_anho" (
    "ins_linea_accion_id" integer,
    "cantidad_anho" double precision
) WITH (oids = false);

DROP TABLE IF EXISTS "ins_linea_accion_programacion_anho_dd";
CREATE TABLE "public"."ins_linea_accion_programacion_anho_dd" (
    "ins_linea_accion_id" integer,
    "depto_id" integer,
    "dist_id" integer,
    "cantidad_anho" double precision
) WITH (oids = false);

DROP TABLE IF EXISTS "ins_linea_accion_programacion_hoy";
CREATE TABLE "public"."ins_linea_accion_programacion_hoy" (
    "ins_linea_accion_id" integer,
    "cantidad_hoy" double precision
) WITH (oids = false);

DROP TABLE IF EXISTS "ins_linea_accion_programacion_hoy_dd";
CREATE TABLE "public"."ins_linea_accion_programacion_hoy_dd" (
    "ins_linea_accion_id" integer,
    "depto_id" integer,
    "dist_id" integer,
    "cantidad_hoy" double precision
) WITH (oids = false);

DROP TABLE IF EXISTS "linea_accion_acciones";
CREATE TABLE "public"."linea_accion_acciones" (
    "linea_accion_id" integer,
    "linea_accion_nombre" text,
    "accion_id" integer,
    "accion_catalogo_nombre" text,
    "accion_departamento_id" integer,
    "accion_distrito_id" integer,
    "accion_depto_nombre" character varying(50),
    "accion_dist_nombre" character varying(50),
    "accion_fecha_inicio" date,
    "accion_fecha_fin" date,
    "institucion_id" integer,
    "institucion" text,
    "cantidad_programado" double precision,
    "cantidad_ejecutado" double precision,
    "accion_unidad_medida" text,
    "periodo_id" integer
) WITH (oids = false);

DROP TABLE IF EXISTS "linea_accion_acumulado_mes";
CREATE TABLE "public"."linea_accion_acumulado_mes" (
    "linea_accion_id" integer,
    "linea_accion" text,
    "institucion_id" integer,
    "institucion" text,
    "accion_unidad_medida" text,
    "mes" text,
    "actividad_acumulable" boolean,
    "cantidad_programada" double precision,
    "cantidad_ejecutada" double precision
) WITH (oids = false);

DROP TABLE IF EXISTS "linea_accion_acumulado_mes_depto";
CREATE TABLE "public"."linea_accion_acumulado_mes_depto" (
    "linea_accion_id" integer,
    "linea_accion" text,
    "institucion_id" integer,
    "institucion" text,
    "accion_unidad_medida" text,
    "mes" text,
    "actividad_acumulable" boolean,
    "cantidad_programada" double precision,
    "cantidad_ejecutada" double precision,
    "accion_departamento_id" integer,
    "accion_depto_nombre" character varying(50)
) WITH (oids = false);

DROP TABLE IF EXISTS "linea_accion_acumulado_mes_distrito";
CREATE TABLE "public"."linea_accion_acumulado_mes_distrito" (
    "linea_accion_id" integer,
    "linea_accion" text,
    "institucion_id" integer,
    "institucion" text,
    "accion_unidad_medida" text,
    "mes" text,
    "actividad_acumulable" boolean,
    "cantidad_programada" double precision,
    "cantidad_ejecutada" double precision,
    "accion_departamento_id" integer,
    "accion_distrito_id" integer,
    "accion_depto_nombre" character varying(50),
    "accion_dist_nombre" character varying(50)
) WITH (oids = false);

DROP TABLE IF EXISTS "linea_accion_destinatarios1";
CREATE TABLE "public"."linea_accion_destinatarios1" (
    "ins_id" integer,
    "sigla" text,
    "ins_ver" integer,
    "ins_borr" boolean,
    "la_id" integer,
    "la_nombre" text,
    "la_tipo_id" integer,
    "la_estrategia_id" integer,
    "la_um_id" integer,
    "la_um_descp" text,
    "la_ver" integer,
    "la_borr" boolean,
    "ila_id" integer,
    "periodo" integer,
    "ila_meta" double precision,
    "ila_ver" integer,
    "ila_borr" boolean,
    "accion_id" integer,
    "accion_peso" double precision,
    "accion_fecha_ini" date,
    "accion_fecha_fin" date,
    "accion_ver" integer,
    "accion_bor" boolean,
    "m1" double precision,
    "m2" double precision,
    "m3" double precision,
    "m4" double precision,
    "depto_id" integer,
    "depto_nombre" character varying(50),
    "dist_id" integer,
    "dist_nombre" character varying(50),
    "id_accion_catalogo" integer,
    "ac_nombre" text,
    "ac_um_id" integer,
    "ac_um_descp" text,
    "ac_ver" integer,
    "ac_borr" boolean,
    "tipo_dest_nombre" text,
    "grupo_dest_nombre" text,
    "cant_dest" integer,
    "dest_ver" integer,
    "dest_borr" boolean,
    "desc_dest" text,
    "hito_tipo_id" integer,
    "nombre_hito_tipo" text,
    "tipo_dest_id" integer,
    "grupo_dest_id" integer
) WITH (oids = false);

DROP TABLE IF EXISTS "linea_accion_destinatarios_1";
CREATE TABLE "public"."linea_accion_destinatarios_1" (
    "ins_id" integer,
    "sigla" text,
    "ins_ver" integer,
    "ins_borr" boolean,
    "la_id" integer,
    "la_nombre" text,
    "la_tipo_id" integer,
    "la_estrategia_id" integer,
    "la_um_id" integer,
    "la_um_descp" text,
    "la_ver" integer,
    "la_borr" boolean,
    "ila_id" integer,
    "periodo" integer,
    "ila_meta" double precision,
    "ila_ver" integer,
    "ila_borr" boolean,
    "accion_id" integer,
    "accion_peso" double precision,
    "accion_fecha_ini" date,
    "accion_fecha_fin" date,
    "accion_ver" integer,
    "accion_bor" boolean,
    "m1" double precision,
    "m2" double precision,
    "m3" double precision,
    "m4" double precision,
    "depto_id" integer,
    "depto_nombre" character varying(50),
    "dist_id" integer,
    "dist_nombre" character varying(50),
    "id_accion_catalogo" integer,
    "ac_nombre" text,
    "ac_um_id" integer,
    "ac_um_descp" text,
    "ac_ver" integer,
    "ac_borr" boolean,
    "tipo_dest_nombre" text,
    "grupo_dest_nombre" text,
    "cant_dest" integer,
    "dest_ver" integer,
    "dest_borr" boolean,
    "desc_dest" text,
    "tipo_dest_id" integer,
    "grupo_dest_id" integer
) WITH (oids = false);

DROP TABLE IF EXISTS "linea_accion_presupuesto_old";
CREATE TABLE "public"."linea_accion_presupuesto_old" (
    "ins_id" integer,
    "sigla" text,
    "ins_ver" integer,
    "ins_borr" boolean,
    "la_id" integer,
    "la_nombre" text,
    "la_tipo_id" integer,
    "la_estrategia_id" integer,
    "la_um_id" integer,
    "la_um_descp" text,
    "la_ver" integer,
    "la_borr" boolean,
    "ila_id" integer,
    "periodo" integer,
    "ila_meta" double precision,
    "ila_ver" integer,
    "ila_borr" boolean,
    "accion_id" integer,
    "accion_peso" double precision,
    "accion_fecha_ini" date,
    "accion_fecha_fin" date,
    "accion_ver" integer,
    "accion_bor" boolean,
    "m1" double precision,
    "m2" double precision,
    "m3" double precision,
    "m4" double precision,
    "depto_id" integer,
    "depto_nombre" character varying(50),
    "dist_id" integer,
    "dist_nombre" character varying(50),
    "id_accion_catalogo" integer,
    "ac_nombre" text,
    "ac_um_id" integer,
    "ac_um_descp" text,
    "ac_ver" integer,
    "ac_borr" boolean,
    "proporcion" integer,
    "version" integer,
    "borrado" boolean,
    "spr_nivel_id" integer,
    "spr_entidad_id" integer,
    "spr_tiprograma_id" integer,
    "spr_programa_id" integer,
    "spr_subprograma_id" integer,
    "srp_proyecto_id" integer,
    "spr_producto_id" integer,
    "u_medida" text,
    "cant_fisica" double precision,
    "clase" text,
    "prod_asig_financiera" double precision,
    "accion_costo" double precision,
    "spr_anho" integer,
    "spr_version" integer,
    "producto_concat" text
) WITH (oids = false);

DROP TABLE IF EXISTS "linea_accion_programado2";
CREATE TABLE "public"."linea_accion_programado2" (
    "ins_id" integer,
    "institucion" text,
    "ins_orden" integer,
    "ins_ver" integer,
    "ins_borr" boolean,
    "la_id" integer,
    "la_orden" integer,
    "la_nombre" text,
    "la_tipo_id" integer,
    "la_estrategia_id" integer,
    "la_um_id" integer,
    "la_um_descp" text,
    "la_ver" integer,
    "la_borr" boolean,
    "ila_id" integer,
    "periodo" integer,
    "ila_meta" double precision,
    "ila_ver" integer,
    "ila_borr" boolean,
    "accion_id" integer,
    "accion_peso" double precision,
    "accion_fecha_ini" date,
    "accion_fecha_fin" date,
    "accion_ver" integer,
    "accion_bor" boolean,
    "m1" double precision,
    "m2" double precision,
    "m3" double precision,
    "m4" double precision,
    "depto_id" integer,
    "depto_nombre" character varying(50),
    "dist_id" integer,
    "dist_nombre" character varying(50),
    "id_accion_catalogo" integer,
    "ac_nombre" text,
    "ac_um_id" integer,
    "ac_um_descp" text,
    "ac_ver" integer,
    "ac_borr" boolean,
    "crono_id" integer,
    "crono_nombre" text,
    "crono_descp" text,
    "crono_prop" double precision,
    "crono_peso" double precision,
    "crono_ver" integer,
    "crono_borr" boolean,
    "crono_um_id" integer,
    "crono_tipo_id" integer,
    "crono_tipo_nombre" text,
    "cant_prog" double precision,
    "fecha_entrega" date,
    "prog_ver" integer,
    "prog_borr" boolean,
    "crono_um_descp" text,
    "acumula" boolean,
    "prog_id" integer
) WITH (oids = false);

DROP TABLE IF EXISTS "linea_accion_programado_old";
CREATE TABLE "public"."linea_accion_programado_old" (
    "ins_id" integer,
    "sigla" text,
    "ins_ver" integer,
    "ins_borr" boolean,
    "la_id" integer,
    "la_nombre" text,
    "la_tipo_id" integer,
    "la_estrategia_id" integer,
    "la_um_id" integer,
    "la_um_descp" text,
    "la_ver" integer,
    "la_borr" boolean,
    "ila_id" integer,
    "periodo" integer,
    "ila_meta" double precision,
    "ila_ver" integer,
    "ila_borr" boolean,
    "accion_id" integer,
    "accion_peso" double precision,
    "accion_fecha_ini" date,
    "accion_fecha_fin" date,
    "accion_ver" integer,
    "accion_bor" boolean,
    "m1" double precision,
    "m2" double precision,
    "m3" double precision,
    "m4" double precision,
    "depto_id" integer,
    "depto_nombre" character varying(50),
    "dist_id" integer,
    "dist_nombre" character varying(50),
    "id_accion_catalogo" integer,
    "ac_nombre" text,
    "ac_um_id" integer,
    "ac_um_descp" text,
    "ac_ver" integer,
    "ac_borr" boolean,
    "crono_id" integer,
    "crono_nombre" text,
    "crono_descp" text,
    "crono_prop" double precision,
    "crono_peso" double precision,
    "crono_ver" integer,
    "crono_borr" boolean,
    "crono_um_id" integer,
    "crono_tipo_id" integer,
    "crono_tipo_nombre" text,
    "cant_prog" double precision,
    "fecha_entrega" date,
    "prog_ver" integer,
    "prog_borr" boolean,
    "crono_um_nombre" text
) WITH (oids = false);

DROP TABLE IF EXISTS "plan_accion_avances";
CREATE TABLE "public"."plan_accion_avances" (
    "institucion" text,
    "la_id" integer,
    "linea_accion" text,
    "la_unidad" text,
    "anho" integer,
    "la_meta" double precision,
    "a_id" integer,
    "accion" text,
    "a_peso" double precision,
    "a_unidad" text,
    "depto_id" integer,
    "departamento" character varying(50),
    "dist_id" integer,
    "distrito" character varying(50),
    "crono_id" integer,
    "cronograma" text,
    "crono_descripcion" text,
    "contribucion" double precision,
    "influencia" double precision,
    "crono_unidad" text,
    "crono_tipo" text,
    "crono_acumula" boolean,
    "fecha" date,
    "mes" text,
    "programacion_cantidad" text,
    "avance_cantidad" text,
    "justificacion" text,
    "avance_costo" text,
    "avance_destinatarios" text,
    "avance_evidencias" text,
    "distrito_avance" character varying,
    "departamento_avance" character varying
) WITH (oids = false);

DROP TABLE IF EXISTS "plan_accion_scs";
CREATE TABLE "public"."plan_accion_scs" (
    "institucion" text,
    "la_id" integer,
    "linea_accion" text,
    "la_unidad" text,
    "anho" integer,
    "la_meta" double precision,
    "a_id" integer,
    "accion" text,
    "a_peso" double precision,
    "a_unidad" text,
    "depto_id" integer,
    "departamento" character varying(50),
    "dist_id" integer,
    "distrito" character varying(50),
    "crono_id" integer,
    "cronograma" text,
    "crono_descripcion" text,
    "contribucion" double precision,
    "influencia" double precision,
    "crono_unidad" text,
    "crono_tipo" text,
    "crono_acumula" boolean,
    "fecha" date,
    "prog_id" integer,
    "av_id" integer,
    "mes" text,
    "programacion_cantidad" numeric,
    "avance_cantidad" numeric,
    "justificacion" text,
    "avance_costo" numeric,
    "avance_destinatarios" numeric,
    "avance_evidencias" numeric
) WITH (oids = false);

DROP TABLE IF EXISTS "resumen_linea_accion";
CREATE TABLE "public"."resumen_linea_accion" (
    "ins_id" integer,
    "sigla" text,
    "la_id" integer,
    "la_nombre" text,
    "la_tipo_id" integer,
    "la_estrategia_id" integer,
    "la_um_id" integer,
    "la_um_descp" text,
    "ila_id" integer,
    "periodo" integer,
    "ila_meta" double precision,
    "meta_accion" double precision,
    "cant_prog" double precision,
    "ins_orden" integer,
    "la_orden" integer,
    "cant_dest" bigint,
    "costo_ac" double precision
) WITH (oids = false);

DROP TABLE IF EXISTS "v_linea_accion_avance";
CREATE TABLE "public"."v_linea_accion_avance" (
    "ins_id" integer,
    "ins_sigla" text,
    "ins_ver" integer,
    "ins_borr" boolean,
    "ila_id" integer,
    "periodo" integer,
    "ila_meta" double precision,
    "ila_ver" integer,
    "ila_bor" boolean,
    "accion_id" integer,
    "accion_costo" double precision,
    "accion_peso" double precision,
    "accion_fecha_ini" date,
    "accion_fecha_fin" date,
    "accion_ver" integer,
    "accion_bor" boolean,
    "m1" double precision,
    "m2" double precision,
    "m3" double precision,
    "m4" double precision,
    "depto_id" integer,
    "dist_id" integer,
    "crono_id" integer,
    "crono_nombre" text,
    "crono_descp" text,
    "crono_prop" double precision,
    "crono_peso" double precision,
    "crono_ver" integer,
    "crono_borr" boolean,
    "crono_um_id" integer,
    "crono_tipo_id" integer,
    "crono_tipo_nombre" text,
    "crono_tipo_descripcion" text,
    "crono_tipo_version" integer,
    "crono_tipo_borrado" boolean,
    "avance_justificacion" text,
    "avance_cantidad" double precision,
    "avance_fecha_entrega" date,
    "avance_cantidad_beneficiarios" integer,
    "avance_version" integer,
    "avance_borrado" boolean,
    "avance_costo_id" integer,
    "avance_costo_monto" double precision,
    "avance_costo_codigo_contratacional" text,
    "avance_costo_objeto_gasto" integer,
    "avance_costo_version" integer,
    "avance_costo_borrado" boolean
) WITH (oids = false);

DROP TABLE IF EXISTS "avances";
CREATE TABLE "public"."avances" (
    "ins_id" integer,
    "sigla" text,
    "ins_ver" integer,
    "ins_borr" boolean,
    "la_id" integer,
    "la_nombre" text,
    "la_est_id" integer,
    "la_tipo_id" integer,
    "la_um_id" integer,
    "la_um_descp" text,
    "la_ver" integer,
    "la_borr" boolean,
    "ila_id" integer,
    "periodo" integer,
    "ila_meta" double precision,
    "ila_ver" integer,
    "ila_borr" boolean,
    "accion_id" integer,
    "accion_peso" double precision,
    "ac_id" integer,
    "ac_nombre" text,
    "ac_um_id" integer,
    "ac_um_descp" text,
    "accion_fecha_ini" date,
    "accion_fecha_fin" date,
    "depto_id" integer,
    "depto_nombre" character varying(50),
    "dist_id" integer,
    "dist_nombre" character varying(50),
    "m1" double precision,
    "m2" double precision,
    "m3" double precision,
    "m4" double precision,
    "ac_ver" integer,
    "ac_borr" boolean,
    "accion_ver" integer,
    "accion_bor" boolean,
    "crono_id" integer,
    "crono_nombre" text,
    "crono_descp" text,
    "crono_prop" double precision,
    "crono_peso" double precision,
    "crono_ver" integer,
    "crono_borr" boolean,
    "crono_um_id" integer,
    "crono_um_descp" text,
    "crono_tipo_id" integer,
    "crono_tipo_nombre" text,
    "acumula" boolean,
    "avance_id" integer,
    "avance_fecha" date,
    "avance_cant" double precision,
    "avance_just" text,
    "avance_borr" boolean,
    "distrito_avance" character varying,
    "departamento_avance" character varying
) WITH (oids = false);

-- 2017-05-05 15:38:23.367324-04
