
--1st way

   WITH Days AS (
    SELECT 1 AS N
    UNION ALL
    SELECT N + 1 FROM Days WHERE N < 40
),
FilledData AS (
    SELECT d.N, ISNULL(s.Num, 0) AS Num
    FROM Days d
    LEFT JOIN Shipments s ON d.N = s.N
)
SELECT
(
 (SELECT MAX(Num) FROM
   (SELECT TOP 50 PERCENT Num FROM FilledData ORDER BY Num) AS BottomHalf)
 +
 (SELECT MIN(Num) FROM
   (SELECT TOP 50 PERCENT Num FROM FilledData ORDER BY Num DESC) AS TopHalf)
) / 2 AS Median

--another way, more robust

WITH Days AS (
    SELECT 1 AS N
    UNION ALL
    SELECT N + 1 FROM Days WHERE N < 40
),
FilledData AS (
    SELECT d.N, ISNULL(s.Num, 0) AS Num
    FROM Days d
    LEFT JOIN Shipments s ON d.N = s.N
),
Ordered AS (
    SELECT Num, ROW_NUMBER() OVER (ORDER BY Num) AS rn
    FROM FilledData
),
Counted AS (
    SELECT COUNT(*) AS total FROM FilledData
)
SELECT AVG(Num * 1.0) AS Median
FROM Ordered, Counted
WHERE rn IN ((total + 1) / 2, (total + 2) / 2);  -- Picks 20 and 21 for 40 rows

