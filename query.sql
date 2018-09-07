
-- Organization table --
CREATE TABLE organization (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name VARCHAR
(64) NOT NULL UNIQUE,
  created TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- user --
CREATE TABLE user (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name VARCHAR
(64) NOT NULL UNIQUE,
  username VARCHAR
(32) NOT NULL UNIQUE,
  created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- channel --
CREATE TABLE channel (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name VARCHAR
(64) NOT NULL UNIQUE,
  organization_id INTEGER REFERENCES organization
(id),
  created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- message --
CREATE TABLE message (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  content TEXT,
  user_id INTEGER REFERENCES user
(id),
  channel_id INTEGER REFERENCES channel
(id),
  created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- user_channel --
CREATE TABLE user_channel
(
  user_id INTEGER REFERENCES user(id),
  channel_id INTEGER REFERENCES channel(id)
);

-- start putting in the data into the database --
-- users --
INSERT INTO user
  (name, username)
VALUES("Brandon", "hopperb");

INSERT INTO user
  (name, username)
VALUES("Bunthoeun", "b");

INSERT INTO user
  (name, username)
VALUES("Iqra", "ij");

INSERT INTO user
  (name, username)
VALUES("Amy", "crazycatlady");

INSERT INTO user
  (name, username)
VALUES("April", "agm");

INSERT INTO user
  (name, username)
VALUES("Derrick", "dotsing");

INSERT INTO user
  (name, username)
VALUES("Dante", "dantecuales");

INSERT INTO user
  (name, username)
VALUES("Ironman", "tony");

INSERT INTO user
  (name, username)
VALUES("Spiderman", "parker");

INSERT INTO user
  (name, username)
VALUES("Thor", "god");

INSERT INTO user
  (name, username)
VALUES("Viper", "misshydra");

INSERT INTO user
  (name, username)
VALUES("Storm", "water");

-- organizations --
INSERT INTO organization
  (name)
VALUES("Lambda School");

INSERT INTO organization
  (name)
VALUES("Avengers");

INSERT INTO organization
  (name)
VALUES("X-Men");

INSERT INTO organization
  (name)
VALUES("Hydra");

INSERT INTO organization
  (name)
VALUES("Shield");

-- channels --
INSERT INTO channel
  (name, organization_id)
VALUES("#general", 1);

INSERT INTO channel
  (name, organization_id)
VALUES("#random", 4);

INSERT INTO channel
  (name, organization_id)
VALUES("#cs10", 2);

INSERT INTO channel
  (name, organization_id)
VALUES("#labs", 3);

INSERT INTO channel
  (name, organization_id)
VALUES("#after-hours", 5);

-- messages --
INSERT INTO message
  (content, user_id, channel_id)
VALUES("I'M THE KING OF THE WORLD", 1, 5);

INSERT INTO message
  (content, user_id, channel_id)
VALUES("OH, you did an actual query.  That’s awesome lol", 3, 4);

INSERT INTO message
  (content, user_id, channel_id)
VALUES("Cats are cool.", 2, 3);

INSERT INTO message
  (content, user_id, channel_id)
VALUES("So many repos.", 6, 5);

INSERT INTO message
  (content, user_id, channel_id)
VALUES("Don't worry guys.", 5, 2);

INSERT INTO message
  (content, user_id, channel_id)
VALUES("Why do I type so slow?", 7, 4);

INSERT INTO message
  (content, user_id, channel_id)
VALUES("Two hours of sleep is rough.", 4, 1);

INSERT INTO message
  (content, user_id, channel_id)
VALUES("What's the repo for today?", 2, 5);

INSERT INTO message
  (content, user_id, channel_id)
VALUES("Can you make a PR request please", 8, 3);

INSERT INTO message
  (content, user_id, channel_id)
VALUES("Do you think I will graduate?", 9, 4);

INSERT INTO message
  (content, user_id, channel_id)
VALUES("Are we doing #after-hours?", 10, 2);

INSERT INTO message
  (content, user_id, channel_id)
VALUES("Don’t forget to put your name on your pull request.", 11, 3);

INSERT INTO message
  (content, user_id, channel_id)
VALUES("Please take a moment to reflect upon your day and fill out your Daily Standup report: https:\/\/airtable.com\/shr8ZYuNjevMLRsxI", 1, 2);

-- user_channels --
INSERT INTO user_channel
  (user_id, channel_id)
VALUES(9, 2);

INSERT INTO user_channel
  (user_id, channel_id)
VALUES(4, 1);

-- select organization names only --
/*
SELECT name AS COOL
from organization;
*/
SELECT name
from organization

-- select channel names only --
SELECT name
from channel


--  List all channels in a specific organization by organization name.--
/*
SELECT channel.name AS "Channel Name"
FROM channel, organization
WHERE channel.organization_id = organization.id AND
  organization.name = "Lambda School";
*/

SELECT channel.name
FROM channel, organization
WHERE organization_id = organization.id
  AND organization.name = "Lambda School";


-- refactored from above --
-- when two tables have the same column names, 
-- we have to specify the table we are querying from ---
SELECT channel.name
FROM channel, organization
WHERE organization_id = organization.id
  AND organization.name = "Lambda School";

-- List all messages from specific--
/*
SELECT content
FROM message AS
"GENERAL MESSAGES" WHERE channel_id IS
(SELECT id
FROM channel
WHERE name IS '#general')
ORDER BY created DESC;
*/
SELECT content
FROM message, channel
WHERE channel_id = channel.id
  AND channel.name = "#general"
ORDER BY created DESC;

-- List all channels ironman belongs to --
/*
SELECT c.name AS "SUPERMANS CHANNEL", c.id AS "CHANNEL ID"
FROM channel AS c INNER JOIN user_channel AS uc
  ON c.id
IS uc.channel_id INNER JOIN user AS u ON u.id IS uc.user_id 
WHERE u.name IS "Ironman";
*/
-- List all channels ironman belongs to  refactored --
/*
SELECT channel.name as "Ironman Channels"
FROM channel INNER JOIN user_channel
  ON channel.id
IS user_channel.channel_id INNER JOIN user ON user.id IS user_channel.user_id
AND user.name = "Ironman";
*/
SELECT chennel.name
FROM users, channel, user_channel
WHERE user.id = user_id
  AND channel.id = channel_id
  AND user.name  = "Ironman";

-- List all users that belong to channel #general --
/*
SELECT user.name
FROM user
  INNER JOIN user_channel
  ON user.id
IS user_channel.user_id 
INNER JOIN channel 
ON user_channel.channel_id IS channel.id 
WHERE channel.name IS "#general";
*/
SELECT user.name
FROM user, channel, user_channel
WHERE user.id = user_id
  AND channel.id = channel_id
  AND channel.name = "#general";

-- List all messages by ironman from all channels--
/*
SELECT content
FROM message
  INNER JOIN user
  ON message.user_id
IS user.id
WHERE user.name IS "Ironman";
*/
SELECT content
FROM message, user
WHERE user_id = user.id
  AND user.name = "Ironman";

-- List all messages in #general by ironman --
/*
SELECT content
FROM message
WHERE channel_id
IS
(
  SELECT id
FROM channel
WHERE name is "#general"
)
AND user_id IS
(
  SELECT id
FROM user
WHERE name is "Iqra"
);
*/

SELECT content
FROM message, channel, user
WHERE user_id = user.id
  AND channel_id = channel.id
  AND channel.name = "#general"
  AND user.name = "Iqra";

-- counting the number of messages a user has written --
/*
SELECT COUNT(user.id) AS "MESSAGE COUNT", user.name AS "Name"
FROM message
  INNER JOIN user
  ON message.user_id
IS user.id 
INNER JOIN channel 
WHERE message.channel_id IS channel.id 
GROUP BY user.id;
*/
SELECT user.name AS "User Name", COUNT(*) AS "Message Count"
FROM user, message
WHERE user_id = user.id
GROUP BY user.id
ORDER BY user.name DESC;

-- shows the channels also --
SELECT user.name AS "User", channel.name AS "Channel", COUNT(*)
AS "Message Count"
FROM user, message, channel
WHERE user_id = user.id
  AND channel_id = channel.id
GROUP BY channel.name, user.name  