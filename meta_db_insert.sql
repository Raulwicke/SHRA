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

-- Orgins --
INSERT INTO ORGINS (OrginID,OrginClass)
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
INSERT INTO ABILITIES(AbilityID, MHID, OrginID, TypeID, PLID)
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
            ('SM22Z6','UR31O5');

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
            
            
            