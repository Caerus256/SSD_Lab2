=========================================================================================================================================
						Lab2 Work problem: TV Shows Database Procedures
=========================================================================================================================================

This project contains SQL scripts that define stored procedures for working with a sample TV shows database.  
The scripts must be executed in sequence to properly set up and test the procedures.

Repository Link: https://github.com/Caerus256/SSD_Lab2

---------------------------------------
	Steps to Execute
---------------------------------------

  1. Setup MySQL, Database and Tables :
  -----------------------------------

   - First, log in to MySQL:
      mysql -u <username> -p

   - Then create and switch to the database:
      CREATE DATABASE tv_shows;
      USE tv_shows;

  2. Create Required tables (Shows, Subscribers, WatchHistory) :
  -------------------------------------------------------------

     CREATE TABLE Shows (
         ShowID INT PRIMARY KEY,
         Title VARCHAR(100),
         Genre VARCHAR(50),
         ReleaseYear INT
     );

     CREATE TABLE Subscribers (
         SubscriberID INT PRIMARY KEY,
         SubscriberName VARCHAR(100),
         SubscriptionDate DATE
     );

     CREATE TABLE WatchHistory (
         HistoryID INT PRIMARY KEY,
         ShowID INT,
         SubscriberID INT,
         WatchTime INT,
         FOREIGN KEY (ShowID) REFERENCES Shows(ShowID),
         FOREIGN KEY (SubscriberID) REFERENCES Subscribers(SubscriberID)
     );

  3. Insert sample data :
  ----------------------
     
   INSERT INTO Shows (ShowID, Title, Genre, ReleaseYear) VALUES
   (1, 'Stranger Things', 'Sci-Fi', 2016), 
   (2, 'The Crown', 'Drama', 2016), 
   (3, 'The Witcher', 'Fantasy', 2019),
   (4, 'Dark', 'Sci-Fi', 2017),
   (5, 'Breaking Bad', 'Crime', 2008),
   (6, 'Game of Thrones', 'Fantasy', 2011),
   (7, 'Money Heist', 'Thriller', 2017),
   (8, 'Friends', 'Comedy', 1994),
   (9, 'Sherlock', 'Mystery', 2010),
   (10, 'The Office', 'Comedy', 2005);


   INSERT INTO Subscribers (SubscriberID, SubscriberName, SubscriptionDate) VALUES 
   (1, 'Emily Clark', '2023-01-10'), 
   (2, 'Chris Adams', '2023-02-15'), 
   (3, 'Jordan Smith', '2023-03-05'),
   (4, 'Sophia Lee', '2023-03-20'),
   (5, 'Michael Brown', '2023-04-01'),
   (6, 'Olivia Johnson', '2023-04-10'),
   (7, 'Daniel Garcia', '2023-05-01'),
   (8, 'Ava Martinez', '2023-05-15'),
   (9, 'Ethan Wilson', '2023-06-05'),
   (10, 'Isabella Taylor', '2023-06-20');

   INSERT INTO WatchHistory (HistoryID, SubscriberID, ShowID, WatchTime) VALUES 
   (1, 1, 1, 100), 
   (2, 1, 2, 10), 
   (3, 2, 1, 20), 
   (4, 2, 2, 40), 
   (5, 2, 3, 10), 
   (6, 3, 2, 10), 
   (7, 3, 1, 10), 
   (8, 4, 4, 200),
   (9, 4, 5, 50),
   (10, 4, 7, 30),
   (11, 5, 6, 100),
   (12, 5, 2, 60),
   (13, 6, 3, 120),
   (14, 6, 8, 240),
   (15, 7, 9, 150),
   (16, 7, 1, 45),
   (17, 8, 5, 90),
   (18, 8, 7, 25),
   (19, 9, 10, 60),
   (20, 9, 4, 180);

   4. Run Script 1 – q1.sql :
   --------------------------
   - Defines a procedure to list all subscribers.
   - Execution: CALL ListAllSubscribers();

   5. Run Script 2 – q2.sql :
   -------------------------
   - Defines a procedure to get watch history by subscriber ID.
   - Execution: CALL GetWatchHistoryBySubscriber(2);

   6. Run Script 3 – q3.sql :
   --------------------------
   - Defines a procedure to add a subscriber if not already existing.
   - Execution: 
         CALL AddSubscriberIfNotExists("Chris Lewis");
         CALL AddSubscriberIfNotExists("Chris Lewis"); // To verify if the above name was added to table

   7. Run Script 4 – q4.sql :
   --------------------------
   - Defines a procedure to send watch time reports for all subscribers with watch history.
   - Execution: CALL SendWatchTimeReport();
   - The procedure will return each subscriber’s watch history. If a subscriber has no watch history, nothing will be shown for that subscriber.

   8. Run Script 5 – q5.sql :
   -------------------------
   - Defines a procedure to print watch time reports for all subscribers.
   - Execution: CALL PrintWatchTimeReports();
   - The procedure will return each subscriber’s watch history. If a subscriber has no watch history, the result will show "Empty set".

---------------------------------------
         Execution Order
---------------------------------------

1. Setup MySQL, Database and 
2. Define Tables 
3. Insert sample data.  
4. Run `q1.sql`  
5. Run `q2.sql`  
6. Run `q3.sql`  
7. Run `q4.sql`  
8. Run `q5.sql`  

---------------------------------------
               Notes
---------------------------------------

- Ensure MySQL server is running before executing scripts. 
- Ensure you are connected and logged in to the MySQL server.
- Use the same database (tv_shows) for all scripts.  
- Scripts can be run in MySQL Workbench, CLI, or any compatible SQL environment.  

---------------------------------------
Author: KONDA BHANU SAI AKHIL
