/* Running functions for POPULATING Simulation ONLY */
/* OTHER FUNCTIONS TO BE SELF RUN FOR TESTING */

\c cs2102-project

-- Insert Departments [ADD_DEPARTMENT]
/* (Department 0 = Management) */

-- Insert MeetingRooms [ADD_ROOM]
/*Check that updates are properly populated*/

-- Insert Employees [ADD_EMPLOYEE]
/* (Restrict Employee Count to Minimal, 12 ~ ish?) */
/*Check that Junior, Senior, Manager, Booker are properly populated*/

-- Insert HealthDeclaration [DECLARE_HEALTH]
/*Check that people with fever are properly flagged as true*/
/*Check that personal with fever are not in any meeting*/

-- Insert Sessions [BOOK_ROOM]
/*CHeck that booker is automatically added to participants*/

-- INSERT APPROVAL [APPROVE_MEETING]

-- Insert Participants [JOIN_MEETING]
/*CHECK THAT PARTICIPANTS WITH FEVER CANNOT BE ADDED INTO THE LIST*/