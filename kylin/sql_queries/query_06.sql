SELECT
  SUM(LO_REVENUE) AS LO_REVENUE, LO_ORDERDATEYEARLEVEL, LO_PARTKEYBRAND1LEVEL
FROM FACTS
INNER JOIN LO_ORDERDATE ON (FACTS.LO_ORDERDATE = LO_ORDERDATE.KEY)
INNER JOIN LO_PARTKEY ON (FACTS.LO_PARTKEY = LO_PARTKEY.KEY)
INNER JOIN LO_SUPPKEY ON (FACTS.LO_SUPPKEY = LO_SUPPKEY.KEY)
WHERE
  LO_PARTKEYBRAND1LEVEL = '<http://lod2.eu/schemas/rdfh#lo_partkeyBrand1MFGR-2239>'
  AND LO_SUPPKEYREGIONLEVEL = '<http://lod2.eu/schemas/rdfh#lo_suppkeyRegionEUROPE>'
GROUP BY
  LO_ORDERDATEYEARLEVEL, LO_PARTKEYBRAND1LEVEL
ORDER BY
  LO_ORDERDATEYEARLEVEL, LO_PARTKEYBRAND1LEVEL