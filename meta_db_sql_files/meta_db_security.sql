CREATE ROLE LevelFive;
CREATE ROLE LeveSix;
CREATE ROLE LevelSeven;
CREATE ROLE LevelEight;
CREATE ROLE LevelNine;
CREATE ROLE LevelTen;

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