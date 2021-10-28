\c cs2102_project

/* TODO Create Trigger Functions */
-- BASIC
CREATE OR REPLACE FUNCTION add_department(IN id INT, IN dpt_name TEXT)
RETURNS VOID AS 
$$ BEGIN
	INSERT INTO Departments VALUES (id, dpt_name);

END; $$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION remove_department(IN id INT)
RETURNS VOID AS 

$$ BEGIN
	DELETE FROM Departments WHERE did = id;

END; $$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION add_room(IN floor_num INT, IN room_num INT, IN room_name TEXT, IN capacity INT, IN dept_id INT, IN manager_id INT)
RETURNS VOID AS 

$$ BEGIN
	INSERT INTO MeetingRooms VALUES (room_num, floor_num, room_name, dept_id),
	INSERT INTO Updates VALUES (GETDATE(), room_num, floor_num, capacity, manager_id);

END; $$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION change_capacity(IN room_num INT, IN room_name TEXT, IN manager_id INT, IN new_capacity INT, IN curr_date DATE)
RETURNS VOID AS 

$$ BEGIN
	INSERT INTO Updates VALUES (curr_date, room_num, floor_num, new_capacity, manager_id);

END; $$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION add_employee(IN eid INT, IN ename TEXT, IN email TEXT, IN home INT, IN phone INT, IN office INT, IN did INT)
RETURNS VOID AS 

$$ BEGIN
	INSERT INTO Employees VALUES (eid, ename, email, home, phone, office, NULL, did);
END; $$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION remove_employee(INT del_eid)
RETURNS VOID AS 

$$ BEGIN
	DELETE FROM Employees WHERE eid = del_eid;
END; $$ LANGUAGE plpgsql;


-- CORE
DROP FUNCTION IF EXISTS 
	search_room, book_room, unbook_room, join_meeting, leave_meeting, approve_meeting;

CREATE OR REPLACE FUNCTION search_room(IN cap INT, IN "date" DATE, IN start_hour INT, IN end_hour INT)
RETURNS TABLE("floor" INT, room INT, dept INT, cap INT) AS 
DECLARE
	hour = start_hour;
$$ BEGIN
	while hour <= end_hour LOOP
		/* TODO ANYONE HAS ANY IDEA???*/
	END LOOP;
END; $$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION book_room(IN "floor" INT, IN room INT, IN "date" DATE, IN start_hour INT, IN end_hour INT, IN eid INT)
RETURNS VOID AS 
/* TODO TRIGGER TO CHECK AVAILABILITY */
/* TODO CHECK EMPLOYEE IS MANAGER/SENIOR */
DECLARE
	-- CHECK IF ADDING A FEVER PERSON, NO FEVER THEN ADD
	fever BOOLEAN := SELECT fever FROM HealthDeclaration 
					WHERE eid = eid AND "date" = CURRENT_DATE();
$$ BEGIN
	IF (fever = 0) THEN INSERT INTO "Sessions" VALUES (start_hour, "date", room, "floor", eid, NULL);
END; $$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION unbook_room(IN "floor" INT, IN room INT, IN "date" DATE, IN start_hour INT, IN end_hour INT, IN eid INT)
RETURNS VOID AS 
DECLARE
	/* TODO CHECK SYNTAX (ACTUALLY NEED CHECK? IF THE BID NOT THE PERSON THEN NO ENTRY TO REMOVE?) */
	booker INT := COALESCE(SELECT bid FROM "Sessions" WHERE ("time" = start_hour AND "date" = "date" AND room = room AND "floor" = "floor" AND bid = eid),0);
$$ BEGIN
	DELETE FROM "Sessions" WHERE ("time" = start_hour AND "date" = "date" AND room = room AND "floor" = "floor" AND bid = eid);
	IF (booker!=0) THEN DELETE FROM Participants WHERE ("time" = start_hour AND "date" = "date" AND room = room AND "floor" = "floor");
	END IF;
END; $$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION join_meeting(IN "floor" INT, IN room INT, IN "date" DATE, IN start_hour INT, IN end_hour INT, IN eid INT)
RETURNS VOID AS 
/* TODO TRIGGER TO CHECK CAP : CANNOT GET CAP , HOW TO GET DATE? */
DECLARE
	-- CHECK IF ADDING A FEVER PERSON, NO FEVER THEN ADD
	fever BOOLEAN := SELECT fever FROM HealthDeclaration 
					WHERE eid = eid AND "date" = CURRENT_DATE();
	-- CHECK IF MEETING IS APPROVED, 0 MEANS NOT APPROVED YET
	approver INT := SELECT COALESCE(approver,0) FROM "Sessions" 
					WHERE "time" = start_hour AND "date" = "date" AND room = room AND "floor" = "floor";
	-- FIND TOTAL NUMBER CURRENTLY IN MEETING, NEED TO CHECK AGAINST CAP LATER
	participants INT := SELECT COUNT(*) FROM "Participants" 
					WHERE "time" = start_hour AND "date" = "date" AND room = room AND "floor" = "floor";
$$ BEGIN
	/* TODO CHECK IF THIS SYNTAX CORRECT */
	IF (fever = 0) AND (approver = 0) THEN INSERT INTO Participants VALUES (eid, start_hour, "date", room, "floor");
	END IF;
END; $$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION leave_meeting(IN "floor" INT, IN room INT, IN "date" DATE, IN start_hour INT, IN end_hour INT, IN eid INT)
RETURNS VOID AS 
/* TODO TRIGGER TO CHECK SESSION NOT APPROVED, NO MORE CHANGES AFTER APPROVE */
$$ BEGIN
	DELETE FROM Participants WHERE ("time" = start_hour AND "date" = "date" AND room = room AND "floor" = "floor" AND eid = eid);
END; $$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION approve_meeting(IN "floor" INT, IN room INT, IN "date" DATE, IN start_hour INT, IN end_hour INT, IN mid INT)
RETURNS VOID AS 
/* TODO TRIGGER TO CHECK MANAGER AND BOOKER SAME DEPT */
DECLARE
	booker INT := SELECT bid FROM "Sessions" WHERE  ("time" = start_hour AND "date" = "date" AND room = room AND "floor" = "floor");
$$ BEGIN
	UPDATE "Sessions"
	SET approver = mid
	WHERE ("time" = start_hour AND "date" = "date" AND room = room AND "floor" = "floor" AND bid = booker);
END; $$ LANGUAGE plpgsql;


-- HEALTH
DROP TRIGGER IF EXISTS 
	fever_check ON HealthDeclaration CASCADE;

DROP FUNCTION IF EXISTS 
	update_fever_status, declare_health, contact_tracing;


CREATE OR REPLACE FUNCTION update_fever_status()
RETURNS TRIGGER AS $$
BEGIN
	IF (temp > 37.5) THEN SET NEW.fever = TRUE;
	END IF;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER fever_check
AFTER INSERT ON HealthDeclaration
FOR EACH STATEMENT EXECUTE FUNCTION update_fever_status();

CREATE OR REPLACE FUNCTION declare_health
	(IN employee_id INT, IN declaration_date DATE, IN temperature FLOAT)
RETURNS VOID AS $$ 
BEGIN
	INSERT INTO HealthDeclaration(eid, "date", temp) VALUES(employee_id, declaration_date, temperature);
END; 
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION contact_tracing()
RETURNS VOID AS 

$$ BEGIN

END; $$ LANGUAGE plpgsql;


-- ADMIN

CREATE OR REPLACE FUNCTION non_compliance
	(IN start_date DATE, IN end_date, OUT eid INT, OUT count INT)
RETURNS RECORD AS $$
DECLARE
	days INT := DATEDIFF(day, start_date, end_date);
BEGIN
	SELECT eid, days - COUNT(*) as count /* days is the 'correct' number of entries. count(*) is number of actual entries. we take the difference */
	FROM HealthDeclaration
	WHERE "date" >= start_date
	AND "data" <= end_date
	GROUP BY eid 
	HAVING COUNT(*) = days /* exclude employees who have the 'correct' number of entries. */
END; 
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION view_booking_report
	(IN start_date DATE, eid INT, OUT "floor" INT, OUT room INT, OUT "date" DATE, hour INT, status BOOLEAN)
$$ BEGIN

	/* get temporary table first, then update values accordingly */
	WITH SessionsRaw AS (
		SELECT "floor", room, "date", "time", approver
		FROM "Sessions" s
		WHERE s.eid = eid
		AND s."date" >= "date"
	)
	UPDATE SessionsRaw SET approver = "Approved" WHERE approver IS NOT NULL /* for sessions approved */
	UPDATE SessionsRaw SET approver = "Not Approved" WHERE approver IS NULL /* for sessions not approved */
	UPDATE SessionsRaw SET "date" = DATEPART(hour, "date") /* replace full date with hour only */
	
	SELECT *
	FROM SessionsRaw  
	ORDER BY "date", "time"
END; $$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION view_future_meeting()
RETURNS VOID AS 

$$ BEGIN

END; $$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION view_manager_report()
RETURNS VOID AS 

$$ BEGIN

END; $$ LANGUAGE plpgsql;