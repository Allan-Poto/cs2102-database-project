\c cs2102_project

/* TODO Create Trigger Functions */
-- BASIC
DROP FUNCTION IF EXISTS add_department, remove_department, add_room,
 change_capacity, add_employee, remove_employee, update_room_did, update_enfo; 

DROP TRIGGER IF EXISTS room_existance ON MeetingRooms;
DROP TRIGGER IF EXISTS resign_meetings ON Employees;

CREATE OR REPLACE FUNCTION add_department(IN id INT, IN dpt_name TEXT)
RETURNS VOID AS 
$$ BEGIN
	INSERT INTO Departments VALUES (id, dpt_name);

END; $$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION remove_department(IN id INT)
RETURNS VOID AS 
$$ BEGIN
	/*TODO Checking no employees under department*/
	IF (id IN (SELECT DISTINCT did FROM Employees)) THEN RAISE EXCEPTION 'Employees with current department id still exist';

	/*TODO Changing all MeetingRooms to be under Department 0 (HR/Management - report)*/
	ELSE UPDATE MeetingRooms SET did = 0 WHERE did = id;	

	DELETE FROM Departments WHERE did = id;
	END IF;
END; $$ LANGUAGE plpgsql;



CREATE OR REPLACE FUNCTION add_room(IN floor_num INT, IN room_num INT, IN room_name TEXT, IN capacity INT, IN dept_id INT, IN manager_id INT)
RETURNS VOID AS 
$$ BEGIN
	
	INSERT INTO MeetingRooms VALUES (room_num, floor_num, room_name, dept_id);
	INSERT INTO Updates VALUES ((SELECT CURRENT_DATE), room_num, floor_num, capacity, manager_id);

END; $$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION check_room_existance() RETURNS TRIGGER AS $$
BEGIN
	/*TODO check if current floor and room is alr occupied. if not, then insert*/
	IF (SELECT COUNT(*) FROM MeetingRooms WHERE room = room_num AND "floor" = floor_num) != 0 
	THEN RAISE EXCEPTION 'Specified Room already exists';
	END IF;
END; $$ LANGUAGE plpgsql;

CREATE TRIGGER room_existance
BEFORE INSERT ON MeetingRooms
FOR EACH STATEMENT EXECUTE FUNCTION check_room_existance();

/*TODO update_room*/
CREATE OR REPLACE FUNCTION update_room_did(IN room_num INT, IN floor_num INT, IN new_did INT) 
RETURNS VOID AS $$
BEGIN
	UPDATE MeetingRooms set did = new_did WHERE room = room_num AND "floor" = floor_num;
END; $$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION change_capacity(IN floor_num INT, IN room_num TEXT, IN manager_id INT, IN new_capacity INT, IN curr_date DATE, 
IN change_date DATE)
RETURNS VOID AS 
$$ BEGIN
	/*TODO Add in date_of_effect_of_update, check the date is not before today*/
	IF change_date <= curr_date THEN RAISE EXCEPTION 'Date is in the past';
	/*TODO Must be a MANAGER*/
	ELSEIF manager_id NOT IN (SELECT eid FROM Manager) THEN RAISE EXCEPTION 'Employee is not a Manager';
	
	ELSE 
	INSERT INTO Updates VALUES (change_date, room_num, floor_num, new_capacity, manager_id);
	/*TODO remove all sessions that have more participants higher than new capacity*/
	DELETE FROM "Sessions"
	WHERE room = room_num 
	AND "floor" = floor_num 
	AND "date" >= change_date 
	AND "time" IN(  SELECT ref."time"
				    FROM (SELECT COUNT(eid) AS total_participants, "time", "date", room, "floor"
		                 FROM Participants
						 GROUP BY "time", "date", room, "floor") AS ref 
					WHERE ref."date" >= change_date
					AND ref.room = room_num
					AND ref."floor" = floor_num
					AND ref.total_participants > new_capacity);
	END IF;
END; $$ LANGUAGE plpgsql;

/*TODO Remove eid, email*/
/*TODO Add in KIND (JUNIOR, SENIOR, MANAGER, BOOKER) -> Update their respective table*/
CREATE OR REPLACE FUNCTION add_employee(IN ename TEXT, IN home INT, IN phone INT, IN office INT, IN did INT, IN e_kind TEXT /*J or S or M*/)
RETURNS VOID AS $$
DECLARE
	email TEXT := '';
	eid INT := 0;
BEGIN
	eid := (SELECT MAX(eid) FROM Employees) + 1;
	email := (SELECT CONCAT(ename, eid, '@ilovenus.com'));
	INSERT INTO Employees VALUES (eid, ename, email, home, phone, office, NULL, did, NULL);
	IF (e_kind = 'J') THEN INSERT INTO Junior VALUES(eid);
	ELSEIF (e_kind = 'S') THEN INSERT INTO Senior VALUES(eid);
	ELSEIF (e_kind = 'M') THEN INSERT INTO Manager VALUES(eid);	
	ELSE RAISE EXCEPTION 'Invalid Employee Type';
	END IF;
END; $$ LANGUAGE plpgsql;

/*TODO Create function to update employee info */
CREATE OR REPLACE FUNCTION update_enfo(IN change_type TEXT, IN new_value INT, IN eid_to_change INT) /*change type - home(H), phone(P), office(O), did(D)*/
RETURNS VOID AS $$
BEGIN
	IF (change_type = 'H') THEN UPDATE Employees SET home = new_value WHERE eid = eid_to_change;
	ELSEIF (change_type = 'P') THEN UPDATE Employees SET phone = new_value WHERE eid = eid_to_change;
	ELSEIF (change_type = 'O') THEN UPDATE Employees SET office = new_value WHERE eid = eid_to_change;
	ELSEIF (change_type = 'D') THEN UPDATE Employees SET did = new_value WHERE eid = eid_to_change;
	ELSE RAISE EXCEPTION 'Invalid variable type input';
	END IF;
END; $$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION remove_employee(IN del_eid INT)
RETURNS VOID AS 
$$ BEGIN
	UPDATE Employees 
	SET resign = (SELECT(CURRENT_DATE))
	WHERE eid = del_eid;	
END; $$ LANGUAGE plpgsql;

/*TODO RESIGN -> 
	they are no longer allowed to book or approve any meetings rooms. Additionally, any future records (e.g., future
meetings) are removed. create tigger to auto do this after employee remove*/
CREATE OR REPLACE FUNCTION resign_from_meetings() RETURNS TRIGGER AS $$
BEGIN
	IF (NEW.resign IS NOT NULL) THEN DELETE FROM Participants WHERE eid = NEW.eid AND "date" >= (SELECT(CURRENT_DATE));
	END IF;
END; $$ LANGUAGE plpgsql;

CREATE TRIGGER resign_meetings
AFTER UPDATE ON Employees
FOR EACH ROW EXECUTE FUNCTION resign_from_meetings();

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
/* TODO CHECK EMPLOYEE IS MANAGER/SENIOR AND CHECK IF PERSON ALR RESIGNED*/
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
/* TODO TRIGGER TO CHECK MANAGER AND BOOKER SAME DEPT AND WHETHER MANAGER IS RESIGNED*/
DECLARE
	booker INT := SELECT bid FROM "Sessions" WHERE  ("time" = start_hour AND "date" = "date" AND room = room AND "floor" = "floor");
$$ BEGIN
	UPDATE "Sessions"
	SET approver = mid
	WHERE ("time" = start_hour AND "date" = "date" AND room = room AND "floor" = "floor" AND bid = booker);
END; $$ LANGUAGE plpgsql;


-- HEALTH
DROP TRIGGER IF EXISTS 
	fever_update ON HealthDeclaration CASCADE;
DROP TRIGGER IF EXISTS	
	fever_check ON HealthDeclaration CASCADE;

DROP FUNCTION IF EXISTS 
	update_fever_status, declare_health, update_contact_tracing, contact_tracing CASCADE;

CREATE OR REPLACE FUNCTION update_fever_status()
RETURNS TRIGGER AS $$
BEGIN
	IF (NEW.temp > 37.5) THEN NEW.fever := true;
	ELSE NEW.fever := false;
	END IF;
	RETURN NEW;
END; $$ LANGUAGE plpgsql;

CREATE TRIGGER fever_update
BEFORE INSERT ON HealthDeclaration
FOR EACH ROW EXECUTE FUNCTION update_fever_status();

CREATE OR REPLACE FUNCTION declare_health
	(IN employee_id INT, IN declaration_date DATE, IN temperature FLOAT)
RETURNS VOID AS $$ 
BEGIN
	INSERT INTO HealthDeclaration(eid, "date", temp) VALUES(employee_id, declaration_date, temperature);
END; $$ LANGUAGE plpgsql;

/*TODO Update status of those with close contact in the event of fever, including canceling meeting etc*/ 
CREATE OR REPLACE FUNCTION update_contact_tracing()
RETURNS TRIGGER AS $$
BEGIN
	/*TODO Remove employee from all future meetings -> Participants List*/
	/*TODO Cancel room booked by this employee -> remove Session*/
	/*TODO Edit exposure end_date for close contacts*/
	/*TODO Remove employees contacted from meeting for next 7 days*/
END; $$ LANGUAGE plpgsql; 

CREATE TRIGGER fever_check
AFTER INSERT ON HealthDeclaration
EXECUTE FUNCTION update_contact_tracing();

CREATE OR REPLACE FUNCTION contact_tracing
	(IN employee_id INT, IN trace_from DATE)
RETURNS TABLE(contacted INT) AS 
$$ BEGIN
	/*Check if health declaration was done by the employee*/
	IF (SELECT EXISTS(SELECT 1 FROM HealthDeclaration WHERE eid = employee_id AND "date" = trace_from)) THEN 
		IF(SELECT EXISTS(SELECT 1 FROM HealthDeclaration WHERE eid = employee_id AND "date" = trace_from AND fever = true)) THEN
			CREATE TEMP TABLE contacted AS  
				/*FIXME Not returning the correct values for any date other than '2021-10-29'*/
				WITH meetings_attended AS ( 
					SELECT "time", "date", room, "floor" 
					FROM Participants 
					WHERE eid = employee_id AND ("date" BETWEEN trace_from - interval '3 day' AND trace_from) 
				) 
				SELECT DISTINCT eid 
				FROM Participants p LEFT JOIN meetings_attended ma
				ON p."time" = ma."time" AND p."date" = ma."date" 
				AND p.room = ma.room AND p."floor" = ma."floor"
			;
			RETURN QUERY SELECT * FROM contacted;
			DROP TABLE IF EXISTS contacted;
		END IF;
	END IF;
END; 
$$ LANGUAGE plpgsql;

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
AND approver IS NULL ;
	
END; 
$$ LANGUAGE plpgsql;