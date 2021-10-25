/* TODO Create Trigger Functions */
-- BASIC

CREATE OR REPLACE FUNCTION add_department(IN id INT, IN dpt_name TEXT)
RETURN VOID AS 

$$ BEGIN
	INSERT INTO Departments VALUES (id, dpt_name);

END; $$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION remove_department(IN id INT)
RETURN VOID AS 

$$ BEGIN
	DELETE FROM Departments WHERE did = id;

END; $$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION add_room(IN floor_num INT, IN room_num INT, IN room_name TEXT, IN capacity INT, IN dept_id INT, IN manager_id INT)
RETURN VOID AS 

$$ BEGIN
	INSERT INTO MeetingRooms VALUES (room_num, floor_num, room_name, dept_id),
	INSERT INTO Updates VALUES (GETDATE(), room_num, floor_num, capacity, manager_id);

END; $$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION change_capacity(IN room_num INT, IN room_name TEXT, IN manager_id INT, IN new_capacity INT, IN curr_date DATE)
RETURN VOID AS 

$$ BEGIN
	INSERT INTO Updates VALUES (curr_date, room_num, floor_num, new_capacity, manager_id);

END; $$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION add_employee(IN eid INT, IN ename TEXT, IN email TEXT, IN home INT, IN phone INT, IN office INT, IN did INT)
RETURN VOID AS 

$$ BEGIN
	INSERT INTO Employees VALUES (eid, ename, email, home, phone, office, NULL, did);
END; $$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION remove_employee(INT del_eid)
RETURN VOID AS 

$$ BEGIN
	DELETE FROM Employees WHERE eid = del_eid;
END; $$ LANGUAGE plpgsql;


-- CORE

CREATE OR REPLACE FUNCTION search_room()
RETURN VOID AS 

$$ BEGIN

END; $$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION book_room()
RETURN VOID AS 

$$ BEGIN

END; $$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION unbook_room()
RETURN VOID AS 

$$ BEGIN

END; $$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION join_meeting()
RETURN VOID AS 

$$ BEGIN

END; $$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION leave_meeting()
RETURN VOID AS 

$$ BEGIN

END; $$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION approve_meeting()
RETURN VOID AS 

$$ BEGIN

END; $$ LANGUAGE plpgsql;


-- HEALTH

CREATE OR REPLACE FUNCTION declare_health()
RETURN VOID AS 

$$ BEGIN

END; $$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION contact_tracing()
RETURN VOID AS 

$$ BEGIN

END; $$ LANGUAGE plpgsql;


-- ADMIN

CREATE OR REPLACE FUNCTION non_compliance
	(IN start_date DATE, IN end_date, OUT eid INT, OUT count INT)
RETURN RECORD AS $$
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
RETURN VOID AS 

$$ BEGIN

END; $$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION view_manager_report()
RETURN VOID AS 

$$ BEGIN

END; $$ LANGUAGE plpgsql;