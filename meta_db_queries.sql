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

Select count(l.MHID) as "Population", a.City, st.StateName
From location l 
	inner join addresses a on l.addressID = a.addressID
    inner join states st on l.StateID = st.StateID
Group by a.City, st.StateName


----- Select Statements for Queries ------
Select * 
from locateMetaorigin('Super Soldier Serum');

Select *
From locateMetaAbility('Peak Physical Condition');

Select *
From AccessMetaData;

Select *
From PowerInventory;

Select *
From ConvictCatalog;