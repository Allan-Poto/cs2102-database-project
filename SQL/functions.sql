/* TODO Create Trigger Functions */
-- BASIC

CREATE OR REPLACE FUNCTION add_department(id INTEGER, dpt_name TEXT)
RETURN VOID AS 
	INSERT INTO Departments VALUES (id, dpt_name);
$$ BEGIN

END; $$ LANGUAGE plpgsql;

/* shutup*/

CREATE OR REPLACE FUNCTION remove_department(id INTEGER)
RETURN VOID AS 

$$ BEGIN

END; $$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION add_room(floor_num INTEGER, room_num INTEGER, room_name TEXT, room_cap INTEGER)
RETURN VOID AS 

$$ BEGIN

END; $$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION change_capacity()
RETURN VOID AS 

$$ BEGIN

END; $$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION add_employee()
RETURN VOID AS 

$$ BEGIN

END; $$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION remove_employee()
RETURN VOID AS 

$$ BEGIN

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

CREATE OR REPLACE FUNCTION non_compliance()
RETURN VOID AS 

$$ BEGIN

END; $$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION view_booking_report()
RETURN VOID AS 

$$ BEGIN

END; $$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION view_future_meeting()
RETURN VOID AS 

$$ BEGIN

END; $$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION view_manager_report()
RETURN VOID AS 

$$ BEGIN

END; $$ LANGUAGE plpgsql;