-- a SQL script that ranks country origins of bands from the table metal_bands, 
-- ordered by the nnb_fansumber of (non-unique) fans
SELECT origin, SUM(fans) AS nb_fans
FROM metal_bands
GROUP BY origin
ORDER BY nb_fans DESC;
