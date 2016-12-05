Select m.mhid, m.alias, m.fname, m.lname, t.typeclass, o.orginclass, l.powerclass, te.TeamName
From metahumans m 
	inner join abilities a on m.MHID = a.MHID
	inner join types t on a.typeId = t.typeId
    inner join orgins o on a.orginId = o.orginId
    inner join levels l on a.plid = l.plid
	inner join location lo on lo.MHID = m.MHID
	inner join teams te on te.TeamID = lo.TeamID
-- where t.typeclass = 'Peak Physical Condition';
order by alias asc