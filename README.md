# cs2102-project

## Setting up Database Locally (PSQL)

1. Open your Command Line Interface (CLI) in the SQL folder directory
2. Load the SQL dump into your psql using the following commands:  

Create a database cs2102_project in your postgres and the relevant tables)  
> `psql -U postgres -f schema.sql`  

Add the relevant data to the tables  
> `psql -U postgres -f populateTable.sql`  

Add the function to the database
> `psql -U postgres -f functions.sql`

3. Connect to database `psql -U postgres -d cs2102_project` and execute queries directly there.

4. Once connected, you can do `\d` to check if the tables are created correctly.

## NOTES REGARDING SCHEMA

Overlapping keywords (Use quotations for reference)

- "floor"
- "date"
- "Sessions"

## DUMMY DATA SPECIFICS

### Settings

- Company 1st Day: D-3 (3 Days before your CURRENT_DATE)
- Current Date: D-DAY (THE DATE ON YOUR COMPUTER)

### Departments

1. Engineering
2. Support
3. Services
4. Marketing
5. Sales

### Employees

Total number of Employees: 43  
Each Department:

- 5 Juniors
- 2 Seniors
- 1 Manager  
**Note that Employees 41, 42, 43 are resigned junior, senior and manager respectively, all from Engineering department**

### Meeting Rooms

- Floors: 5
- Rooms per Floor: 5
- Rooms per Dpt: 5  

**Repeated room name (owl, eagle) on differnt floor**  
**Dpt ID -> Floor belonging to that Dpt**

### Updates

Initial Capacity: 8  
Update ID: Manager of their respective Dpts  
Update Date: D-3 (Company Start Date)

### Sessions

Meeting List:  
("time", "date", room, "floor", bid, approver)  
(21, D-2, 2, 2, 29, 37); -- Consec timeslot  
(22, D-2, 2, 2, 29, 37);  
(23, D-2, 2, 2, 29, 37);  
(18, D-1, 1, 4, 26, 36);  
(18, D-DAY, 1, 4, 26, 36);  
(18, D+1, 1, 4, 26, 36);  
(23, D+2, 3, 3, 37, 37); -- Booked and approved by same Manager  
(13, D+3, 3, 4, 32, null); -- Pending booking  
(18, D+4, 2, 3, 27, 36); -- Different floor room  
(15, D+4, 1, 4, 28, 37); -- Differnt timeslot  
(18, D+5, 1, 4, 26, 36); -- Different date  
(18, D+6, 1, 4, 26, 36); -- Different Capacity  
(16, D+7, 2, 4, 26, 36); -- Future Session

Covered Testcases:

- Diff floor room
- Diff timeslot
- Diff date
- Consec timeslot
- Booked and approved by same manager
- Pending
- Future session

Not covered:

- Fever
- Resigned

### Health Declaration

Non-Compliance:  
D-2: 5, 10, 12, 15, 18, 19, 22, 24, 26, 38  
D-DAY: 5, 9, 12, 15, 18, 19

### Participation List

Current total number of Participants: 67  
**Active personnels for fever/resign function testing**

- Junior (eid: 1)
- Senior (eid: 26)
- Manager (eid: 37)

## Authors

Group 88:

- Gordon Tham Qi Hao
- Jasin Chow Si Yuan
- Keith Tay Xiang Rui
- Tay Wei Hong, Allan

Tech Stack:

- Database: PostgresSQL
