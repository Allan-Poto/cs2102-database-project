\c cs2102_project

/* TODO Create Trigger Functions */
-- BASIC
DROP FUNCTION IF EXISTS add_department, remove_department, add_room, change_capacity, add_employee, remove_employee; 
CREATE OR REPLACE FUNCTION add_department(IN id INT, IN dpt_name TEXT)
RETURNS VOID AS 
$$ BEGIN
	INSERT INTO Departments VALUES (id, dpt_name);

END; $$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION remove_department(IN id INT)
RETURNS VOID AS 

$$ BEGIN
	/*TODO Changing all MeetingRooms to be under Department 0 (HR/Management - report)*/
	/*TODO Checking no employees under department*/
	DELETE FROM Departments WHERE did = id;

END; $$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION add_room(IN floor_num INT, IN room_num INT, IN room_name TEXT, IN capacity INT, IN dept_id INT, IN manager_id INT)
RETURNS VOID AS 

$$ BEGIN
	INSERT INTO MeetingRooms VALUES (room_num, floor_num, room_name, dept_id),
<<<<<<< HEAD
	INSERT INTO Updates VALUES ((SELECT CURRENT_DATE), room_num, floor_num, capacity, manager_id);
=======
	/*TODO Check that ID belongs to a manager*/
	INSERT INTO Updates VALUES (GETDATE(), room_num, floor_num, capacity, manager_id);
>>>>>>> 362996055b1e0dc160b94d7bebe7963b75938cba

END; $$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION change_capacity(IN room_num INT, IN room_name TEXT, IN manager_id INT, IN new_capacity INT, IN curr_date DATE)
RETURNS VOID AS 

$$ BEGIN
	/*TODO Add in date_of_effect_of_update, check the date is not before today*/
	/*TODO Must be a MANAGER*/
	INSERT INTO Updates VALUES (curr_date, room_num, floor_num, new_capacity, manager_id);

END; $$ LANGUAGE plpgsql;


/*TODO Remove eid, email, home, office*/
/*TODO Add in KIND (JUNIOR, SENIOR, MANAGER, BOOKER) -> Update their respective table*/
/*TODO Create function to update employee info */
/* */
CREATE OR REPLACE FUNCTION add_employee(IN eid INT, IN ename TEXT, IN email TEXT, IN home INT, IN phone INT, IN office INT, IN did INT)
RETURNS VOID AS 

$$ BEGIN
	INSERT INTO Employees VALUES (eid, ename, email, home, phone, office, NULL, did);
END; $$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION remove_employee(INT del_eid)
RETURNS VOID AS 

$$ BEGIN
<<<<<<< HEAD
	

=======
	/*TODO RESIGN -> 
	they are no longer allowed to book or approve any meetings rooms. Additionally, any future records (e.g., future
meetings) are removed.*/
	DELETE FROM Employees WHERE eid = del_eid;
>>>>>>> 362996055b1e0dc160b94d7bebe7963b75938cba
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
AND approver ISNULL ;
	
END; 
$$ LANGUAGE plpgsql;