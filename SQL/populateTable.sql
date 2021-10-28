/* Completed Data For Queries Function Testing Only 
1. Refer to schema.sql for schema
2. Refer to ER.pdf for ER-diagram
3. Refer to README.md for data specifics
*/

\c cs2102_project

-- Departments
insert into Departments (did, dname) values (1, 'Engineering');
insert into Departments (did, dname) values (2, 'Support');
insert into Departments (did, dname) values (3, 'Services');
insert into Departments (did, dname) values (4, 'Marketing');
insert into Departments (did, dname) values (5, 'Sales');


-- MeetingRooms
/* Note that there is 2 owl, 2 eagle (repeated names) */
insert into MeetingRooms (room, "floor", rname, did) values (1, 1, 'Elk', 1);
insert into MeetingRooms (room, "floor", rname, did) values (2, 1, 'Bat', 1);
insert into MeetingRooms (room, "floor", rname, did) values (3, 1, 'Goose', 1);
insert into MeetingRooms (room, "floor", rname, did) values (4, 1, 'Badger', 1);
insert into MeetingRooms (room, "floor", rname, did) values (5, 1, 'Rhinoceros', 1);
insert into MeetingRooms (room, "floor", rname, did) values (1, 2, 'Grison', 2);
insert into MeetingRooms (room, "floor", rname, did) values (2, 2, 'Drongo', 2);
insert into MeetingRooms (room, "floor", rname, did) values (3, 2, 'Squirrel', 2);
insert into MeetingRooms (room, "floor", rname, did) values (4, 2, 'Marten', 2);
insert into MeetingRooms (room, "floor", rname, did) values (5, 2, 'Owl', 2);
insert into MeetingRooms (room, "floor", rname, did) values (1, 3, 'Eagle', 3);
insert into MeetingRooms (room, "floor", rname, did) values (2, 3, 'Moorhen', 3);
insert into MeetingRooms (room, "floor", rname, did) values (3, 3, 'Buffalo', 3);
insert into MeetingRooms (room, "floor", rname, did) values (4, 3, 'Owl', 3);
insert into MeetingRooms (room, "floor", rname, did) values (5, 3, 'Caribou', 3);
insert into MeetingRooms (room, "floor", rname, did) values (1, 4, 'Dog', 4);
insert into MeetingRooms (room, "floor", rname, did) values (2, 4, 'Lion', 4);
insert into MeetingRooms (room, "floor", rname, did) values (3, 4, 'Otter', 4);
insert into MeetingRooms (room, "floor", rname, did) values (4, 4, 'Duck', 4);
insert into MeetingRooms (room, "floor", rname, did) values (5, 4, 'Chicken', 4);
insert into MeetingRooms (room, "floor", rname, did) values (1, 5, 'Turkey', 5);
insert into MeetingRooms (room, "floor", rname, did) values (2, 5, 'Eagle', 5);
insert into MeetingRooms (room, "floor", rname, did) values (3, 5, 'Fox', 5);
insert into MeetingRooms (room, "floor", rname, did) values (4, 5, 'Antelope', 5);
insert into MeetingRooms (room, "floor", rname, did) values (5, 5, 'Topi', 5);


-- Employees
/* Note that Employees 41, 42, 43 are resigned junior, senior and manager respectively */
insert into Employees (eid, ename, email, home, phone, office, did) values (1, 'Donn', 'droch0@google.co.uk', 97347745, 57634275, null, 1);
insert into Employees (eid, ename, email, home, phone, office, did) values (2, 'Adriane', 'astorrs1@feedburner.com', 46072806, 61210501, 21650107, 1);
insert into Employees (eid, ename, email, home, phone, office, did) values (3, 'Yolane', 'ysaffill2@disqus.com', null, 35450235, 65595266, 1);
insert into Employees (eid, ename, email, home, phone, office, did) values (4, 'Jacqueline', 'jbrumham3@hp.com', 53850002, 47921732, 52116532, 1);
insert into Employees (eid, ename, email, home, phone, office, did) values (5, 'Paula', 'pkeems4@utexas.edu', null, 30162962, 65763936, 1);
insert into Employees (eid, ename, email, home, phone, office, did) values (6, 'Dukie', 'dantushev5@msu.edu', 25284293, 74881288, 47752861, 2);
insert into Employees (eid, ename, email, home, phone, office, did) values (7, 'Veda', 'vguitonneau6@irs.gov', 96178253, 88279549, 29397038, 2);
insert into Employees (eid, ename, email, home, phone, office, did) values (8, 'Quintilla', 'qcrut7@mlb.com', 81964694, 27390734, 78387189, 2);
insert into Employees (eid, ename, email, home, phone, office, did) values (9, 'Kimball', 'kciementini8@soundcloud.com', null, 42615309, 55287708, 2);
insert into Employees (eid, ename, email, home, phone, office, did) values (10, 'Lacey', 'lburgis9@google.ca', 84960263, 23474737, null, 2);
insert into Employees (eid, ename, email, home, phone, office, did) values (11, 'Thalia', 'thacketa@foxnews.com', 70057524, 54611591, 34287578, 3);
insert into Employees (eid, ename, email, home, phone, office, did) values (12, 'Stan', 'sgooderridgeb@wordpress.com', 52941167, 17081555, 91285021, 3);
insert into Employees (eid, ename, email, home, phone, office, did) values (13, 'Kimmi', 'kemblinc@zimbio.com', 95867972, 99531484, 14384585, 3);
insert into Employees (eid, ename, email, home, phone, office, did) values (14, 'Pauli', 'pbruckshawd@gnu.org', 54064156, 83490623, 95824800, 3);
insert into Employees (eid, ename, email, home, phone, office, did) values (15, 'Seumas', 'sziemkee@jimdo.com', 52087807, 95511104, 23111954, 3);
insert into Employees (eid, ename, email, home, phone, office, did) values (16, 'Jerrylee', 'jjanousf@vkontakte.ru', null, 17079221, 31737467, 4);
insert into Employees (eid, ename, email, home, phone, office, did) values (17, 'Lucila', 'lempringhamg@rediff.com', 78492733, 69266805, 35115840, 4);
insert into Employees (eid, ename, email, home, phone, office, did) values (18, 'Walton', 'wfaberh@bluehost.com', 14919719, 75985977, 51671799, 4);
insert into Employees (eid, ename, email, home, phone, office, did) values (19, 'Ogdan', 'ogelderdi@networksolutions.com', 45984958, 47010937, 32032874, 4);
insert into Employees (eid, ename, email, home, phone, office, did) values (20, 'Vere', 'vellcockj@marketwatch.com', 73237410, 69121831, null, 4);
insert into Employees (eid, ename, email, home, phone, office, did) values (21, 'Huey', 'hpaishk@instagram.com', 82950578, 36732148, 77046018, 5);
insert into Employees (eid, ename, email, home, phone, office, did) values (22, 'Jeniffer', 'jtwigleyl@irs.gov', null, 95274853, 88254015, 5);
insert into Employees (eid, ename, email, home, phone, office, did) values (23, 'Nap', 'ntretterm@plala.or.jp', 63887220, 96815299, null, 5);
insert into Employees (eid, ename, email, home, phone, office, did) values (24, 'Andree', 'achecchin@dell.com', null, 65650397, 26899469, 5);
insert into Employees (eid, ename, email, home, phone, office, did) values (25, 'Zachary', 'zsmorthwaiteo@eventbrite.com', 98521955, 84298356, 26225872, 5);
insert into Employees (eid, ename, email, home, phone, office, did) values (26, 'Ruddie', 'rsallyp@smugmug.com', null, 73199316, 62368657, 1);
insert into Employees (eid, ename, email, home, phone, office, did) values (27, 'Rollin', 'rbassingdenq@discuz.net', 47835587, 98559757, 21428341, 1);
insert into Employees (eid, ename, email, home, phone, office, did) values (28, 'Skipp', 'stinmanr@constantcontact.com', null, 54088913, 35286267, 2);
insert into Employees (eid, ename, email, home, phone, office, did) values (29, 'Laureen', 'lsiemenss@springer.com', 13547908, 46156497, null, 2);
insert into Employees (eid, ename, email, home, phone, office, did) values (30, 'Sande', 'ssalandinot@is.gd', 71882706, 75890136, 32982367, 3);
insert into Employees (eid, ename, email, home, phone, office, did) values (31, 'Kiley', 'kfortnumu@wikispaces.com', 35890190, 36385404, 42962562, 3);
insert into Employees (eid, ename, email, home, phone, office, did) values (32, 'Cynthy', 'ccaveev@quantcast.com', 34757849, 47915061, null, 4);
insert into Employees (eid, ename, email, home, phone, office, did) values (33, 'Hube', 'hmikow@spiegel.de', 27430689, 97985846, 63322743, 4);
insert into Employees (eid, ename, email, home, phone, office, did) values (34, 'Alec', 'ascannellx@posterous.com', null, 13926344, 86449892, 5);
insert into Employees (eid, ename, email, home, phone, office, did) values (35, 'Gregory', 'gfurneauxy@bloglines.com', 40313503, 86913985, null, 5);
insert into Employees (eid, ename, email, home, phone, office, did) values (36, 'Tonye', 'tskeaz@apache.org', 81896180, 12281063, 60135237, 1);
insert into Employees (eid, ename, email, home, phone, office, did) values (37, 'Kirby', 'kmcgougan10@posterous.com', null, 24259944, 56643719, 2);
insert into Employees (eid, ename, email, home, phone, office, did) values (38, 'Trisha', 'tsouthward11@facebook.com', 85158764, 70592700, 64273018, 3);
insert into Employees (eid, ename, email, home, phone, office, did) values (39, 'Jerrylee', 'jfarens12@mashable.com', null, 95476470, 62948065, 4);
insert into Employees (eid, ename, email, home, phone, office, did) values (40, 'Peyter', 'pmadgett13@acquirethisname.com', null, 29998123, null, 5);
insert into Employees (eid, ename, email, home, phone, office, resign, did) values (41, 'ResignJunior', 'ResignJunior@acquirethisname.com', 12347890, 12345890, null, CURRENT_DATE - interval '2 day', 1);
insert into Employees (eid, ename, email, home, phone, office, resign, did) values (42, 'ResignSenior', 'ResignSenior@acquirethisname.com', 12345890, 99999999, null, CURRENT_DATE - interval '1 day', 1);
insert into Employees (eid, ename, email, home, phone, office, resign, did) values (43, 'ResignManager', 'ResignManager@acquirethisname.com', 12567890, 11111111, null, CURRENT_DATE, 1);

-- Junior
insert into Junior (eid) values (1), (2), (3), (4), (5)
, (6), (7), (8), (9), (10), (11), (12), (13), (14)
, (15), (16), (17), (18), (19), (20), (21), (22), (23)
, (24), (25);

-- Booker
insert into Booker (eid) values (26), (27), (28), (29), (30)
, (31), (32), (33), (34), (35), (36), (37), (38), (39), (40);

-- Senior
insert into Senior (eid) values (26), (27), (28), (29), (30)
, (31), (32), (33), (34), (35);

-- Manager
insert into Manager (eid) values (36), (37), (38), (39), (40);

-- Sessions
-- Base Comparison
insert into "Sessions" ("time", "date", room, "floor", bid, approver) values (18,  CURRENT_DATE + interval '4 day', 1, 4, 26, 36);
-- Different floor room
insert into "Sessions" ("time", "date", room, "floor", bid, approver) values (18,  CURRENT_DATE + interval '4 day', 2, 3, 27, 36);
-- Differnt timeslot
insert into "Sessions" ("time", "date", room, "floor", bid, approver) values (15,  CURRENT_DATE + interval '4 day', 1, 4, 28, 37);
-- Different date
insert into "Sessions" ("time", "date", room, "floor", bid, approver) values (18,  CURRENT_DATE + interval '5 day', 1, 4, 26, 36);
-- Different Capacity (Testing Update on 2021-09-02)
insert into "Sessions" ("time", "date", room, "floor", bid, approver) values (18,  CURRENT_DATE + interval '6 day', 1, 4, 26, 36);
-- Consec timeslot
insert into "Sessions" ("time", "date", room, "floor", bid, approver) values (21, CURRENT_DATE - interval '2 day', 2, 2, 29, 37);
insert into "Sessions" ("time", "date", room, "floor", bid, approver) values (22, CURRENT_DATE - interval '2 day', 2, 2, 29, 37);
insert into "Sessions" ("time", "date", room, "floor", bid, approver) values (23, CURRENT_DATE - interval '2 day', 2, 2, 29, 37);
-- Booked and approved by same Manager
insert into "Sessions" ("time", "date", room, "floor", bid, approver) values (23, CURRENT_DATE + interval '2 day', 3, 3, 37, 37);
-- Pending booking
insert into "Sessions" ("time", "date", room, "floor", bid, approver) values (13, CURRENT_DATE + interval '3 day', 3, 4, 32, null);
-- Future Session
insert into "Sessions" ("time", "date", room, "floor", bid, approver) values (16, CURRENT_DATE + interval '7 day', 2, 4, 33, 39);
-- Busy Manager 26
insert into "Sessions" ("time", "date", room, "floor", bid, approver) values (18, CURRENT_DATE, 1, 4, 26, 36);
insert into "Sessions" ("time", "date", room, "floor", bid, approver) values (18, CURRENT_DATE + interval '1 day', 1, 4, 26, 36);

-- HealthDeclaration
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
insert into HealthDeclaration (eid, "date", temp, fever) values (1, CURRENT_DATE, 37.0, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (2, CURRENT_DATE, 36.4, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (3, CURRENT_DATE, 36.5, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (4, CURRENT_DATE, 36.1, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (6, CURRENT_DATE, 36.5, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (7, CURRENT_DATE, 36.0, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (8, CURRENT_DATE, 37.3, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (10, CURRENT_DATE, 36.8, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (11, CURRENT_DATE, 37.1, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (13, CURRENT_DATE, 36.3, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (14, CURRENT_DATE, 36.5, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (16, CURRENT_DATE, 37.1, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (17, CURRENT_DATE, 36.4, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (20, CURRENT_DATE, 36.9, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (21, CURRENT_DATE, 37.4, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (22, CURRENT_DATE, 36.9, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (23, CURRENT_DATE, 36.9, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (24, CURRENT_DATE, 36.9, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (25, CURRENT_DATE, 36.9, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (26, CURRENT_DATE, 37.1, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (27, CURRENT_DATE, 36.7, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (28, CURRENT_DATE, 37.2, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (29, CURRENT_DATE, 37.2, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (30, CURRENT_DATE, 37.0, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (31, CURRENT_DATE, 36.6, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (32, CURRENT_DATE, 36.6, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (33, CURRENT_DATE, 36.1, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (34, CURRENT_DATE, 37.2, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (35, CURRENT_DATE, 36.6, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (36, CURRENT_DATE, 36.0, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (37, CURRENT_DATE, 36.6, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (38, CURRENT_DATE, 37.0, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (39, CURRENT_DATE, 36.6, false);
insert into HealthDeclaration (eid, "date", temp, fever) values (40, CURRENT_DATE, 36.7, false);

-- Participants
insert into Participants (eid, "time", "date", room, "floor") values (29, 21, CURRENT_DATE - interval '2 day', 2, 2);
insert into Participants (eid, "time", "date", room, "floor") values (29, 22, CURRENT_DATE - interval '2 day', 2, 2);
insert into Participants (eid, "time", "date", room, "floor") values (29, 23, CURRENT_DATE - interval '2 day', 2, 2);
insert into Participants (eid, "time", "date", room, "floor") values (1, 21, CURRENT_DATE - interval '2 day', 2, 2);
insert into Participants (eid, "time", "date", room, "floor") values (1, 22, CURRENT_DATE - interval '2 day', 2, 2);
insert into Participants (eid, "time", "date", room, "floor") values (1, 23, CURRENT_DATE - interval '2 day', 2, 2);
insert into Participants (eid, "time", "date", room, "floor") values (3, 21, CURRENT_DATE - interval '2 day', 2, 2);
insert into Participants (eid, "time", "date", room, "floor") values (3, 22, CURRENT_DATE - interval '2 day', 2, 2);
insert into Participants (eid, "time", "date", room, "floor") values (3, 23, CURRENT_DATE - interval '2 day', 2, 2);
insert into Participants (eid, "time", "date", room, "floor") values (37, 21, CURRENT_DATE - interval '2 day', 2, 2);
insert into Participants (eid, "time", "date", room, "floor") values (37, 22, CURRENT_DATE - interval '2 day', 2, 2);
insert into Participants (eid, "time", "date", room, "floor") values (37, 23, CURRENT_DATE - interval '2 day', 2, 2);
insert into Participants (eid, "time", "date", room, "floor") values (24, 21, CURRENT_DATE - interval '2 day', 2, 2);
insert into Participants (eid, "time", "date", room, "floor") values (24, 22, CURRENT_DATE - interval '2 day', 2, 2);
insert into Participants (eid, "time", "date", room, "floor") values (24, 23, CURRENT_DATE - interval '2 day', 2, 2);
insert into Participants (eid, "time", "date", room, "floor") values (22, 21, CURRENT_DATE - interval '2 day', 2, 2);
insert into Participants (eid, "time", "date", room, "floor") values (22, 22, CURRENT_DATE - interval '2 day', 2, 2);
insert into Participants (eid, "time", "date", room, "floor") values (22, 23, CURRENT_DATE - interval '2 day', 2, 2);
insert into Participants (eid, "time", "date", room, "floor") values (21, 21, CURRENT_DATE - interval '2 day', 2, 2);
insert into Participants (eid, "time", "date", room, "floor") values (21, 22, CURRENT_DATE - interval '2 day', 2, 2);
insert into Participants (eid, "time", "date", room, "floor") values (21, 23, CURRENT_DATE - interval '2 day', 2, 2);
insert into Participants (eid, "time", "date", room, "floor") values (26, 18, CURRENT_DATE, 1, 4);
insert into Participants (eid, "time", "date", room, "floor") values (1, 18, CURRENT_DATE, 1, 4);
insert into Participants (eid, "time", "date", room, "floor") values (3, 18, CURRENT_DATE, 1, 4);
insert into Participants (eid, "time", "date", room, "floor") values (5, 18, CURRENT_DATE, 1, 4);
insert into Participants (eid, "time", "date", room, "floor") values (36, 18, CURRENT_DATE, 1, 4);
insert into Participants (eid, "time", "date", room, "floor") values (2, 18, CURRENT_DATE, 1, 4);
insert into Participants (eid, "time", "date", room, "floor") values (9, 18, CURRENT_DATE, 1, 4);
insert into Participants (eid, "time", "date", room, "floor") values (10, 18, CURRENT_DATE, 1, 4);
insert into Participants (eid, "time", "date", room, "floor") values (26, 18, CURRENT_DATE + interval '1 day', 1, 4);
insert into Participants (eid, "time", "date", room, "floor") values (36, 18, CURRENT_DATE + interval '1 day', 1, 4);
insert into Participants (eid, "time", "date", room, "floor") values (1, 18, CURRENT_DATE + interval '1 day', 1, 4);
insert into Participants (eid, "time", "date", room, "floor") values (13, 18, CURRENT_DATE + interval '1 day', 1, 4);
insert into Participants (eid, "time", "date", room, "floor") values (12, 18, CURRENT_DATE + interval '1 day', 1, 4);
insert into Participants (eid, "time", "date", room, "floor") values (11, 18, CURRENT_DATE + interval '1 day', 1, 4);
insert into Participants (eid, "time", "date", room, "floor") values (37, 23, CURRENT_DATE + interval '2 day', 3, 3);
insert into Participants (eid, "time", "date", room, "floor") values (1, 23, CURRENT_DATE + interval '2 day', 3, 3);
insert into Participants (eid, "time", "date", room, "floor") values (21, 23, CURRENT_DATE + interval '2 day', 3, 3);
insert into Participants (eid, "time", "date", room, "floor") values (22, 23, CURRENT_DATE + interval '2 day', 3, 3);
insert into Participants (eid, "time", "date", room, "floor") values (28, 23, CURRENT_DATE + interval '2 day', 3, 3);
insert into Participants (eid, "time", "date", room, "floor") values (29, 23, CURRENT_DATE + interval '2 day', 3, 3);
insert into Participants (eid, "time", "date", room, "floor") values (32, 13, CURRENT_DATE + interval '3 day', 3, 4);
insert into Participants (eid, "time", "date", room, "floor") values (18, 13, CURRENT_DATE + interval '3 day', 3, 4);
insert into Participants (eid, "time", "date", room, "floor") values (19, 13, CURRENT_DATE + interval '3 day', 3, 4);
insert into Participants (eid, "time", "date", room, "floor") values (1, 13, CURRENT_DATE + interval '3 day', 3, 4);
insert into Participants (eid, "time", "date", room, "floor") values (27, 18, CURRENT_DATE + interval '4 day', 2, 3);
insert into Participants (eid, "time", "date", room, "floor") values (36, 18, CURRENT_DATE + interval '4 day', 2, 3);
insert into Participants (eid, "time", "date", room, "floor") values (1, 18, CURRENT_DATE + interval '4 day', 2, 3);
insert into Participants (eid, "time", "date", room, "floor") values (15, 18, CURRENT_DATE + interval '4 day', 2, 3);
insert into Participants (eid, "time", "date", room, "floor") values (14, 18, CURRENT_DATE + interval '4 day', 2, 3);
insert into Participants (eid, "time", "date", room, "floor") values (13, 18, CURRENT_DATE + interval '4 day', 2, 3);
insert into Participants (eid, "time", "date", room, "floor") values (28, 15,CURRENT_DATE + interval '4 day', 1, 4);
insert into Participants (eid, "time", "date", room, "floor") values (1, 15, CURRENT_DATE + interval '4 day', 1, 4);
insert into Participants (eid, "time", "date", room, "floor") values (37, 15, CURRENT_DATE + interval '4 day', 1, 4);
insert into Participants (eid, "time", "date", room, "floor") values (26, 18, CURRENT_DATE + interval '5 day', 1, 4);
insert into Participants (eid, "time", "date", room, "floor") values (1, 18, CURRENT_DATE + interval '5 day', 1, 4);
insert into Participants (eid, "time", "date", room, "floor") values (2, 18, CURRENT_DATE + interval '5 day', 1, 4);
insert into Participants (eid, "time", "date", room, "floor") values (3, 18, CURRENT_DATE + interval '5 day', 1, 4);
insert into Participants (eid, "time", "date", room, "floor") values (26, 18, CURRENT_DATE + interval '6 day', 1, 4);
insert into Participants (eid, "time", "date", room, "floor") values (1, 18, CURRENT_DATE + interval '6 day', 1, 4);
insert into Participants (eid, "time", "date", room, "floor") values (2, 18, CURRENT_DATE + interval '6 day', 1, 4);
insert into Participants (eid, "time", "date", room, "floor") values (3, 18, CURRENT_DATE + interval '6 day', 1, 4);
insert into Participants (eid, "time", "date", room, "floor") values (26, 16, CURRENT_DATE + interval '7 day', 2, 4);
insert into Participants (eid, "time", "date", room, "floor") values (7, 16, CURRENT_DATE + interval '7 day', 2, 4);
insert into Participants (eid, "time", "date", room, "floor") values (8, 16, CURRENT_DATE + interval '7 day', 2, 4);
insert into Participants (eid, "time", "date", room, "floor") values (9, 16, CURRENT_DATE + interval '7 day', 2, 4);
insert into Participants (eid, "time", "date", room, "floor") values (10, 16, CURRENT_DATE + interval '7 day', 2, 4);


-- Initialize Updates
insert into Updates ("date", room, "floor", capacity, eid) values (CURRENT_DATE - interval '3 day', 1, 1, 8, 36);
insert into Updates ("date", room, "floor", capacity, eid) values (CURRENT_DATE - interval '3 day', 2, 1, 8, 36);
insert into Updates ("date", room, "floor", capacity, eid) values (CURRENT_DATE - interval '3 day', 3, 1, 8, 36);
insert into Updates ("date", room, "floor", capacity, eid) values (CURRENT_DATE - interval '3 day', 4, 1, 8, 36);
insert into Updates ("date", room, "floor", capacity, eid) values (CURRENT_DATE - interval '3 day', 5, 1, 8, 36);
insert into Updates ("date", room, "floor", capacity, eid) values (CURRENT_DATE - interval '3 day', 1, 2, 8, 37);
insert into Updates ("date", room, "floor", capacity, eid) values (CURRENT_DATE - interval '3 day', 2, 2, 8, 37);
insert into Updates ("date", room, "floor", capacity, eid) values (CURRENT_DATE - interval '3 day', 3, 2, 8, 37);
insert into Updates ("date", room, "floor", capacity, eid) values (CURRENT_DATE - interval '3 day', 4, 2, 8, 37);
insert into Updates ("date", room, "floor", capacity, eid) values (CURRENT_DATE - interval '3 day', 5, 2, 8, 37);
insert into Updates ("date", room, "floor", capacity, eid) values (CURRENT_DATE - interval '3 day', 1, 3, 8, 38);
insert into Updates ("date", room, "floor", capacity, eid) values (CURRENT_DATE - interval '3 day', 2, 3, 8, 38);
insert into Updates ("date", room, "floor", capacity, eid) values (CURRENT_DATE - interval '3 day', 3, 3, 8, 38);
insert into Updates ("date", room, "floor", capacity, eid) values (CURRENT_DATE - interval '3 day', 4, 3, 8, 38);
insert into Updates ("date", room, "floor", capacity, eid) values (CURRENT_DATE - interval '3 day', 5, 3, 8, 38);
insert into Updates ("date", room, "floor", capacity, eid) values (CURRENT_DATE - interval '3 day', 1, 4, 8, 39);
insert into Updates ("date", room, "floor", capacity, eid) values (CURRENT_DATE - interval '3 day', 2, 4, 8, 39);
insert into Updates ("date", room, "floor", capacity, eid) values (CURRENT_DATE - interval '3 day', 3, 4, 8, 39);
insert into Updates ("date", room, "floor", capacity, eid) values (CURRENT_DATE - interval '3 day', 4, 4, 8, 39);
insert into Updates ("date", room, "floor", capacity, eid) values (CURRENT_DATE - interval '3 day', 5, 4, 8, 39);
insert into Updates ("date", room, "floor", capacity, eid) values (CURRENT_DATE - interval '3 day', 1, 5, 8, 40);
insert into Updates ("date", room, "floor", capacity, eid) values (CURRENT_DATE - interval '3 day', 2, 5, 8, 40);
insert into Updates ("date", room, "floor", capacity, eid) values (CURRENT_DATE - interval '3 day', 3, 5, 8, 40);
insert into Updates ("date", room, "floor", capacity, eid) values (CURRENT_DATE - interval '3 day', 4, 5, 8, 40);
insert into Updates ("date", room, "floor", capacity, eid) values (CURRENT_DATE - interval '3 day', 5, 5, 8, 40);

