DROP DATABASE IF EXISTS cs2102_project;
CREATE DATABASE cs2102_project;

\c cs2102_project

DROP TABLE IF EXISTS	
	Employees, Departments, Junior, Booker, Senior, Manager, MeetingRooms, Updates, "Sessions", Participants, HealthDeclaration CASCADE;

CREATE TABLE Departments (
	did INT,
	dname TEXT,
	PRIMARY KEY (did)
);

CREATE TABLE Employees (
	eid INT,
	ename TEXT,
	email TEXT UNIQUE,
	home INT,
	phone INT,
	office INT,
	resign DATE DEFAULT NULL,
	did INT NOT NULL,
	PRIMARY KEY(eid),
	FOREIGN KEY (did) REFERENCES Departments (did)
);

CREATE TABLE Junior (
	eid INT,
	PRIMARY KEY(eid),
	FOREIGN KEY (eid) REFERENCES Employees (eid)
);

CREATE TABLE Booker (
	eid INT,
	PRIMARY KEY(eid),
	FOREIGN KEY (eid) REFERENCES Employees (eid)
);

CREATE TABLE Senior (
	eid INT,
	PRIMARY KEY(eid),
	FOREIGN KEY (eid) REFERENCES Booker (eid)
);

CREATE TABLE Manager (
	eid INT,
	PRIMARY KEY(eid),
	FOREIGN KEY (eid) REFERENCES Booker (eid)
);


CREATE TABLE MeetingRooms(
	room INT,
	"floor" INT, 
	rname TEXT,
	did INT NOT NULL,
	PRIMARY KEY(room, "floor"),
	FOREIGN KEY (did) REFERENCES Departments (did)
);

CREATE TABLE Updates ( /* Store all updates */
	"date" DATE,
	room INT,
	"floor" INT,
	capacity INT, /* The capacity as of the stated date */
	eid INT, /* The manager who made the update */
	PRIMARY KEY("date", "floor", room),
	FOREIGN KEY ("floor", room) REFERENCES MeetingRooms("floor", room),
	FOREIGN KEY (eid) REFERENCES Manager (eid)
);

CREATE TABLE "Sessions" (
	"time" INT, /* 24HR Format (I.E 0600,1400) */
	"date" DATE,
	room INT,
	"floor" INT, 
	bid INT NOT NULL, /* Person who booked the session */
	approver INT DEFAULT NULL, /* The manager who approved the session */
	PRIMARY KEY("time", "date", room, "floor"), 
	FOREIGN KEY (bid) REFERENCES Booker (eid), 
	FOREIGN KEY (room, "floor") REFERENCES MeetingRooms 
) ;

CREATE TABLE Participants ( /* Each entry is a participant for a certain session */
	eid INT,
	"time" INT,
	"date" DATE,
	room INT,
	"floor" INT,
	PRIMARY KEY(eid, "time", "date", room, "floor"),
	FOREIGN KEY ("time", "date", room, "floor") REFERENCES "Sessions" ("time", "date", room, "floor")
);

CREATE TABLE HealthDeclaration (
	eid INT,
	"date" DATE,
	temp FLOAT,
	fever BOOLEAN, /* FEVER > 37.5 in declareHealth function */
	PRIMARY KEY(eid, "date"),
	FOREIGN KEY(eid) REFERENCES Employees(eid)
);