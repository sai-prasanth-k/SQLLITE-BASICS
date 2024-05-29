-- Calculate overall number of boundaries scored by each batsmen in the tournament
-- number of boundaries = fours + sixes
-- Note: Output must contain rows in the descending order ofnumber_of_boundaries and name

SELECT
  name,
  SUM(fours + sixes) AS number_of_boundaries
FROM
  player
GROUP BY
  name
ORDER BY
  number_of_boundaries DESC;

-- Get the highest score of each player who played in the year 2006
-- Note: Output must contain rows in the descending order ofhighest_score

SELECT
  name,
  MAX(score) AS highest_score
FROM
  player
WHERE
  strftime("%Y", match_date) = '2006'
GROUP BY
  name
ORDER BY
  highest_score DESC


-- Calculate the strike rate of all the players in every match.
-- strike_rate = (score of the player / no_of_balls)*100
-- Note: Strike rate in the output should be a float value.
-- In SQL, when an integer is divided by another integer, it results in another integer value, i.e, 3/2 = 1 which is an integer 
-- instead of 1.5 which is of float type. So we need to convert either the numerator or denominator to float to get more
-- accurateresults, i.e 3.0/2 or 3/2.0, to get 1.5 as output.
-- Let's apply the same while calculating the strike_rate to get accurate results.

SELECT
  name,
  MATCH,
  (CAST (score AS FLOAT) / no_of_balls * 100) AS strike_rate
FROM
  player
ORDER BY
  strike_rate DESC;


-- Let's generate a performance report for all the players who played in the year 2006.
-- Apply the below logic to grade the player's performance.

-- total score performance report
-- >= 150        GOOD
-- 100<= <150    AVERAGE
-- <100  BELOW   AVERAGE
--  in the year 2006
-- Note: Output must be in the descending order of total_score

SELECT
  name,
  SUM(score) AS total_score,
  CASE
    WHEN SUM(score) >= 150 THEN "GOOD"
    WHEN SUM(score) BETWEEN 100
    AND 149 THEN "AVERAGE"
    ELSE "BELOW AVERAGE"
  END AS badge
FROM
  player
WHERE
  strftime("%Y", match_date) = '2006'
GROUP BY
  name
ORDER BY
  total_score DESC;

-- For each player, get the number of matches in which their strike rate is less than 80.0, and the number of matches with strike rate greater than or equal to 80.0.
-- Note: Output must be in the ascending order of name
SELECT
  name,
  COUNT (
    CASE
      WHEN (CAST(score AS FLOAT) * 100 / no_of_balls) < 80 THEN 1
      ELSE NULL
    END
  ) AS strike_rate_less_than_80,
  COUNT (
    CASE
      WHEN (CAST(score AS FLOAT) * 100 / no_of_balls) >= 80 THEN 1
      ELSE NULL
    END
  ) AS strike_rate_greater_than_or_equal_to_80
FROM
  player
GROUP BY
  name;