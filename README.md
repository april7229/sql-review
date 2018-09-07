# sql review - writing the database for slack
  1. Write CREATE TABLE statements for tables 
  * [x] organization, channel, user, and message.
  * [x] users should have these columns, id, name, username, created, updated 
  * [x] organization should have these columns id, name, created
  * [x] channel should have id, name, organization_id,  created, updated 
  * [x] messages should have these columns, id, content, user_id, channel_id, created, updated
  * [x] Add foreign keys needed to some of the tables.
  * [x] Join tables - user_channel
    
  2. Write INSERT queries to add information to the databases.
  * [x] 13 users, some of the users are Ironman, Spiderman, Thor, Superman, Viper, Storm....
  * [x] 3 organizations, Lambda School, Shield, Avengers, Hydra, X-men
  * [x] 4 channels, #general, #random, #CS10, #Labs7,
  * [x] 13 messages
   
  3. Make some SELECT queries to 
  * [x] List all organization names.
  * [x] List all channel names.
  * [x] List all channels in a specific organization by organization name.
  * [x] List all messages in a specific channel by channel name #general in order of post_time, descending.
  * [x] List all channels to which user Ironman belongs.
  * [x] List all users that belong to channel #general.
  * [x] List all messages in all channels by user Ironman.
  * [x] List all messages in #general by user Ironman.
  * [x] List the count of messages across all channels per user.
