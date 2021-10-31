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
insert into HealthDeclaration (eid, "date", temp, fever) values (1, CURRENT_DATE - interval '3 day', 37.0, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (2, CURRENT_DATE - interval '3 day', 36.9, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (3, CURRENT_DATE - interval '3 day', 37.2, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (4, CURRENT_DATE - interval '3 day', 36.2, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (5, CURRENT_DATE - interval '3 day', 36.3, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (6, CURRENT_DATE - interval '3 day', 36.8, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (7, CURRENT_DATE - interval '3 day', 37.4, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (8, CURRENT_DATE - interval '3 day', 36.5, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (9, CURRENT_DATE - interval '3 day', 36.0, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (10, CURRENT_DATE - interval '3 day', 37.3, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (11, CURRENT_DATE - interval '3 day', 36.1, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (12, CURRENT_DATE - interval '3 day', 36.8, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (13, CURRENT_DATE - interval '3 day', 36.5, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (14, CURRENT_DATE - interval '3 day', 36.2, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (15, CURRENT_DATE - interval '3 day', 36.3, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (16, CURRENT_DATE - interval '3 day', 37.0, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (17, CURRENT_DATE - interval '3 day', 37.2, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (18, CURRENT_DATE - interval '3 day', 36.5, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (19, CURRENT_DATE - interval '3 day', 36.3, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (20, CURRENT_DATE - interval '3 day', 36.7, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (21, CURRENT_DATE - interval '3 day', 37.0, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (22, CURRENT_DATE - interval '3 day', 36.3, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (23, CURRENT_DATE - interval '3 day', 36.9, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (24, CURRENT_DATE - interval '3 day', 36.7, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (25, CURRENT_DATE - interval '3 day', 36.8, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (26, CURRENT_DATE - interval '3 day', 36.0, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (27, CURRENT_DATE - interval '3 day', 36.6, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (28, CURRENT_DATE - interval '3 day', 36.8, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (29, CURRENT_DATE - interval '3 day', 36.2, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (30, CURRENT_DATE - interval '3 day', 37.2, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (31, CURRENT_DATE - interval '3 day', 36.3, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (32, CURRENT_DATE - interval '3 day', 36.7, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (33, CURRENT_DATE - interval '3 day', 37.3, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (34, CURRENT_DATE - interval '3 day', 36.8, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (35, CURRENT_DATE - interval '3 day', 36.5, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (36, CURRENT_DATE - interval '3 day', 37.4, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (37, CURRENT_DATE - interval '3 day', 37.3, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (38, CURRENT_DATE - interval '3 day', 36.1, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (39, CURRENT_DATE - interval '3 day', 36.9, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (40, CURRENT_DATE - interval '3 day', 37.2, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (1, CURRENT_DATE - interval '2 day', 37.0, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (2, CURRENT_DATE - interval '2 day', 36.3, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (3, CURRENT_DATE - interval '2 day', 36.7, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (4, CURRENT_DATE - interval '2 day', 36.4, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (5, CURRENT_DATE - interval '2 day', 36.6, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (6, CURRENT_DATE - interval '2 day', 36.7, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (7, CURRENT_DATE - interval '2 day', 37.1, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (8, CURRENT_DATE - interval '2 day', 36.6, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (9, CURRENT_DATE - interval '2 day', 36.6, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (10, CURRENT_DATE - interval '2 day', 36.1, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (11, CURRENT_DATE - interval '2 day', 36.0, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (12, CURRENT_DATE - interval '2 day', 36.4, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (13, CURRENT_DATE - interval '2 day', 37.0, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (14, CURRENT_DATE - interval '2 day', 36.5, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (15, CURRENT_DATE - interval '2 day', 36.0, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (16, CURRENT_DATE - interval '2 day', 36.0, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (17, CURRENT_DATE - interval '2 day', 36.4, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (18, CURRENT_DATE - interval '2 day', 36.3, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (19, CURRENT_DATE - interval '2 day', 37.3, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (20, CURRENT_DATE - interval '2 day', 36.6, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (21, CURRENT_DATE - interval '2 day', 37.0, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (22, CURRENT_DATE - interval '2 day', 36.5, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (23, CURRENT_DATE - interval '2 day', 36.5, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (24, CURRENT_DATE - interval '2 day', 36.3, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (25, CURRENT_DATE - interval '2 day', 37.4, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (26, CURRENT_DATE - interval '2 day', 37.0, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (27, CURRENT_DATE - interval '2 day', 36.9, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (28, CURRENT_DATE - interval '2 day', 37.0, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (29, CURRENT_DATE - interval '2 day', 37.1, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (30, CURRENT_DATE - interval '2 day', 36.4, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (31, CURRENT_DATE - interval '2 day', 36.7, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (32, CURRENT_DATE - interval '2 day', 36.4, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (33, CURRENT_DATE - interval '2 day', 36.8, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (34, CURRENT_DATE - interval '2 day', 37.0, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (35, CURRENT_DATE - interval '2 day', 37.1, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (36, CURRENT_DATE - interval '2 day', 36.3, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (37, CURRENT_DATE - interval '2 day', 36.6, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (38, CURRENT_DATE - interval '2 day', 36.6, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (39, CURRENT_DATE - interval '2 day', 36.3, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (40, CURRENT_DATE - interval '2 day', 36.4, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (1, CURRENT_DATE - interval 'day 1', 37.0, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (2, CURRENT_DATE - interval 'day 1', 36.4, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (3, CURRENT_DATE - interval 'day 1', 36.5, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (4, CURRENT_DATE - interval 'day 1', 36.1, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (6, CURRENT_DATE - interval 'day 1', 36.5, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (7, CURRENT_DATE - interval 'day 1', 36.0, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (8, CURRENT_DATE - interval 'day 1', 37.3, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (9, CURRENT_DATE - interval 'day 1', 36.2, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (11, CURRENT_DATE - interval 'day 1', 37.1, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (13, CURRENT_DATE - interval 'day 1', 36.3, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (14, CURRENT_DATE - interval 'day 1', 36.5, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (16, CURRENT_DATE - interval 'day 1', 37.1, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (17, CURRENT_DATE - interval 'day 1', 36.4, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (20, CURRENT_DATE - interval 'day 1', 36.9, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (21, CURRENT_DATE - interval 'day 1', 37.4, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (23, CURRENT_DATE - interval 'day 1', 37.0, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (25, CURRENT_DATE - interval 'day 1', 36.7, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (27, CURRENT_DATE - interval 'day 1', 37.1, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (28, CURRENT_DATE - interval 'day 1', 37.2, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (29, CURRENT_DATE - interval 'day 1', 37.2, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (30, CURRENT_DATE - interval 'day 1', 37.0, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (31, CURRENT_DATE - interval 'day 1', 36.6, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (32, CURRENT_DATE - interval 'day 1', 36.6, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (33, CURRENT_DATE - interval 'day 1', 36.1, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (34, CURRENT_DATE - interval 'day 1', 37.2, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (35, CURRENT_DATE - interval 'day 1', 36.6, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (36, CURRENT_DATE - interval 'day 1', 36.0, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (37, CURRENT_DATE - interval 'day 1', 36.6, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (39, CURRENT_DATE - interval 'day 1', 36.6, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (40, CURRENT_DATE - interval 'day 1', 36.7, false);
EXECUTE FUNCTION declare_health(1, 35.1)
EXECUTE FUNCTION declare_health(2, 35.8)
EXECUTE FUNCTION declare_health(3, 35.6)
EXECUTE FUNCTION declare_health(4, 36.0)
EXECUTE FUNCTION declare_health(5, 37.3)
EXECUTE FUNCTION declare_health(6, 36.2)
EXECUTE FUNCTION declare_health(7, 35.6)
EXECUTE FUNCTION declare_health(8, 34.4)
EXECUTE FUNCTION declare_health(9, 34.4)
EXECUTE FUNCTION declare_health(10, 36.2)
EXECUTE FUNCTION declare_health(11, 34.9)
EXECUTE FUNCTION declare_health(12, 34.8)
EXECUTE FUNCTION declare_health(13, 37.1)
EXECUTE FUNCTION declare_health(14, 34.3)
EXECUTE FUNCTION declare_health(15, 34.2)
EXECUTE FUNCTION declare_health(16, 36.5)
EXECUTE FUNCTION declare_health(17, 35.7)
EXECUTE FUNCTION declare_health(18, 34.5)
EXECUTE FUNCTION declare_health(19, 34.4)
EXECUTE FUNCTION declare_health(20, 36.5)
EXECUTE FUNCTION declare_health(21, 37.0)
EXECUTE FUNCTION declare_health(22, 34.9)
EXECUTE FUNCTION declare_health(23, 35.8)
EXECUTE FUNCTION declare_health(24, 34.2)
EXECUTE FUNCTION declare_health(25, 34.3)
EXECUTE FUNCTION declare_health(26, 36.9)
EXECUTE FUNCTION declare_health(27, 34.7)
EXECUTE FUNCTION declare_health(28, 36.4)
EXECUTE FUNCTION declare_health(29, 35.1)
EXECUTE FUNCTION declare_health(30, 36.6)
EXECUTE FUNCTION declare_health(31, 34.5)
EXECUTE FUNCTION declare_health(32, 36.7)
EXECUTE FUNCTION declare_health(33, 34.6)
EXECUTE FUNCTION declare_health(34, 34.7)
EXECUTE FUNCTION declare_health(35, 36.4)
EXECUTE FUNCTION declare_health(36, 36.9)
EXECUTE FUNCTION declare_health(37, 37.2)
EXECUTE FUNCTION declare_health(38, 35.8)
EXECUTE FUNCTION declare_health(39, 36.3)
EXECUTE FUNCTION declare_health(40, 37.1)
/*Check that people with fever are properly flagged as true*/
/*Check that personal with fever are not in any meeting*/

-- Insert Sessions [BOOK_ROOM]
/*CHeck that booker is automatically added to participants*/

-- INSERT APPROVAL [APPROVE_MEETING]

-- Insert Participants [JOIN_MEETING]
/*CHECK THAT PARTICIPANTS WITH FEVER CANNOT BE ADDED INTO THE LIST*/