# instaDB-Python-
***Instadb is the mini instagram. Which Stores information as following :***
* user - This table contains following attributes.
  * user_id - Primary Key
  * username
  * user_email
  * number_of_liked_pictures
  * First name
  * Last name
* pictures
  * picture_id - Primary Key
  * picture_path
  * date_of_posting
  * picture_caption
  * Number_of_likes
* likes
  * user_id - Foreign Key
  * picture_id - Foreign Key
* pictures_posted
  * user_id - Foreign Key
  * picture_id - Foreign Key
* Tags
  * Tag_id - Primary Key
  * Tag_name
* pictures_tag
  * picture_id - Foreign Key
  * tag_id - Foreign Key
### Description :
The Python Program should connect to InstaDB and allow the user to perform given queries. ***The data needs to be pulled from multiple tables using SQL queries and logic needs to be written in Python program to join the result from those queries to get the desired result.***
### What needs to be done:
* Write a Python program that connects to database created in InstaDB project
* Program should show menu based choices from 1 to 8 for each of the given queries and execute the query based on user’s choice:
  * Max Likes
  *  Min Likes
  * Who liked most
  * Music pictures
  * Popular Tag
  * Most liked User
  * Old Tagging
  * Delete Inactive Users
* After displaying results of a query in console window, main menu should appear again and prompt for user’s choice
### Queries :
* Max Likes - Which of my pictures (picture ids) has received maximum likes?
* Min Likes - Which of my pictures (picture ids) has received minimum likes?
* Who liked most - Who (user id) has liked my pictures most?
* Music pictures - Show all pictures related to music.
* Popular Tag - What is the name of most popular tag?
* Most liked User - Whose pictures (user id) have been liked most?
* Old Tagging - Tag my pictures older than 3 years “Old”
* Delete Inactive Users - Delete inactive users i.e. who have not done activity for past 1 year
