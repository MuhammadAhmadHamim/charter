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