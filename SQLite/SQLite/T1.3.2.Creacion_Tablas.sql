DROP TABLE IF EXISTS "CLIENTE";
CREATE TABLE IF NOT EXISTS "CLIENTE" (
	"CUENTA_CODIGO"	INTEGER,
	"PLAN_COMERCIAL_DK"	INTEGER,
	"CONSULTOR_DK"	INTEGER,
	"ORGANIZACION_ID"	INTEGER,
	"STAFF_ID"	INTEGER,
	"SIMCARD"	INTEGER,
	"MSISDN"	TEXT,
	"CICLO_FACTURACION"	INTEGER,
	"SERVICIO"	TEXT,
	"ESTADO"	TEXT,
	"SUBSCRIBER_ID"	INTEGER,
	"ORDEN_CODIGO"	INTEGER,
	"MOVIMIENTO_NOMBRE"	TEXT,
	"MOVIMIENTO_TIPO_NOMBRE"	TEXT,
	"OPERADOR_PORTA_ORIGEN"	TEXT,
	"OPERADOR_PORTA_DESTINO"	TEXT,
	"COMISIONABLE"	INTEGER,
	"FECHA_ALTA"	TEXT,
	"REVENUE"	NUMERIC,
	"FECHA_CARGA_DWH"	TEXT,
	PRIMARY KEY("CUENTA_CODIGO")
);
DROP TABLE IF EXISTS "FACTURACION";
CREATE TABLE IF NOT EXISTS "FACTURACION" (
	"ID"	INTEGER,
	"FACTURA_CODIGO"	INTEGER,
	"FACTURA_FECHA"	TEXT,
	"FACTURA_TIPO"	TEXT,
	"SUBSCRIBER_ID"	INTEGER,
	"CUENTA_CODIGO"	INTEGER,
	"FACTURA_MONTO"	BOOLEAN,
	"FACTURA_FECHA_VENCIMIENTO"	TEXT,
	"CONSULTOR_CODIGO"	TEXT,
	PRIMARY KEY("ID"),
	FOREIGN KEY("CUENTA_CODIGO") REFERENCES "CLIENTE"("CUENTA_CODIGO")
);
DROP TABLE IF EXISTS "CONSUMO";
CREATE TABLE IF NOT EXISTS "CONSUMO" (
	"ID"	INTEGER,
	"PERIODO_PROCESO_CODIGO"	TEXT,
	"CLIENTE_DK"	INTEGER,
	"SUBSCRIBER_ID"	TEXT,
	"TIPO_EVENTO"	TEXT,
	"CICLO_FACTURACION"	INTEGER,
	"AREA_ID"	TEXT,
	"CUENTA_ID"	INTEGER,
	"OPERADOR_RAN"	TEXT,
	"NUMERO_ORIGEN"	TEXT,
	"DURACION_SEG"	INTEGER,
	"LOCALIZACION_USUARIO"	TEXT,
	"PLMNID_SGSN"	INTEGER,
	"PLMNID_GGSN"	INTEGER,
	PRIMARY KEY("ID"),
	FOREIGN KEY("CUENTA_ID") REFERENCES "CLIENTE"("CUENTA_CODIGO")
);






