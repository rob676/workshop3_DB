-- Generated by Oracle SQL Developer Data Modeler 19.4.0.350.1424
--   at:        2020-04-30 21:41:11 EEST
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g



CREATE TABLE country

( country VARCHAR2 ( 38, 2 ) NOT NULL, region1 VARCHAR2 ( 128 ) NOT NULL ) 
;

ALTER TABLE country ADD CONSTRAINT country_pk PRIMARY KEY ( country );

CREATE TABLE "country type"

(
    agriculture  NUMBER(38, 3),
    industry     NUMBER(38, 3),
    services     NUMBER(38, 3),
    country_fk   VARCHAR2
( 38, 2 ) NOT NULL, add_date DATE ) 
;

ALTER TABLE "country type"
    ADD CONSTRAINT "country type_CK_1" CHECK ( agriculture + industry + services = 1 );

ALTER TABLE "country type" ADD CONSTRAINT "country type__UN" UNIQUE ( add_date );

CREATE TABLE gdp

(
    gdp         NUMBER(38, 2),
    country_fk  VARCHAR2
( 38, 2 ) NOT NULL, add_date DATE ) 
;

ALTER TABLE gdp ADD CONSTRAINT gdp_ck_1 CHECK ( gdp >= 0 );

ALTER TABLE gdp ADD CONSTRAINT gdp__un UNIQUE ( add_date );

CREATE TABLE "Net migration"

(
    "net migration"  NUMBER(38, 2),
    country_fk       VARCHAR2
( 38, 2 ) NOT NULL, add_date DATE ) 
;

ALTER TABLE "Net migration" ADD CONSTRAINT "Net migration__UN" UNIQUE ( add_date );

CREATE TABLE "pop destiny"

(
    population  NUMBER(38),
    area        NUMBER(38),
    country_fk  VARCHAR2
( 38, 2 ) NOT NULL, add_date DATE ) 
;

ALTER TABLE "pop destiny" ADD CONSTRAINT "pop destiny_CK_1" CHECK ( population >= 0 );

ALTER TABLE "pop destiny" ADD CONSTRAINT "pop destiny_CK_2" CHECK ( area >= 0 );

ALTER TABLE "pop destiny" ADD CONSTRAINT "pop destiny__UN" UNIQUE ( add_date );

CREATE TABLE region (
    region VARCHAR2(128) NOT NULL
);

ALTER TABLE region ADD CONSTRAINT region_pk PRIMARY KEY ( region );

ALTER TABLE country
    ADD CONSTRAINT country_region_fk FOREIGN KEY ( region1 )
        REFERENCES region ( region );

ALTER TABLE "country type"
    ADD CONSTRAINT "country type_country_FK" FOREIGN KEY ( country_fk )
        REFERENCES country ( country );

ALTER TABLE gdp
    ADD CONSTRAINT gdp_country_fk FOREIGN KEY ( country_fk )
        REFERENCES country ( country );

ALTER TABLE "Net migration"
    ADD CONSTRAINT "Net migration_country_FK" FOREIGN KEY ( country_fk )
        REFERENCES country ( country );

ALTER TABLE "pop destiny"
    ADD CONSTRAINT "pop destiny_country_FK" FOREIGN KEY ( country_fk )
        REFERENCES country ( country );



-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                             6
-- CREATE INDEX                             0
-- ALTER TABLE                             15
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
