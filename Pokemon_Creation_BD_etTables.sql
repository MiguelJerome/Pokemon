IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'Pokemon') 
CREATE DATABASE Pokemon

use Pokemon

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'National_Dex' AND type = 'U') ----U type usertable
    CREATE TABLE National_Dex (
        Number INT NOT NULL PRIMARY KEY,
        Name NVARCHAR(12) NOT NULL,
        Type_1 NVARCHAR(8) NOT NULL,
        Type_2 NVARCHAR(8),
        HP INT NOT NULL,
        Attack INT NOT NULL,
        Defense INT NOT NULL,
        Sp_Attack INT NOT NULL,
        Sp_Defense INT NOT NULL,
        Speed INT NOT NULL
    );

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Generation1' AND type = 'U') ----U type usertable
    CREATE TABLE Generation1 (
        Number INT NOT NULL PRIMARY KEY,
        Name NVARCHAR(12) NOT NULL,
        Type_1 NVARCHAR(8) NOT NULL,
        Type_2 NVARCHAR(8),
        HP INT NOT NULL,
        Attack INT NOT NULL,
        Defense INT NOT NULL,
        Sp_Attack INT NOT NULL,
        Sp_Defense INT NOT NULL,
        Speed INT NOT NULL,
        FOREIGN KEY(Number) REFERENCES National_Dex 
    );

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Generation2' AND type = 'U') ----U type usertable
    CREATE TABLE Generation2 (
        Number INT NOT NULL PRIMARY KEY,
        Name NVARCHAR(12) NOT NULL,
        Type_1 NVARCHAR(8) NOT NULL,
        Type_2 NVARCHAR(8),
        HP INT NOT NULL,
        Attack INT NOT NULL,
        Defense INT NOT NULL,
        Sp_Attack INT NOT NULL,
        Sp_Defense INT NOT NULL,
        Speed INT NOT NULL,
        FOREIGN KEY(Number) REFERENCES National_Dex 
    );

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Generation3' AND type = 'U') ----U type usertable
    CREATE TABLE Generation3 (
        Number INT NOT NULL PRIMARY KEY,
        Name NVARCHAR(12) NOT NULL,
        Type_1 NVARCHAR(8) NOT NULL,
        Type_2 NVARCHAR(8),
        HP INT NOT NULL,
        Attack INT NOT NULL,
        Defense INT NOT NULL,
        Sp_Attack INT NOT NULL,
        Sp_Defense INT NOT NULL,
        Speed INT NOT NULL,
        FOREIGN KEY(Number) REFERENCES National_Dex 
    );

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Generation4' AND type = 'U') ----U type usertable
    CREATE TABLE Generation4 (
        Number INT NOT NULL PRIMARY KEY,
        Name NVARCHAR(12) NOT NULL,
        Type_1 NVARCHAR(8) NOT NULL,
        Type_2 NVARCHAR(8),
        HP INT NOT NULL,
        Attack INT NOT NULL,
        Defense INT NOT NULL,
        Sp_Attack INT NOT NULL,
        Sp_Defense INT NOT NULL,
        Speed INT NOT NULL,
        FOREIGN KEY(Number) REFERENCES National_Dex 
    );

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Generation5' AND type = 'U') ----U type usertable
    CREATE TABLE Generation5 (
        Number INT NOT NULL PRIMARY KEY,
        Name NVARCHAR(12) NOT NULL,
        Type_1 NVARCHAR(8) NOT NULL,
        Type_2 NVARCHAR(8),
        HP INT NOT NULL,
        Attack INT NOT NULL,
        Defense INT NOT NULL,
        Sp_Attack INT NOT NULL,
        Sp_Defense INT NOT NULL,
        Speed INT NOT NULL,
        FOREIGN KEY(Number) REFERENCES National_Dex 
    );

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Generation6' AND type = 'U') ----U type usertable
    CREATE TABLE Generation6 (
        Number INT NOT NULL PRIMARY KEY,
        Name NVARCHAR(12) NOT NULL,
        Type_1 NVARCHAR(8) NOT NULL,
        Type_2 NVARCHAR(8),
        HP INT NOT NULL,
        Attack INT NOT NULL,
        Defense INT NOT NULL,
        Sp_Attack INT NOT NULL,
        Sp_Defense INT NOT NULL,
        Speed INT NOT NULL,
        FOREIGN KEY(Number) REFERENCES National_Dex 
    );

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Generation7' AND type = 'U') ----U type usertable
    CREATE TABLE Generation7 (
        Number INT NOT NULL PRIMARY KEY,
        Name NVARCHAR(12) NOT NULL,
        Type_1 NVARCHAR(8) NOT NULL,
        Type_2 NVARCHAR(8),
        HP INT NOT NULL,
        Attack INT NOT NULL,
        Defense INT NOT NULL,
        Sp_Attack INT NOT NULL,
        Sp_Defense INT NOT NULL,
        Speed INT NOT NULL,
        FOREIGN KEY(Number) REFERENCES National_Dex 
    );

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Generation8' AND type = 'U') ----U type usertable
    CREATE TABLE Generation8 (
        Number INT NOT NULL PRIMARY KEY,
        Name NVARCHAR(12) NOT NULL,
        Type_1 NVARCHAR(8) NOT NULL,
        Type_2 NVARCHAR(8),
        HP INT NOT NULL,
        Attack INT NOT NULL,
        Defense INT NOT NULL,
        Sp_Attack INT NOT NULL,
        Sp_Defense INT NOT NULL,
        Speed INT NOT NULL,
        FOREIGN KEY(Number) REFERENCES National_Dex 
    );

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Generation9' AND type = 'U') ----U type usertable
    CREATE TABLE Generation9 (
        Number INT NOT NULL PRIMARY KEY,
        Name NVARCHAR(12) NOT NULL,
        Type_1 NVARCHAR(8) NOT NULL,
        Type_2 NVARCHAR(8),
        HP INT NOT NULL,
        Attack INT NOT NULL,
        Defense INT NOT NULL,
        Sp_Attack INT NOT NULL,
        Sp_Defense INT NOT NULL,
        Speed INT NOT NULL,
        FOREIGN KEY(Number) REFERENCES National_Dex 
    );

ALTER TABLE National_Dex
ADD CONSTRAINT UC_Number_National_Dex UNIQUE (Number);

ALTER TABLE Generation1
ADD CONSTRAINT UC_Number_Generation1 UNIQUE (Number);

ALTER TABLE Generation2
ADD CONSTRAINT UC_Number_Generation2 UNIQUE (Number);

ALTER TABLE Generation3
ADD CONSTRAINT UC_Number_Generation3 UNIQUE (Number);

ALTER TABLE Generation4
ADD CONSTRAINT UC_Number_Generation4 UNIQUE (Number);

ALTER TABLE Generation5
ADD CONSTRAINT UC_Number_Generation5 UNIQUE (Number);

ALTER TABLE Generation6
ADD CONSTRAINT UC_Number_Generation6 UNIQUE (Number);

ALTER TABLE Generation7
ADD CONSTRAINT UC_Number_Generation7 UNIQUE (Number);

ALTER TABLE Generation8
ADD CONSTRAINT UC_Number_Generation8 UNIQUE (Number);

ALTER TABLE Generation9
ADD CONSTRAINT UC_Number_Generation9 UNIQUE (Number);
