-- Get all the videos with more than 1 lakh views.
-- Note:
-- Output must be in the alphabetical order of videoname

SELECT
  *
FROM
  video
WHERE
  no_of_views > 100000
ORDER BY
  name ASC;


-- Get videos from TEDx channel (id=353) with more than 50 thousand views.
-- Note:
-- Sort the output in the descending order ofno_of_viewsand in the ascending order of videoname

SELECT
  video_id,
  name,
  duration_in_secs,
  no_of_views
FROM
  video
WHERE
  channel_id = 353
  AND no_of_views > 50000
ORDER BY
  no_of_views DESC,
  name;


-- Get the top 10 most viewed videos till date.
-- Note:
-- Sort the videos by no_of_views from highest to lowest. For videos with the same number of views, order them by published_datetime, with the most recent video first.

SELECT
  name,
  channel_id,
  no_of_views
FROM
  video
ORDER BY
  no_of_views DESC,
  published_datetime DESC
LIMIT
  10;


-- Get all the recent movie trailers that have more than 1 lakh views.
-- Note:
-- Consider the videos that have "trailer" in theirnameas trailers.
-- Sort the output in the descending order ofno_of_viewsandpublished_datetime

SELECT
  name,
  channel_id,
  no_of_views,
  published_datetime
FROM
  video
WHERE
  name LIKE "%trailer%"
  AND no_of_views > 100000
ORDER BY
  no_of_views DESC,
  published_datetime DESC;


-- Get all the videos that are released in the year 2018. 
-- Note:
-- Sort the output in the descending order ofpublished_datetimeand then in the alphabetical order ofname

SELECT
  video_id,
  name,
  duration_in_secs,
  no_of_views
FROM
  video
WHERE
  strftime("%Y", published_datetime) = "2018"
ORDER BY
  published_datetime DESC,
  name ASC;

-- Get the distinct ids of videos that belong to the following genres.
-- genre_id| genre
-- 201     |  Comedy
-- 202     |  Action
-- 203     |  Thriller
-- 211     |  Scifi
-- Note:
-- Sort the output in the descending order ofvideo_id
SELECT
  DISTINCT video_id
FROM
  video_genre
WHERE
  genre_id IN (201, 202, 203, 211)
ORDER BY
  video_id DESC;

-- Get all the esport videos that crossed one lakh views and were released between 2018 and 2020.
-- Note:
-- Consider the videos that have "esport" in theirname as gaming videos.
-- Sort the output in the descending order ofno_of_viewsandpublished_datetime

SELECT
  name,
  published_datetime,
  no_of_views
FROM
  video
WHERE
  (name LIKE "%esport%")
  AND (no_of_views > 100000)
  AND (
    strftime("%Y", published_datetime) BETWEEN "2018"
    AND "2020"
  )
ORDER BY
  no_of_views DESC,
  published_datetime DESC

-- Get the total number of channels in the database aschannels_count
SELECT
  COUNT(channel_id) AS channels_count
FROM
  channel;

-- Get the highest and least number of views for the videos in the database.

SELECT
  MAX(no_of_views) AS highest_number_of_views,
  MIN(no_of_views) AS least_number_of_views
FROM
  video;

-- Get the average number of views for the videos released by the "Single Shot" Channel (id = 373)

SELECT
  AVG(no_of_views) AS avg_views
FROM
  video
WHERE
  channel_id = 373;

-- Get the total count of premium users on the platform as premium_users_count.
-- Note - Consider those users as premium which has 1 in premium_membership column.

SELECT
  COUNT(
    CASE
      WHEN premium_membership = 1 THEN 1
      ELSE NULL
    END
  ) AS premium_users_count
FROM
  user;

-- Get the number of male and female premium users in the platform.

SELECT
  DISTINCT (gender),
  COUNT(gender) AS total_users
FROM
  user
WHERE
  premium_membership = 1
GROUP BY
  gender

-- Get the total number of users in the platform as users_count.
-- Note: Use USER Table to fetch the data.

SELECT
  COUNT(user_id) AS users_count
FROM
  user;

-- Get the total number of distinct countries where the users are located. Country of the user is present in theusertable

SELECT
  COUNT(DISTINCT(country)) AS countries_count
FROM
  user;


-- Get the number of videos uploaded by each channel.

SELECT
  channel_id,
  COUNT(video_id) AS videos_count
FROM
  video
GROUP BY
  channel_id;

-- Get the ids of all the channels that have uploaded at least 50 videos.
-- Note:
-- Sort the output in the ascending order of thechannel_id

SELECT
  channel_id
FROM
  video
GROUP BY
  channel_id
HAVING
  COUNT(name) >= 50
ORDER BY
  channel_id;


-- 

