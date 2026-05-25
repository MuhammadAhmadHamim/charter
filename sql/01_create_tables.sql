CREATE TABLE FacultyAdvisor(
    Advisor_ID NUMBER GENERATED ALWAYS AS IDENTITY,
    Name VARCHAR2(100) NOT NULL,
    Email VARCHAR2(100) NOT NULL,
    Department VARCHAR2(100) NOT NULL,
    Phone VARCHAR2(20) NOT NULL,

    PRIMARY KEY (Advisor_ID),
    UNIQUE (Email)
);

CREATE TABLE Club(
    Club_ID NUMBER GENERATED ALWAYS AS IDENTITY,
    Club_Name VARCHAR2(100) NOT NULL,
    Category VARCHAR2(50) NOT NULL,
    FoundedDate DATE NOT NULL,
    Description VARCHAR2(500) NOT NULL,
    Status VARCHAR2(20) NOT NULL,

    Advisor_ID NUMBER NOT NULL,

    PRIMARY KEY (Club_ID),
    FOREIGN KEY (Advisor_ID) REFERENCES FacultyAdvisor(Advisor_ID),

    CONSTRAINT chk_club_status CHECK (Status IN ('Active', 'Inactive'))
);

CREATE TABLE Member(
    Member_ID NUMBER GENERATED ALWAYS AS IDENTITY,
    Name VARCHAR2(100) NOT NULL,
    Email VARCHAR2(100) NOT NULL,
    Phone VARCHAR2(20) NOT NULL,
    Degree VARCHAR2(100) NOT NULL,
    Semester NUMBER NOT NULL,
    Status VARCHAR2(20) NOT NULL,

    PRIMARY KEY (Member_ID),
    UNIQUE (Email),
    CONSTRAINT chk_member_status CHECK (Status IN ('Active', 'Alumni', 'Suspended'))
);

CREATE TABLE Role(
    Role_ID NUMBER GENERATED ALWAYS AS IDENTITY,
    RoleName VARCHAR2(50) NOT NULL,
    Permissions VARCHAR2(200),

    PRIMARY KEY (Role_ID)
);

CREATE TABLE Membership(
    Membership_ID NUMBER GENERATED ALWAYS AS IDENTITY,
    JoinDate DATE NOT NULL,
    EndDate DATE,
    Member_ID NUMBER NOT NULL,
    Club_ID NUMBER NOT NULL,
    Role_ID NUMBER NOT NULL,

    PRIMARY KEY (Membership_ID),
    FOREIGN KEY (Member_ID) REFERENCES Member(Member_ID),
    FOREIGN KEY (Club_ID) REFERENCES Club(Club_ID),
    FOREIGN KEY (Role_ID) REFERENCES Role(Role_ID)
);

CREATE TABLE Venue(
    Venue_ID NUMBER GENERATED ALWAYS AS IDENTITY,
    VenueName VARCHAR2(100) NOT NULL,
    Location VARCHAR2(200) NOT NULL,
    Capacity NUMBER NOT NULL,
    Facilities VARCHAR2(300),
    IsAvailable VARCHAR2(5) NOT NULL,

    PRIMARY KEY (Venue_ID),
    CONSTRAINT chk_venue_available CHECK (IsAvailable IN ('YES', 'NO'))
);

CREATE TABLE Sponsor(
    Sponsor_ID NUMBER GENERATED ALWAYS AS IDENTITY,
    SponsorName VARCHAR2(100) NOT NULL,
    ContactPerson VARCHAR2(100) NOT NULL,
    Email VARCHAR2(100) NOT NULL,
    Phone VARCHAR2(20) NOT NULL,
    SponsorAmount NUMBER(10,2) NOT NULL,

    PRIMARY KEY (Sponsor_ID),
    UNIQUE (Email)
);

CREATE TABLE Event(
    Event_ID NUMBER GENERATED ALWAYS AS IDENTITY,
    Title VARCHAR2(150) NOT NULL,
    EventDate DATE NOT NULL,
    StartTime VARCHAR2(10) NOT NULL,
    EndTime VARCHAR2(10) NOT NULL,
    BudgetAllocated NUMBER(10,2) NOT NULL,
    EventType VARCHAR2(20) NOT NULL,
    Club_ID NUMBER NOT NULL,
    Venue_ID NUMBER NOT NULL,
    Sponsor_ID NUMBER,

    PRIMARY KEY (Event_ID),
    FOREIGN KEY (Club_ID) REFERENCES Club(Club_ID),
    FOREIGN KEY (Venue_ID) REFERENCES Venue(Venue_ID),
    FOREIGN KEY (Sponsor_ID) REFERENCES Sponsor(Sponsor_ID),
    CONSTRAINT chk_event_type CHECK (EventType IN ('Workshop', 'Competition', 'Meetup'))
);

CREATE TABLE Workshop(
    Event_ID NUMBER NOT NULL,
    Topic VARCHAR2(200) NOT NULL,
    TrainerName VARCHAR2(100) NOT NULL,
    MaterialProvided VARCHAR2(5) NOT NULL,
    DurationHours NUMBER NOT NULL,

    PRIMARY KEY (Event_ID),
    FOREIGN KEY (Event_ID) REFERENCES Event(Event_ID),
    CONSTRAINT chk_material CHECK (MaterialProvided IN ('YES', 'NO'))
);

CREATE TABLE Competition(
    Event_ID NUMBER NOT NULL,
    PrizePool NUMBER(10,2) NOT NULL,
    NumberOfRounds NUMBER NOT NULL,
    JudgesCount NUMBER NOT NULL,
    RegistrationFee NUMBER(10,2) NOT NULL,

    PRIMARY KEY (Event_ID),
    FOREIGN KEY (Event_ID) REFERENCES Event(Event_ID)
);

CREATE TABLE Meetup(
    Event_ID NUMBER NOT NULL,
    AgendaType VARCHAR2(100) NOT NULL,
    DrinksProvided VARCHAR2(5) NOT NULL,
    IsInformal VARCHAR2(5) NOT NULL,

    PRIMARY KEY (Event_ID),
    FOREIGN KEY (Event_ID) REFERENCES Event(Event_ID),
    CONSTRAINT chk_drinks CHECK (DrinksProvided IN ('YES', 'NO')),
    CONSTRAINT chk_informal CHECK (IsInformal IN ('YES', 'NO'))
);

CREATE TABLE Registration(
    Reg_ID NUMBER GENERATED ALWAYS AS IDENTITY,
    RegDate DATE NOT NULL,
    Status VARCHAR2(20) NOT NULL,
    Event_ID NUMBER NOT NULL,
    Member_ID NUMBER NOT NULL,

    PRIMARY KEY (Reg_ID),
    FOREIGN KEY (Event_ID) REFERENCES Event(Event_ID),
    FOREIGN KEY (Member_ID) REFERENCES Member(Member_ID),
    CONSTRAINT chk_reg_status CHECK (Status IN ('Confirmed', 'Cancelled', 'Waitlisted'))
);

CREATE TABLE Attendance(
    Attendance_ID NUMBER GENERATED ALWAYS AS IDENTITY,
    CheckInTime VARCHAR2(10) NOT NULL,
    CheckOutTime VARCHAR2(10),
    Attended VARCHAR2(5) NOT NULL,
    Reg_ID NUMBER NOT NULL,

    PRIMARY KEY (Attendance_ID),
    FOREIGN KEY (Reg_ID) REFERENCES Registration(Reg_ID),
    CONSTRAINT chk_attended CHECK (Attended IN ('YES', 'NO'))
);

CREATE TABLE Budget(
    Budget_ID NUMBER GENERATED ALWAYS AS IDENTITY,
    Semester VARCHAR2(20) NOT NULL,
    TotalAmount NUMBER(10,2) NOT NULL,
    AmountSpent NUMBER(10,2) NOT NULL,
    Remaining NUMBER(10,2) GENERATED ALWAYS AS (TotalAmount - AmountSpent) VIRTUAL,
    Club_ID NUMBER NOT NULL,

    PRIMARY KEY (Budget_ID),
    FOREIGN KEY (Club_ID) REFERENCES Club(Club_ID)
);

CREATE TABLE Feedback(
    Feedback_ID NUMBER GENERATED ALWAYS AS IDENTITY,
    Rating NUMBER(1) NOT NULL,
    Comments VARCHAR2(500),
    FeedbackDate DATE NOT NULL,
    Attendance_ID NUMBER NOT NULL,

    PRIMARY KEY (Feedback_ID),
    FOREIGN KEY (Attendance_ID) REFERENCES Attendance(Attendance_ID),
    CONSTRAINT chk_rating CHECK (Rating BETWEEN 1 AND 5)
);