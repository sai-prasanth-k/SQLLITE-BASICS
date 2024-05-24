-- Get the average of all the scores from the player_match_details table.

SELECT
  AVG(score)
FROM
  player_match_details;

-- Find the average score of "Joseph" in the year 2012 from theplayer_match_detailstable.

SELECT
  AVG(score)
FROM
  player_match_details
WHERE
  name = "Joseph"
  AND year = 2012;

-- Get the total runs scored by "Ram" from theplayer_match_detailstable.

SELECT
  SUM(score)
FROM
  player_match_details
WHERE
  name = "Ram";

-- Given theplayer_match_detailstable, get the maximum number of sixes scored by a player in the year 2011. 

SELECT
  MAX(sixes)
FROM
  player_match_details
WHERE
  year = 2011;

-- Calculate the total number of players inplayer_match_detailstable.
-- Note: No two players have the same name

SELECT
  COUNT(DISTINCT(name))
FROM
  player_match_details;

-- Select the year when "Shyam" made a debut.

SELECT
  year
FROM
  player_match_details
WHERE
  name = "Shyam"
ORDER BY
  year ASC
LIMIT
  1;

-- Find the number of matches where "Lokesh" scored at least half-century from theplayer_match_detailstable.

SELECT
  COUNT(MATCH)
FROM
  player_match_details
WHERE
  name = "Lokesh"
  AND score >= 50;

-- Get the highest score and the lowest scores scored by "Joseph" in his career.

SELECT
  MAX(score),
  MIN(score)
FROM
  player_match_details
WHERE
  name = "Joseph";

