-- Metahumans --
INSERT INTO METAHUMANS( MHID, alias, fName, lName)
	VALUES	('EL67O1', 'Captain America', 'Steven', 'Rogers'),
			('RK50N5', 'Iron Man', 'Anthony', 'Stark'),
			('QB75Q3', 'Hulk, The', 'Bruce', 'Banner'),
			('HK72U4', 'Thing, The', 'Benjamin', 'Grimm');

-- Types --
INSERT INTO TYPES (TypeID, TypeClass)
	VALUES 	('AL73X7','Peak Physical Condition'),
			('ZD72B3','Advance Mechanical Armor'),
			('BA16S4','Gamma Mutate'),
			('EC12Z6','Rock-Based Natural Armor');

-- Orgins --
INSERT INTO ORGINS (OrginID,OrginClass)
	VALUES 	('MX73W1','Super Soldier Serum'),
			('RP41W1','Technological Innovation'),
			('SS67W3','Radiation Accident'),
			('NS30H6','Cosmic Rays');

-- Levels --
INSERT INTO LEVELS (PLID, PowerClass)
	VALUES 	('TW31J8','Omega'),
			('VV51H8','Alpha'),
			('BZ54I1','Beta'),
			('AM41K2','Delta'),
			('FF37F0','Gamme');

-- Abilities --
INSERT INTO ABILITIES(AbilityID, MHID, OrginID, TypeID, PLID)
	VALUES 	('CM77S8','EL67O1','MX73W1','AL73X7','VV51H8'),
			('HP82T9','RK50N5','RP41W1','ZD72B3','VV51H8'),
			('EN58A5','QB75Q3','SS67W3','BA16S4','VV51H8'),
			('ZQ76N8','HK72U4','NS30H6','EC12Z6','BZ54I1');
	
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
			('YQ89Q0','Young Avengers');

-- Address --
INSERT INTO Addresses(AddressID, Street, City, Zip)
	VALUES 	('JA73J3','123 Main St','New York','10001'),
			('ER59D1','404 S Blvd','Chicago','60290'),
			('MH18I7','1270 Home Ln','New York','10001');

-- Location --
INSERT INTO Location(LocID, MHID, StateID, AddressID, TeamID)
	VALUES 	('ZD23H5','EL67O1','NY','JA73J3','HL24X0'),
			('TW14M1','RK50N5','NY','JA73J3','HL24X0'),
			('BS18E3','QB75Q3','NY','JA73J3','KP42C5'),
			('YZ20J0','HK72U4','NY','MH18I7','OS85X5');
			
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
