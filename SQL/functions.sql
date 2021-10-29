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

CREATE OR REPLACE FUNCTION search_room(IN cap INT, IN "date" DATE, IN start_hour INT, IN end_hour INT)
RETURNS TABLE("floor" INT, room INT, dept INT, cap INT) AS 
DECLARE
	hour = start_hour;
$$ BEGIN
	while hour <= end_hour LOOP
		/* TODO */
	END LOOP;
END; $$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION book_room(IN "floor" INT, IN room INT, IN "date" DATE, IN start_hour INT, IN end_hour INT, IN eid INT)
RETURNS VOID AS 
/* TODO TRIGGER TO CHECK AVAILABILITY */
/* TODO CHECK EMPLOYEE IS MANAGER/SENIOR */
/* TODO EMPLOYEE CANNOT BOOK IF FEVER */
$$ BEGIN
	INSERT INTO "Sessions" VALUES (start_hour, "date", room, "floor", eid, NULL);
END; $$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION unbook_room(IN "floor" INT, IN room INT, IN "date" DATE, IN start_hour INT, IN end_hour INT, IN eid INT)
RETURNS VOID AS 

$$ BEGIN
	DELETE FROM "Sessions" WHERE ("time" = start_hour AND "date" = "date" AND room = room AND "floor" = "floor" AND bid = eid);
END; $$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION join_meeting(IN "floor" INT, IN room INT, IN "date" DATE, IN start_hour INT, IN end_hour INT, IN eid INT)
RETURNS VOID AS 
/* TODO TRIGGER TO CHECK SESSION NOT APPROVED, NO MORE CHANGES AFTER APPROVE */
/* TODO TRIGGER TO CHECK CAP */
/* TODO TRIGGER TO CHECK EMPLOYEE NO FEVER */
$$ BEGIN
	INSERT INTO Participants VALUES (eid, start_hour, "date", room, "floor");
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
/* DONE */
CREATE OR REPLACE FUNCTION non_compliance
	(IN start_date DATE, IN end_date DATE)
RETURNS TABLE(eid INT, count BIGINT) AS $$
#variable_conflict use_column
DECLARE
	days INT := end_date - start_date + 1;	
BEGIN
	return query 
	SELECT eid, days - COUNT(*) as count /* days is the 'correct' number of entries. count(*) is number of entries. we take the difference */
	FROM HealthDeclaration
	WHERE date >= start_date
	AND date <= end_date
	GROUP BY eid 
	HAVING COUNT(*) <> days/* exclude employees who have the 'correct' number of entries. */
	ORDER BY count DESC ; /* order by decreasing number of days, as stipulated */
	
END; 
$$ LANGUAGE plpgsql;


/* DONE */
/* This function doesn't change approval status to boolean. Hence approved status is determined by whether the 'approved' column is NULL (not approved) or an integer (approved) */
CREATE OR REPLACE FUNCTION view_booking_report
	(IN start_date DATE, IN eid INT) 
RETURNS TABLE ("floor" INT, room INT, "date" DATE, hour INT, approved INT) AS $$
#variable_conflict use_column
BEGIN
RETURN QUERY WITH SessionsRaw AS (
		SELECT "floor", room, "date", "time", approver
		FROM "Sessions" s
		WHERE s.bid = eid
		AND s."date" >= start_date
	)
	SELECT *
	FROM SessionsRaw  
	ORDER BY "date", "time"; /* order by date and times in ascending order, as stipulated */
END; 
$$ LANGUAGE plpgsql;

/* DONE */
/* participants table contains all approved meetings already, hence no need to check if approved anot */
/* note input eid is defined as eid1. This is to avoid p.eid = eid in the query, which will reference p.eid itself i.e simply returns meetings from start_date on and ignoring input eid */
CREATE OR REPLACE FUNCTION view_future_meeting
	(IN start_date DATE, IN eid1 INT)
RETURNS TABLE ("floor" INT, room INT, "date" DATE, start_hour INT) AS $$
#variable_conflict use_column
BEGIN
RETURN QUERY
SELECT floor,room, date, time
FROM participants p
WHERE p.eid = eid1
AND p.date >= start_date
ORDER BY date, time;
END; 
$$ LANGUAGE plpgsql;

/* DONE */
CREATE OR REPLACE FUNCTION view_manager_report
	(IN start_date DATE, eid1 INT)
RETURNS TABLE(floor INT, room INT, date DATE, start_hour INT, eid INT) AS $$ 
#variable_conflict use_column
/* no need for trigger : query will naturally return empty table if ied is not that of a manager's */
DECLARE
	m_did INT := (SELECT did FROM employees NATURAL JOIN manager WHERE eid = eid1); /* get manager's dept id */
BEGIN
RETURN QUERY /*WITH ManagerInfo AS (select * from employees natural join manager where eid = eid1)*/
SELECT floor, room, date, time, bid
FROM "Sessions" natural join meetingrooms
WHERE did = m_did
AND date >= start_date
AND approver ISNULL ;
	
END; 
$$ LANGUAGE plpgsql;