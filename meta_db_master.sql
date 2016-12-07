
DROP TABLE IF EXISTS abilities;
DROP TYPE  IF EXISTS actstat;
DROP TABLE IF EXISTS levels;
DROP TABLE IF EXISTS orgins;
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

-- Ability orgins --
-- Orgin of Ability {Tech, Mutant, Inhuman, Bio-Advancement}
CREATE TABLE ORGINS(
	OrginID TEXT,
	OrginClass TEXT NOT NULL,
	PRIMARY KEY (OrginID)
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
	OrginID		TEXT REFERENCES orgins(OrginID),
	TypeID		TEXT REFERENCES types(TypeID),
	PLID		TEXT REFERENCES levels (PLID),
	PRIMARY KEY (AbilityID)
);

-- Activity --
-- What the level of Activeness a Meta is {Inactive, Active, Retired, Deceased, Missing} --
CREATE TABLE activity(
	MHID 		TEXT REFERENCES metahumans(MHID),
    ActiveStat 	TEXT,
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


DROP TABLE IF EXISTS abilities;
DROP TYPE  IF EXISTS actstat;
DROP TABLE IF EXISTS levels;
DROP TABLE IF EXISTS orgins;
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

-- Ability orgins --
-- Orgin of Ability {Tech, Mutant, Inhuman, Bio-Advancement}
CREATE TABLE ORGINS(
	OrginID TEXT,
	OrginClass TEXT NOT NULL,
	PRIMARY KEY (OrginID)
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
	OrginID		TEXT REFERENCES orgins(OrginID),
	TypeID		TEXT REFERENCES types(TypeID),
	PLID		TEXT REFERENCES levels (PLID),
	PRIMARY KEY (AbilityID)
);

-- Activity --
-- What the level of Activeness a Meta is {Inactive, Active, Retired, Deceased, Missing} --
CREATE TABLE activity(
	MHID 		TEXT REFERENCES metahumans(MHID),
    ActiveStat 	TEXT,
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