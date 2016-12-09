DROP VIEW  IF EXISTS AccessMetaData;
DROP VIEW  IF EXISTS ConvictCatalog;
DROP VIEW  IF EXISTS PowerInventory;
DROP FUNCTION IF EXISTS locateMetaorigin(text);
DROP FUNCTION IF EXISTS locateMetaAbility(text);
DROP TABLE IF EXISTS abilities;
DROP TABLE IF EXISTS levels;
DROP TABLE IF EXISTS origins;
DROP TABLE IF EXISTS types;
DROP TABLE IF EXISTS registration;
DROP TABLE IF EXISTS activity;
DROP TABLE IF EXISTS location;
DROP TABLE IF EXISTS states;
DROP TABLE IF EXISTS addresses;
DROP TABLE IF EXISTS events;
DROP TABLE IF EXISTS eventNames;
DROP TABLE IF EXISTS teams;
DROP TABLE IF EXISTS convicted;
DROP TABLE IF EXISTS metahumans;
DROP TYPE  IF EXISTS actstat;
CREATE ROLE LevelFive;
CREATE ROLE LeveSix;
CREATE ROLE LevelSeven;
CREATE ROLE LevelEight;
CREATE ROLE LevelNine;
CREATE ROLE LevelTen;

CREATE TYPE actstat AS ENUM('Inactive', 'Active', 'Retired', 'Deceased', 'Missing');
-- metahumans --
CREATE TABLE metahumans(
	MHID 	TEXT,
	alias	text,
	fName 	text,
	lName	text,
	PRIMARY KEY (MHID)
);

-- Ability types --
-- Type of Ability owned by a Meta {Mind Control, Super Strength, etc.} --
CREATE TABLE TYPES(
	TypeID TEXT,
	TypeClass text NOT NULL,
	PRIMARY KEY (TypeID)
);

-- Ability origins --
-- origin of Ability {Tech, Mutant, Inhuman, Bio-Advancement}
CREATE TABLE origins(
	originID TEXT,
	originClass TEXT NOT NULL,
	PRIMARY KEY (originID)
);

-- Power Class --
-- Level of Ability of Meta {Omega, Alpha, Beta, Delta, Gamma} --
CREATE TABLE levels(
	PLID TEXT,
	PowerClass text NOT NULL,
	PRIMARY KEY (PLID)
);

-- Abilities --
CREATE TABLE ABILITIES(
	AbilityID 	TEXT,
	MHID 		TEXT REFERENCES metahumans(MHID),
	originID		TEXT REFERENCES origins(originID),
	TypeID		TEXT REFERENCES types(TypeID),
	PLID		TEXT REFERENCES levels (PLID),
	PRIMARY KEY (AbilityID)
);

-- Activity --
-- What the level of Activeness a Meta is {Inactive, Active, Retired, Deceased, Missing} --
CREATE TABLE activity(
	MHID 		TEXT REFERENCES metahumans(MHID),
    ActiveStat 	actstat,
	PRIMARY KEY (MHID)
);

-- registration --
-- registration Number of Registered Metas -- 
CREATE TABLE registration(
	RegID TEXT,
	MHID  TEXT REFERENCES metahumans(MHID),
	PRIMARY KEY (RegID)
);

-- States --
-- State location of Meta Humans according to Super Human registration Act and S.H.I.E.L.D. Intel --
CREATE TABLE STATES(
	StateID TEXT,
	StateName text NOT NULL UNIQUE,
	PRIMARY KEY (StateID)
);

-- Address --
-- Street Address of Meta Humans according to Super Human registration Act and S.H.I.E.L.D. Intel --
CREATE TABLE ADDRESSES(
	AddressID TEXT,
	Street 	TEXT ,
	City	TEXT NOT NULL,
	Zip		TEXT,
	PRIMARY KEY (AddressID)
);

-- Teams --
-- Team Assigments by proxy of the Fifty State Initiative --
CREATE TABLE TEAMS(
	TeamID TEXT,
	TeamName TEXT NOT NULL UNIQUE,
	PRIMARY KEY (TeamID)
);

-- Locations --
-- Location of Meta Humans according to the Super Human registration Act and S.H.I.E.L.D. Intel--
CREATE TABLE location(
	LocID TEXT,
	MHID TEXT REFERENCES metahumans(MHID) NOT NULL,
	StateID TEXT REFERENCES STATES(StateID) NOT NULL,
	AddressID TEXT REFERENCES ADDRESSES(AddressID),
	TeamID TEXT REFERENCES TEAMS(TeamID),
	PRIMARY KEY (LocID)
);

--Event Names --
-- Events that have happened in the Marvel Universe --
CREATE TABLE eventNames(
	EventId TEXT,
	EventName TEXT NOT NULL,
	PRIMARY KEY (EventId)
);

-- Events --
-- Events that have happened in the Marvel Universe and what Metas were involved --
CREATE TABLE events(
	EventId TEXT references EventNames(EventId),
	MHID 	TEXT references metahumans(MHID)
);

CREATE TABLE convicted(
    PrisonerID TEXT,
    MHID TEXT references metahumans(MHID),
    PRIMARY KEY (PrisonerID)
);

-- Metahumans --
INSERT INTO METAHUMANS( MHID, alias, fName, lName)
	VALUES	('EL67O1', 'Captain America', 'Steven', 'Rogers'),
			('RK50N5', 'Iron Man', 'Anthony', 'Stark'),
			('QB75Q3', 'Hulk, The', 'Bruce', 'Banner'),
			('HK72U4', 'Thing, The', 'Benjamin', 'Grimm'),
			('YZ94L4', 'Patriot','Eli','Bradley'),
			('YW46P5', 'Sister Grimm','Nico','Minoru'),
			('IZ27J0', 'Mister Fantastic','Reed','Richards'),
			('ZP84Q6', 'Nova','Richard','Rider'),
			('UC99L9', 'Beast','Hank','McCoy'),
			('UR31O5', 'Giant Man','Hank','Pym'),
			('LL12G7', 'Ant-Man','Scott','Lang'),
			('OV70X3', 'Ant-Man','Hank','Pym'),
			('YC26T9', 'Yellowjacket','Hank','Pym'),
            ('KA67G7', 'Bullseye', 'Lester', 'UNKOWN');

-- Types --
INSERT INTO TYPES (TypeID, TypeClass)
	VALUES 	('AL73X7','Peak Physical Condition'),
			('ZD72B3','Advance Mechanical Armor'),
			('BA16S4','Gamma Mutate'),
			('EC12Z6','Rock-Based Natural Armor'),
			('AT51N1','Magical Artifact'),
			('LZ82A5','Animal-like Physiology'),
			('KZ39E8','Size Manipulation'),
			('WI20T1','Nova Force'),
			('OV17Z8','Elasticity'),
            ('RB95L5','Master Marksman');

-- origins --
INSERT INTO origins (originID,originClass)
	VALUES 	('MX73W1','Super Soldier Serum'),
			('RP41W1','Technological Innovation'),
			('SS67W3','Radiation Accident'),
			('NS30H6','Cosmic Rays'),
			('WP23U0','Legacy'),
			('YJ49O4','Pym Particles'),
			('TX25O9','Human Mutate'),
			('LF44D2','Intergalatic Police Force'),
            ('GW25U6','Intense Physical Training');

-- Levels --
INSERT INTO LEVELS (PLID, PowerClass)
	VALUES 	('TW31J8','Omega'),
			('VV51H8','Alpha'),
			('BZ54I1','Beta'),
			('AM41K2','Delta'),
			('FF37F0','Gamma');

-- Abilities --
INSERT INTO ABILITIES(AbilityID, MHID, originID, TypeID, PLID)
	VALUES 	('CM77S8','EL67O1','MX73W1','AL73X7','VV51H8'),
			('HP82T9','RK50N5','RP41W1','ZD72B3','VV51H8'),
			('EN58A5','QB75Q3','SS67W3','BA16S4','VV51H8'),
			('ZQ76N8','HK72U4','NS30H6','EC12Z6','BZ54I1'),
			('KM11U7','YZ94L4','WP23U0','AL73X7','AM41K2'),
			('MV17Y3','YW46P5','WP23U0','AT51N1','BZ54I1'),
			('ZX48E7','IZ27J0','NS30H6','OV17Z8','VV51H8'),
			('UI99Y0','ZP84Q6','LF44D2','WI20T1','VV51H8'),
			('AA27O8','UC99L9','TX25O9','LZ82A5','BZ54I1'),
			('AC25X3','UR31O5','YJ49O4','KZ39E8','BZ54I1'),
			('BV49B4','LL12G7','YJ49O4','KZ39E8','BZ54I1'),
			('QQ61J7','OV70X3','YJ49O4','KZ39E8','BZ54I1'),
			('KT81P4','YC26T9','YJ49O4','KZ39E8','BZ54I1'),
            ('XH11A4','KA67G7','GW25U6','RB95L5','FF37F0');
			
-- States --
INSERT INTO States(StateID,StateName)
	VALUES 	('AL', 'Alabama'),
			('AK', 'Alaska'),
			('AZ', 'Arizona'),
			('AR', 'Arkansas'),
			('CA', 'California'),
			('CO', 'Colorado'),
			('CT', 'Connecticut'),
			('DE', 'Delaware'),
			('DC', 'District of Columbia'),
			('FL', 'Florida'),
			('GA', 'Georgia'),
			('HI', 'Hawaii'),
			('ID', 'Idaho'),
			('IL', 'Illinois'),
			('IN', 'Indiana'),
			('IA', 'Iowa'),
			('KS', 'Kansas'),
			('KY', 'Kentucky'),
			('LA', 'Louisiana'),
			('ME', 'Maine'),
			('MD', 'Maryland'),
			('MA', 'Massachusetts'),
			('MI', 'Michigan'),
			('MN', 'Minnesota'),
			('MS', 'Mississippi'),
			('MO', 'Missouri'),
			('MT', 'Montana'),
			('NE', 'Nebraska'),
			('NV', 'Nevada'),
			('NH', 'New Hampshire'),
			('NJ', 'New Jersey'),
			('NM', 'New Mexico'),
			('NY', 'New York'),
			('NC', 'North Carolina'),
			('ND', 'North Dakota'),
			('OH', 'Ohio'),
			('OK', 'Oklahoma'),
			('OR', 'Oregon'),
			('PA', 'Pennsylvania'),
			('PR', 'Puerto Rico'),
			('RI', 'Rhode Island'),
			('SC', 'South Carolina'),
			('SD', 'South Dakota'),
			('TN', 'Tennessee'),
			('TX', 'Texas'),
			('UT', 'Utah'),
			('VT', 'Vermont'),
			('VA', 'Virginia'),
			('WA', 'Washington'),
			('WV', 'West Virginia'),
			('WI', 'Wisconsin'),
			('WY', 'Wyoming');

-- Teams --
INSERT INTO Teams(TeamID,TeamName)
	VALUES 	('HL24X0','Avengers'),
			('KP42C5','Defenders'),
			('OS85X5','Fantastic Four'),
			('OM65X6','Great Lake Avengers'),
			('JY58F0','West Coast Avengers'),
			('YQ89Q0','Young Avengers'),
			('FS38V4','Nova Corps'),
			('SM22Z6','Runaways'),
			('SS38K0','S.H.I.E.L.D.'),
            ('HX79R3','Thunderbolts');

-- Address --
INSERT INTO Addresses(AddressID, Street, City, Zip)
	VALUES 	('JA73J3','123 Main St','New York','10001'),
			('ER59D1','404 S Blvd','Chicago','60290'),
			('MH18I7','1270 Home Ln','New York','10001'),
			('DN14D7','261 6th St.','New York','10002'),
			('ZM55R6','100 Hollywood Blvd','Los Angeles','33019'),
			('AS71D8','4521 Guadalupe Dr.','Austin','73301');

-- Location --
INSERT INTO Location(LocID, MHID, StateID, AddressID, TeamID)
	VALUES 	('ZD23H5','EL67O1','NY','JA73J3','HL24X0'),
			('TW14M1','RK50N5','NY','JA73J3','HL24X0'),
			('BS18E3','QB75Q3','NY','JA73J3','KP42C5'),
			('YZ20J0','HK72U4','NY','MH18I7','OS85X5'),
			('KQ76M2','YZ94L4','NY','DN14D7','YQ89Q0'),
			('KT48N2','YW46P5','CA','ZM55R6','SM22Z6'),
			('KA67G7','IZ27J0','NY','MH18I7','OS85X5'),
			('RB95L5','ZP84Q6','NY','JA73J3','FS38V4'),
            ('JC51P7','KA67G7','CA',  NULL,  'HX79R3');
			
-- Event Names --
INSERT INTO EventNames(EventID, EventName)
	VALUES	('AF85F1','Civil War'),
			('NS30H6','House of M'),
			('IE98H4','World War Hulk');

-- Events --
INSERT INTO Events(EventID, MHID)
	VALUES	('AF85F1','EL67O1'),
			('AF85F1','RK50N5'),
			('AF85F1','HK72U4'),
			('IE98H4','QB75Q3');

-- Registration -- 
INSERT INTO Registration(RegId,MHID)
    VALUES  ('DN14D7','RK50N5'),
            ('KT48N2','IZ27J0'),
            ('SM22Z6','UR31O5'),
			('NE89G7','KA67G7');

-- Activity -- 
INSERT INTO activity(MHID,activestat)
    VALUES  ('EL67O1','Active'),
            ('RK50N5','Active'),
            ('QB75Q3','Missing'),
            ('HK72U4','Active'),
            ('YZ94L4','Deceased'),
            ('YW46P5','Deceased'),
            ('IZ27J0','Inactive'),
            ('ZP84Q6','Deceased'),
            ('UC99L9','Active'),
            ('UR31O5','Inactive'),
            ('LL12G7','Deceased'),
            ('KA67G7','Active');

-- Criminal --
Insert INTO convicted (PrisonerID, MHID)
    VALUES  ('JZ97G4','KA67G7');
	
-- View to find Basic information about a meta such as First Name, Last Name, Alias, Power, Power Level, and origin.
-- Sorted by MHID
Create view AccessMetaData As
Select m.mhid, m.alias, m.fname, m.lname, t.typeclass, o.originclass, l.powerclass
From metahumans m 
	inner join abilities a on m.MHID = a.MHID
	inner join types t on a.typeId = t.typeId
    inner join origins o on a.originId = o.originId
    inner join levels l on a.plid = l.plid
order by MHID asc;

-- A view to find Metas with a Criminal Record currently active and working in the Fifty State Initiative
-- Sorted by MHID
Create view ConvictCatalog AS
Select m.mhid,m.alias
From metahumans m 
	inner join registration r on m.MHID = r.MHID
	inner join convicted cr on m.MHID = cr.MHID
	inner join location l on m.MHID = l.MHID
	inner join teams t on l.teamid = t.teamid
order by MHID asc;

-- Catalog the numbered of various powered indivduals that are currently active
Create view PowerInventory AS
Select Count(t.typeID), t.typeclass, o.originclass
From abilities a
    inner join types t on a.typeId = t.typeId
    inner join origins o on a.originId = o.originId
	inner join activity ac on a.MHID = ac.MHID
WHERE ac.activestat = 'Active'
Group by t.typeclass, o.originclass;

-- Function that allows the searching for Metas with specific origins, can be converted to search for metas with specific powers --
-- Useful for locating Mutants, Aliens, Bio-engineered metas, and any other meta that has 'abilities' not derived from tech or skill --
CREATE OR REPLACE FUNCTION locateMetaorigin (ans text) 
Returns Table ("Alias" text, "State" text, "Ability" text) AS $$ 
BEGIN
Return QUERY
Select m.alias , st.stateName, t.typeclass
From metahumans m 
	inner join abilities a on m.MHID = a.MHID
	inner join types t on a.typeId = t.typeId
    inner join origins o on a.originId = o.originId
    inner join location l on m.MHID = l.MHID
    inner join states st on l.StateID = st.stateID
Where o.originclass = ans;
END;
$$ LANGUAGE plpgsql;

-- Function that allows the searching for Metas with specific powers, can be converted to search for metas with specific origins --
-- Useful for locating metas with specific abilities such as Flight, Laser Vision, Enhanced Strength, etc. --
CREATE OR REPLACE FUNCTION locateMetaAbility (ans text) 
Returns Table ("Alias" text, "State" text, "origin" text) AS $$ 
BEGIN
Return QUERY
Select m.alias , st.stateName, o.originclass
From metahumans m 
	inner join abilities a on m.MHID = a.MHID
	inner join types t on a.typeId = t.typeId
    inner join origins o on a.originId = o.originId
    inner join location l on m.MHID = l.MHID
    inner join states st on l.StateID = st.stateID
Where t.typeclass = ans;
END;
$$ LANGUAGE plpgsql;

REVOKE ALL on abilities FROM PUBLIC;
REVOKE ALL on levels FROM PUBLIC;
REVOKE ALL on origins FROM PUBLIC;
REVOKE ALL on types FROM PUBLIC;
REVOKE ALL on registration FROM PUBLIC;
REVOKE ALL on activity FROM PUBLIC;
REVOKE ALL on location FROM PUBLIC;
REVOKE ALL on states FROM PUBLIC;
REVOKE ALL on addresses FROM PUBLIC;
REVOKE ALL on events FROM PUBLIC;
REVOKE ALL on eventNames FROM PUBLIC;
REVOKE ALL on teams FROM PUBLIC;
REVOKE ALL on convicted FROM PUBLIC;
REVOKE ALL on metahumans FROM PUBLIC;

-- Level Five Agents --
GRANT SELECT ON metahumans TO LevelFive;

-- Level Six Agents -- 
GRANT SELECT ON metahumans TO LevelSix;
GRANT SELECT ON abilities  TO LevelSix;
GRANT SELECT ON types TO LevelSix;


-- Level Seven Agents --
GRANT SELECT ON metahumans TO LevelSeven;
GRANT SELECT ON abilities  TO LevelSeven;
GRANT SELECT ON types TO LevelSeven;
GRANT SELECT ON origins TO LevelSeven;
GRANT SELECT ON location TO LevelSeven;
GRANT SELECT ON states TO LevelSeven;
GRANT SELECT ON teams TO LevelSeven;

-- Level Eight
GRANT SELECT ON metahumans TO LevelEight;
GRANT SELECT ON abilities  TO LevelEight;
GRANT SELECT ON types TO LevelEight;
GRANT SELECT ON origins TO LevelEight;
GRANT SELECT ON location TO LevelEight;
GRANT SELECT ON states TO LevelEight;
GRANT SELECT ON teams TO LevelEight;
GRANT SELECT ON addresses TO LevelEight;

-- Level Nine --
GRANT SELECT,INSERT,UPDATE ON metahumans TO LevelEight;
GRANT SELECT ON abilities  TO LevelEight;
GRANT SELECT ON types TO LevelEight;
GRANT SELECT ON origins TO LevelEight;
GRANT SELECT ON location TO LevelEight;
GRANT SELECT ON states TO LevelEight;
GRANT SELECT ON teams TO LevelEight;
GRANT SELECT ON addresses TO LevelEight;

-- Level Ten --
GRANT ALL on ALL TABLES IN SCHEMA PUBLIC TO LevelTen;