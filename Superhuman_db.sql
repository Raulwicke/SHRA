#This file creates the SuperHuman Registration Act's database of superheroes'
#The database was designed and populated by Nicholas Dayton Bradford
#Project Beginning date: 9/16/16
#Project Last Update: 9/16/16



DROP DATABASE IF EXISTS SHRA_db ;
CREATE DATABASE SHRA_db ;
USE SHRA_db ; 

#The project will monitor superheroes by secret identity, id number, and alias
#EX. Ms.MARVEL will be appear as "ID: XX-XXX-XXX, LAST: Danvers , FIRST: Carol, ALIAS: Ms.Marvel"
CREATE TABLE IF NOT EXISTS identities (
	id INT,
	lastName text,
	firstName text,
	alias text NOT NULL,
	PRIMARY KEY (id)
);

#This project will monitor powered persons by their abilities and their power levels
#EX: Ms.Marvel will appear as "STRENGTH: X, SPEED: X, DURABILITY: X, ENERGY: X, STAMINA: X"
CREATE TABLE IF NOT EXISTS powers {
	pid INT,
	StrLvl INT BETWEEN 1 AND 10 NOT NULL,
	SpdLvl INT BETWEEN 1 AND 10 NOT NULL,
	DurLvl INT BETWEEN 1 AND 10 NOT NULL,
	NRGLvl INT BETWEEN 1 AND 10 NOT NULL,
	StamLvl INT BETWEEN 1 AND 10 NOT NULL,
	PRIMARY KEY (pid)
};


