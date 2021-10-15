# cs2102-project

## Setup Locally (psql)

1. Open your Command Line Interface (CLI) in the SQL folder directory 
2. Load the SQL dump into your psql using the following command:

psql -U postgres -f schema.sql (Create a database cs2102_project in your postgres and the relevant tables)
NOTE: 

psql -U postgres -f populateTable.sql (Add the relevant data to the tables) 
3. Connect to database 'psql -U postgres -d cs2102_project' and execute queries directly there. 
4. Once connected, you can do '\d' to check if the tables are created correctly. 

## NOTES REGARDING SCHEMA:
1. Overlapping keywords (Use quotations for reference)
> "floor"
> "date"
> "Sessions"

## DUMMY DATA SPECIFICS:

### Settings
Company 1st Day: '2021-06-30'
Current Date: '2021-07-03'

### Deparments
1. Engineering
2. Support
3. Services
4. Marketing
5. Sales

### Employees
Total number of Employees: 43
Each Department: 
> 5 Juniors
> 2 Seniors
> 1 Manager
* Note that Employees 41, 42, 43 are resigned junior, senior and manager respectively, all from department 1. 

### Meeting Rooms
Floors: 5
Rooms per Floor: 5
Rooms per Dpt: 5
* Repeated room name (owl, eagle) on differnt floor
* Dpt ID -> Floor belonging to that Dpt

### Updates
Initial Capacity: 8
update ID: Manager of their respective Dpts
update Date: '2021-06-30' (Company Start Date)

### Sessions
Meeting List:
(`time`, `date`, room, `floor`, bid, approver)
(21, '2021-07-01', 2, 2, 29, 37); -- Consec timeslot
(22, '2021-07-01', 2, 2, 29, 37);
(23, '2021-07-01', 2, 2, 29, 37);
(18, '2021-07-02', 1, 4, 26, 36);
(18, '2021-07-03', 1, 4, 26, 36);
(18, '2021-07-10', 1, 4, 26, 36); 
(23, '2021-07-11', 3, 3, 37, 37); -- Booked and approved by same Manager
(13, '2021-08-29', 3, 4, 32, null); -- Pending booking
(18, '2021-08-30', 2, 3, 27, 36); -- Different floor room
(15, '2021-08-30', 1, 4, 28, 37); -- Differnt timeslot
(18, '2021-09-01', 1, 4, 26, 36); -- Different date
(18, '2021-09-03', 1, 4, 26, 36); -- Different Capacity
(16, '2021-11-11', 2, 4, 26, 36); -- Future Session

Covered Testcases:
> diff floor room
> diff timeslot
> diff date
> Consec timeslot
> booked and approved by same manager
> pending
> future session
Not covered:
> Fever
> Resigned

### Health Declaration
Non-Compliance:
2021-07-02: 5, 10, 12, 15, 18, 19, 22, 24, 26, 38
2021-07-03: 5, 9, 12, 15, 18, 19

### Participation List:
Current total number of Participants: 67
*Active personnels for fever/resign function testing*
Junior 1 
Senior 26 
Manager 37

# Authors
Group 88:

- Gordon Tham Qi Hao
- Jasin Chow Si Yuan
- Keith Tay Xiang Rui
- Tay Wei Hong, Allan

Tech Stack:

- Database: PostgresSQL