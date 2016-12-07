
-- View to find Basic information about a meta such as First Name, Last Name, Alias, Power, Power Level, and Orgin.
-- Sorted by MHID
Create view AccessMetaData As
Select m.mhid, m.alias, m.fname, m.lname, t.typeclass, o.orginclass, l.powerclass
From metahumans m 
	inner join abilities a on m.MHID = a.MHID
	inner join types t on a.typeId = t.typeId
    inner join orgins o on a.orginId = o.orginId
    inner join levels l on a.plid = l.plid
order by MHID asc

-- A view to find Metas with a Criminal Record currently active and working in the Fifty State Initiative
-- Sorted by MHID
Create view ConvictCatalog AS
Select m.mhid,m.alias
From metahumans m 
	inner join registration r on m.MHID = r.MHID
	inner join criminal_record cr on m.MHID = cr.MHID
	inner join location l on m.MHID = l.MHID
	inner join teams t on l.teamid = t.teamid
order by MHID asc;

