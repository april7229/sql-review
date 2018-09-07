# sql review - writing the database for slack
  1. Write CREATE TABLE statements for tables 
    * [ ] organization, channel, user, and message.
    * [ ] users should have these columns, id, name, username, created, updated 
    * [ ] organization should have these columns id, name, created
    * [ ] channel should have id, name, organization_id,  created, updated 
    * [ ] messages should have these columns, id, content, user_id, channel_id
    * [ ] Add foreign keys needed to some of the tables.
    * [ ] Join tables - user_channel
    
  2. Write INSERT queries to add information to the databases.
    * [ ] 15 users, some of the users are Ironman, Spiderman, Thor, Superman....
    * [ ] 3 organizations, Lambda School, Shield, Avengers, 
    * [ ] 4 channels, #general, #random, #CS10, #Labs7
   
  3. Make some SELECT queries to 
    * [ ] List all organization names.
    * [ ] List all channel names.
    * [ ] List all channels in a specific organization by organization name.
    * [ ] List all messages in a specific channel by channel name #general in order of post_time, descending.
    * [ ] List all channels to which user Superman belongs.
    * [ ] List all users that belong to channel #avengers.
    * [ ] List all messages in all channels by user Ironman.
    * [ ] List all messages in #avengers by user Thor.
    * [ ] List the count of messages across all channels per user.
