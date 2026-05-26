-- =============================================
-- CHARTER - Sample Data
-- =============================================

-- 1. FACULTYADVISOR
INSERT INTO FacultyAdvisor (Name, Email, Department, Phone) VALUES ('Dr. Ahmed Raza', 'ahmed.raza@university.edu', 'Computer Science', '0300-1234567');
INSERT INTO FacultyAdvisor (Name, Email, Department, Phone) VALUES ('Dr. Sara Malik', 'sara.malik@university.edu', 'Business Administration', '0301-2345678');
INSERT INTO FacultyAdvisor (Name, Email, Department, Phone) VALUES ('Dr. Usman Khan', 'usman.khan@university.edu', 'Electrical Engineering', '0302-3456789');
INSERT INTO FacultyAdvisor (Name, Email, Department, Phone) VALUES ('Dr. Ayesha Tariq', 'ayesha.tariq@university.edu', 'Media Studies', '0303-4567890');

-- 2. SPONSOR
INSERT INTO Sponsor (SponsorName, ContactPerson, Email, Phone, SponsorAmount) VALUES ('Pepsi Pakistan', 'Ali Hassan', 'ali.hassan@pepsi.com', '0311-1111111', 50000.00);
INSERT INTO Sponsor (SponsorName, ContactPerson, Email, Phone, SponsorAmount) VALUES ('Nestle Pakistan', 'Sara Ahmed', 'sara.ahmed@nestle.com', '0312-2222222', 75000.00);
INSERT INTO Sponsor (SponsorName, ContactPerson, Email, Phone, SponsorAmount) VALUES ('Jazz Telecom', 'Bilal Malik', 'bilal.malik@jazz.com', '0313-3333333', 100000.00);
INSERT INTO Sponsor (SponsorName, ContactPerson, Email, Phone, SponsorAmount) VALUES ('Engro Corp', 'Hina Shah', 'hina.shah@engro.com', '0314-4444444', 60000.00);

-- 3. CLUB
INSERT INTO Club (Club_Name, Category, FoundedDate, Description, Status, Advisor_ID) VALUES ('Tech Innovators', 'Technology', TO_DATE('2020-01-15', 'YYYY-MM-DD'), 'A club for tech enthusiasts and innovators', 'Active', 1);
INSERT INTO Club (Club_Name, Category, FoundedDate, Description, Status, Advisor_ID) VALUES ('Debate Society', 'Academic', TO_DATE('2018-03-20', 'YYYY-MM-DD'), 'Fostering critical thinking and public speaking', 'Active', 2);
INSERT INTO Club (Club_Name, Category, FoundedDate, Description, Status, Advisor_ID) VALUES ('Photography Club', 'Arts', TO_DATE('2019-06-10', 'YYYY-MM-DD'), 'Capturing moments and developing visual storytelling', 'Active', 3);
INSERT INTO Club (Club_Name, Category, FoundedDate, Description, Status, Advisor_ID) VALUES ('Entrepreneurship Cell', 'Business', TO_DATE('2021-09-01', 'YYYY-MM-DD'), 'Nurturing future entrepreneurs and business leaders', 'Active', 4);
INSERT INTO Club (Club_Name, Category, FoundedDate, Description, Status, Advisor_ID) VALUES ('Sports Society', 'Sports', TO_DATE('2017-02-28', 'YYYY-MM-DD'), 'Promoting sports and physical fitness on campus', 'Inactive', 1);

-- 4. VENUE
INSERT INTO Venue (VenueName, Location, Capacity, Facilities, IsAvailable) VALUES ('Main Auditorium', 'Block A, Ground Floor', 500, 'Projector, AC, Stage, Mic', 'YES');
INSERT INTO Venue (VenueName, Location, Capacity, Facilities, IsAvailable) VALUES ('Seminar Hall 1', 'Block B, First Floor', 100, 'Projector, AC, Whiteboard', 'YES');
INSERT INTO Venue (VenueName, Location, Capacity, Facilities, IsAvailable) VALUES ('Open Air Theatre', 'Main Ground', 1000, 'Stage, Outdoor Lighting', 'YES');
INSERT INTO Venue (VenueName, Location, Capacity, Facilities, IsAvailable) VALUES ('CS Lab', 'Block C, Second Floor', 50, 'Computers, AC, Projector', 'NO');
INSERT INTO Venue (VenueName, Location, Capacity, Facilities, IsAvailable) VALUES ('Conference Room', 'Admin Block', 30, 'AC, Whiteboard, TV Screen', 'YES');

-- 5. MEMBER
INSERT INTO Member (Name, Email, Phone, Degree, Semester, Status) VALUES ('Ali Raza', 'ali.raza@student.edu', '0321-1111111', 'BS Computer Science', 6, 'Active');
INSERT INTO Member (Name, Email, Phone, Degree, Semester, Status) VALUES ('Sara Khan', 'sara.khan@student.edu', '0322-2222222', 'BS Business Admin', 4, 'Active');
INSERT INTO Member (Name, Email, Phone, Degree, Semester, Status) VALUES ('Usman Ahmed', 'usman.ahmed@student.edu', '0323-3333333', 'BS Electrical Eng', 7, 'Active');
INSERT INTO Member (Name, Email, Phone, Degree, Semester, Status) VALUES ('Ayesha Malik', 'ayesha.malik@student.edu', '0324-4444444', 'BS Media Studies', 3, 'Active');
INSERT INTO Member (Name, Email, Phone, Degree, Semester, Status) VALUES ('Bilal Hassan', 'bilal.hassan@student.edu', '0325-5555555', 'BS Computer Science', 8, 'Alumni');
INSERT INTO Member (Name, Email, Phone, Degree, Semester, Status) VALUES ('Hina Shah', 'hina.shah@student.edu', '0326-6666666', 'BS Business Admin', 5, 'Active');
INSERT INTO Member (Name, Email, Phone, Degree, Semester, Status) VALUES ('Omar Farooq', 'omar.farooq@student.edu', '0327-7777777', 'BS Electrical Eng', 2, 'Active');
INSERT INTO Member (Name, Email, Phone, Degree, Semester, Status) VALUES ('Zara Ahmed', 'zara.ahmed@student.edu', '0328-8888888', 'BS Computer Science', 6, 'Active');
INSERT INTO Member (Name, Email, Phone, Degree, Semester, Status) VALUES ('Hassan Ali', 'hassan.ali@student.edu', '0329-9999999', 'BS Media Studies', 4, 'Suspended');
INSERT INTO Member (Name, Email, Phone, Degree, Semester, Status) VALUES ('Fatima Noor', 'fatima.noor@student.edu', '0320-0000000', 'BS Computer Science', 7, 'Active');

-- 6. ROLE
INSERT INTO Role (RoleName, Permissions) VALUES ('President', 'Full access to club management and event creation');
INSERT INTO Role (RoleName, Permissions) VALUES ('Secretary', 'Manage members, record minutes, handle communications');
INSERT INTO Role (RoleName, Permissions) VALUES ('Treasurer', 'Manage budget, track expenses, handle sponsorships');
INSERT INTO Role (RoleName, Permissions) VALUES ('Member', 'View events, register, submit feedback');
INSERT INTO Role (RoleName, Permissions) VALUES ('Event Coordinator', 'Create and manage events, handle registrations');

-- 7. MEMBERSHIP
INSERT INTO Membership (JoinDate, EndDate, Member_ID, Club_ID, Role_ID) VALUES (TO_DATE('2022-01-10', 'YYYY-MM-DD'), NULL, 1, 1, 1);
INSERT INTO Membership (JoinDate, EndDate, Member_ID, Club_ID, Role_ID) VALUES (TO_DATE('2022-02-15', 'YYYY-MM-DD'), NULL, 2, 2, 1);
INSERT INTO Membership (JoinDate, EndDate, Member_ID, Club_ID, Role_ID) VALUES (TO_DATE('2022-03-20', 'YYYY-MM-DD'), NULL, 3, 3, 2);
INSERT INTO Membership (JoinDate, EndDate, Member_ID, Club_ID, Role_ID) VALUES (TO_DATE('2022-04-25', 'YYYY-MM-DD'), NULL, 4, 4, 3);
INSERT INTO Membership (JoinDate, EndDate, Member_ID, Club_ID, Role_ID) VALUES (TO_DATE('2021-01-10', 'YYYY-MM-DD'), TO_DATE('2023-01-10', 'YYYY-MM-DD'), 5, 1, 4);
INSERT INTO Membership (JoinDate, EndDate, Member_ID, Club_ID, Role_ID) VALUES (TO_DATE('2022-05-01', 'YYYY-MM-DD'), NULL, 6, 2, 4);
INSERT INTO Membership (JoinDate, EndDate, Member_ID, Club_ID, Role_ID) VALUES (TO_DATE('2023-01-15', 'YYYY-MM-DD'), NULL, 7, 1, 4);
INSERT INTO Membership (JoinDate, EndDate, Member_ID, Club_ID, Role_ID) VALUES (TO_DATE('2023-02-20', 'YYYY-MM-DD'), NULL, 8, 3, 5);
INSERT INTO Membership (JoinDate, EndDate, Member_ID, Club_ID, Role_ID) VALUES (TO_DATE('2023-03-10', 'YYYY-MM-DD'), NULL, 9, 4, 4);
INSERT INTO Membership (JoinDate, EndDate, Member_ID, Club_ID, Role_ID) VALUES (TO_DATE('2023-04-05', 'YYYY-MM-DD'), NULL, 10, 1, 2);
INSERT INTO Membership (JoinDate, EndDate, Member_ID, Club_ID, Role_ID) VALUES (TO_DATE('2022-06-01', 'YYYY-MM-DD'), NULL, 1, 3, 4);
INSERT INTO Membership (JoinDate, EndDate, Member_ID, Club_ID, Role_ID) VALUES (TO_DATE('2022-07-15', 'YYYY-MM-DD'), NULL, 2, 4, 5);

-- 8. EVENT
INSERT INTO Event (Title, EventDate, StartTime, EndTime, BudgetAllocated, EventType, Club_ID, Venue_ID, Sponsor_ID) VALUES ('AI & Future Tech Workshop', TO_DATE('2024-02-15', 'YYYY-MM-DD'), '09:00 AM', '12:00 PM', 25000.00, 'Workshop', 1, 2, 3);
INSERT INTO Event (Title, EventDate, StartTime, EndTime, BudgetAllocated, EventType, Club_ID, Venue_ID, Sponsor_ID) VALUES ('Annual Debate Championship', TO_DATE('2024-03-10', 'YYYY-MM-DD'), '10:00 AM', '05:00 PM', 40000.00, 'Competition', 2, 1, 1);
INSERT INTO Event (Title, EventDate, StartTime, EndTime, BudgetAllocated, EventType, Club_ID, Venue_ID, Sponsor_ID) VALUES ('Photography Walk', TO_DATE('2024-03-25', 'YYYY-MM-DD'), '08:00 AM', '11:00 AM', 10000.00, 'Meetup', 3, 3, NULL);
INSERT INTO Event (Title, EventDate, StartTime, EndTime, BudgetAllocated, EventType, Club_ID, Venue_ID, Sponsor_ID) VALUES ('Startup Pitch Competition', TO_DATE('2024-04-05', 'YYYY-MM-DD'), '11:00 AM', '04:00 PM', 60000.00, 'Competition', 4, 1, 2);
INSERT INTO Event (Title, EventDate, StartTime, EndTime, BudgetAllocated, EventType, Club_ID, Venue_ID, Sponsor_ID) VALUES ('Web Dev Bootcamp', TO_DATE('2024-04-20', 'YYYY-MM-DD'), '09:00 AM', '03:00 PM', 20000.00, 'Workshop', 1, 4, NULL);
INSERT INTO Event (Title, EventDate, StartTime, EndTime, BudgetAllocated, EventType, Club_ID, Venue_ID, Sponsor_ID) VALUES ('Club Networking Night', TO_DATE('2024-05-01', 'YYYY-MM-DD'), '06:00 PM', '09:00 PM', 15000.00, 'Meetup', 4, 5, 4);
INSERT INTO Event (Title, EventDate, StartTime, EndTime, BudgetAllocated, EventType, Club_ID, Venue_ID, Sponsor_ID) VALUES ('Photography Exhibition', TO_DATE('2024-05-15', 'YYYY-MM-DD'), '10:00 AM', '06:00 PM', 30000.00, 'Meetup', 3, 1, 1);
INSERT INTO Event (Title, EventDate, StartTime, EndTime, BudgetAllocated, EventType, Club_ID, Venue_ID, Sponsor_ID) VALUES ('Cybersecurity Workshop', TO_DATE('2024-06-01', 'YYYY-MM-DD'), '09:00 AM', '01:00 PM', 18000.00, 'Workshop', 1, 2, NULL);

-- 9. WORKSHOP
INSERT INTO Workshop (Event_ID, Topic, TrainerName, MaterialProvided, DurationHours) VALUES (1, 'Artificial Intelligence and Machine Learning', 'Dr. Kamran Akhtar', 'YES', 3);
INSERT INTO Workshop (Event_ID, Topic, TrainerName, MaterialProvided, DurationHours) VALUES (5, 'Full Stack Web Development', 'Engr. Saad Bin Tariq', 'YES', 6);
INSERT INTO Workshop (Event_ID, Topic, TrainerName, MaterialProvided, DurationHours) VALUES (8, 'Ethical Hacking and Network Security', 'Dr. Noman Raza', 'NO', 4);

-- 10. COMPETITION
INSERT INTO Competition (Event_ID, PrizePool, NumberOfRounds, JudgesCount, RegistrationFee) VALUES (2, 30000.00, 4, 5, 500.00);
INSERT INTO Competition (Event_ID, PrizePool, NumberOfRounds, JudgesCount, RegistrationFee) VALUES (4, 50000.00, 3, 6, 1000.00);

-- 11. MEETUP
INSERT INTO Meetup (Event_ID, AgendaType, DrinksProvided, IsInformal) VALUES (3, 'Outdoor Photography Session', 'NO', 'YES');
INSERT INTO Meetup (Event_ID, AgendaType, DrinksProvided, IsInformal) VALUES (6, 'Club Networking and Collaboration', 'YES', 'YES');
INSERT INTO Meetup (Event_ID, AgendaType, DrinksProvided, IsInformal) VALUES (7, 'Photography Exhibition and Awards', 'YES', 'NO');

-- 12. REGISTRATION
INSERT INTO Registration (RegDate, Status, Event_ID, Member_ID) VALUES (TO_DATE('2024-02-10', 'YYYY-MM-DD'), 'Confirmed', 1, 1);
INSERT INTO Registration (RegDate, Status, Event_ID, Member_ID) VALUES (TO_DATE('2024-02-10', 'YYYY-MM-DD'), 'Confirmed', 1, 7);
INSERT INTO Registration (RegDate, Status, Event_ID, Member_ID) VALUES (TO_DATE('2024-02-11', 'YYYY-MM-DD'), 'Confirmed', 1, 10);
INSERT INTO Registration (RegDate, Status, Event_ID, Member_ID) VALUES (TO_DATE('2024-03-05', 'YYYY-MM-DD'), 'Confirmed', 2, 2);
INSERT INTO Registration (RegDate, Status, Event_ID, Member_ID) VALUES (TO_DATE('2024-03-05', 'YYYY-MM-DD'), 'Confirmed', 2, 6);
INSERT INTO Registration (RegDate, Status, Event_ID, Member_ID) VALUES (TO_DATE('2024-03-06', 'YYYY-MM-DD'), 'Cancelled', 2, 9);
INSERT INTO Registration (RegDate, Status, Event_ID, Member_ID) VALUES (TO_DATE('2024-03-20', 'YYYY-MM-DD'), 'Confirmed', 3, 3);
INSERT INTO Registration (RegDate, Status, Event_ID, Member_ID) VALUES (TO_DATE('2024-03-20', 'YYYY-MM-DD'), 'Confirmed', 3, 8);
INSERT INTO Registration (RegDate, Status, Event_ID, Member_ID) VALUES (TO_DATE('2024-04-01', 'YYYY-MM-DD'), 'Confirmed', 4, 4);
INSERT INTO Registration (RegDate, Status, Event_ID, Member_ID) VALUES (TO_DATE('2024-04-01', 'YYYY-MM-DD'), 'Waitlisted', 4, 2);
INSERT INTO Registration (RegDate, Status, Event_ID, Member_ID) VALUES (TO_DATE('2024-04-15', 'YYYY-MM-DD'), 'Confirmed', 5, 1);
INSERT INTO Registration (RegDate, Status, Event_ID, Member_ID) VALUES (TO_DATE('2024-04-15', 'YYYY-MM-DD'), 'Confirmed', 5, 7);
INSERT INTO Registration (RegDate, Status, Event_ID, Member_ID) VALUES (TO_DATE('2024-04-26', 'YYYY-MM-DD'), 'Confirmed', 6, 6);
INSERT INTO Registration (RegDate, Status, Event_ID, Member_ID) VALUES (TO_DATE('2024-04-26', 'YYYY-MM-DD'), 'Confirmed', 6, 10);
INSERT INTO Registration (RegDate, Status, Event_ID, Member_ID) VALUES (TO_DATE('2024-05-10', 'YYYY-MM-DD'), 'Confirmed', 7, 3);
INSERT INTO Registration (RegDate, Status, Event_ID, Member_ID) VALUES (TO_DATE('2024-05-10', 'YYYY-MM-DD'), 'Confirmed', 7, 8);
INSERT INTO Registration (RegDate, Status, Event_ID, Member_ID) VALUES (TO_DATE('2024-05-25', 'YYYY-MM-DD'), 'Confirmed', 8, 1);
INSERT INTO Registration (RegDate, Status, Event_ID, Member_ID) VALUES (TO_DATE('2024-05-25', 'YYYY-MM-DD'), 'Confirmed', 8, 10);

-- 13. ATTENDANCE
INSERT INTO Attendance (CheckInTime, CheckOutTime, Attended, Reg_ID) VALUES ('09:05 AM', '12:10 PM', 'YES', 1);
INSERT INTO Attendance (CheckInTime, CheckOutTime, Attended, Reg_ID) VALUES ('09:10 AM', '12:00 PM', 'YES', 2);
INSERT INTO Attendance (CheckInTime, CheckOutTime, Attended, Reg_ID) VALUES ('09:15 AM', '11:45 AM', 'YES', 3);
INSERT INTO Attendance (CheckInTime, CheckOutTime, Attended, Reg_ID) VALUES ('10:05 AM', '05:00 PM', 'YES', 4);
INSERT INTO Attendance (CheckInTime, CheckOutTime, Attended, Reg_ID) VALUES ('10:00 AM', '05:05 PM', 'YES', 5);
INSERT INTO Attendance (CheckInTime, CheckOutTime, Attended, Reg_ID) VALUES ('08:10 AM', '11:00 AM', 'YES', 7);
INSERT INTO Attendance (CheckInTime, CheckOutTime, Attended, Reg_ID) VALUES ('08:05 AM', '10:50 AM', 'YES', 8);
INSERT INTO Attendance (CheckInTime, CheckOutTime, Attended, Reg_ID) VALUES ('11:00 AM', '04:00 PM', 'YES', 9);
INSERT INTO Attendance (CheckInTime, CheckOutTime, Attended, Reg_ID) VALUES ('09:00 AM', '03:00 PM', 'YES', 11);
INSERT INTO Attendance (CheckInTime, CheckOutTime, Attended, Reg_ID) VALUES ('09:05 AM', NULL, 'NO', 12);
INSERT INTO Attendance (CheckInTime, CheckOutTime, Attended, Reg_ID) VALUES ('06:05 PM', '09:00 PM', 'YES', 13);
INSERT INTO Attendance (CheckInTime, CheckOutTime, Attended, Reg_ID) VALUES ('06:10 PM', '08:50 PM', 'YES', 14);
INSERT INTO Attendance (CheckInTime, CheckOutTime, Attended, Reg_ID) VALUES ('10:00 AM', '06:00 PM', 'YES', 15);
INSERT INTO Attendance (CheckInTime, CheckOutTime, Attended, Reg_ID) VALUES ('10:05 AM', '05:50 PM', 'YES', 16);
INSERT INTO Attendance (CheckInTime, CheckOutTime, Attended, Reg_ID) VALUES ('09:00 AM', '01:00 PM', 'YES', 17);
INSERT INTO Attendance (CheckInTime, CheckOutTime, Attended, Reg_ID) VALUES ('09:10 AM', '01:05 PM', 'YES', 18);

-- 14. BUDGET
INSERT INTO Budget (Semester, TotalAmount, AmountSpent, Club_ID) VALUES ('Fall-2023', 100000.00, 75000.00, 1);
INSERT INTO Budget (Semester, TotalAmount, AmountSpent, Club_ID) VALUES ('Fall-2023', 80000.00, 60000.00, 2);
INSERT INTO Budget (Semester, TotalAmount, AmountSpent, Club_ID) VALUES ('Fall-2023', 50000.00, 30000.00, 3);
INSERT INTO Budget (Semester, TotalAmount, AmountSpent, Club_ID) VALUES ('Fall-2023', 120000.00, 110000.00, 4);
INSERT INTO Budget (Semester, TotalAmount, AmountSpent, Club_ID) VALUES ('Spring-2024', 150000.00, 63000.00, 1);
INSERT INTO Budget (Semester, TotalAmount, AmountSpent, Club_ID) VALUES ('Spring-2024', 90000.00, 40000.00, 2);
INSERT INTO Budget (Semester, TotalAmount, AmountSpent, Club_ID) VALUES ('Spring-2024', 60000.00, 40000.00, 3);
INSERT INTO Budget (Semester, TotalAmount, AmountSpent, Club_ID) VALUES ('Spring-2024', 130000.00, 75000.00, 4);

-- 15. FEEDBACK
INSERT INTO Feedback (Rating, Comments, FeedbackDate, Attendance_ID) VALUES (5, 'Excellent workshop, very informative and well organized', TO_DATE('2024-02-15', 'YYYY-MM-DD'), 1);
INSERT INTO Feedback (Rating, Comments, FeedbackDate, Attendance_ID) VALUES (4, 'Great content, could use more hands on activities', TO_DATE('2024-02-15', 'YYYY-MM-DD'), 2);
INSERT INTO Feedback (Rating, Comments, FeedbackDate, Attendance_ID) VALUES (5, 'One of the best workshops I have attended', TO_DATE('2024-02-15', 'YYYY-MM-DD'), 3);
INSERT INTO Feedback (Rating, Comments, FeedbackDate, Attendance_ID) VALUES (4, 'Very competitive and well managed debate', TO_DATE('2024-03-10', 'YYYY-MM-DD'), 4);
INSERT INTO Feedback (Rating, Comments, FeedbackDate, Attendance_ID) VALUES (3, 'Good event but timing could be better', TO_DATE('2024-03-10', 'YYYY-MM-DD'), 5);
INSERT INTO Feedback (Rating, Comments, FeedbackDate, Attendance_ID) VALUES (5, 'Loved the outdoor photography session', TO_DATE('2024-03-25', 'YYYY-MM-DD'), 6);
INSERT INTO Feedback (Rating, Comments, FeedbackDate, Attendance_ID) VALUES (4, 'Great experience overall', TO_DATE('2024-03-25', 'YYYY-MM-DD'), 7);
INSERT INTO Feedback (Rating, Comments, FeedbackDate, Attendance_ID) VALUES (5, 'Startup pitches were incredibly inspiring', TO_DATE('2024-04-05', 'YYYY-MM-DD'), 8);
INSERT INTO Feedback (Rating, Comments, FeedbackDate, Attendance_ID) VALUES (4, 'Well structured bootcamp, learned a lot', TO_DATE('2024-04-20', 'YYYY-MM-DD'), 9);
INSERT INTO Feedback (Rating, Comments, FeedbackDate, Attendance_ID) VALUES (5, 'Amazing networking opportunity', TO_DATE('2024-05-01', 'YYYY-MM-DD'), 11);
INSERT INTO Feedback (Rating, Comments, FeedbackDate, Attendance_ID) VALUES (4, 'Great event, well organized', TO_DATE('2024-05-01', 'YYYY-MM-DD'), 12);
INSERT INTO Feedback (Rating, Comments, FeedbackDate, Attendance_ID) VALUES (5, 'Photography exhibition was world class', TO_DATE('2024-05-15', 'YYYY-MM-DD'), 13);
INSERT INTO Feedback (Rating, Comments, FeedbackDate, Attendance_ID) VALUES (4, 'Loved the exhibition, very creative work', TO_DATE('2024-05-15', 'YYYY-MM-DD'), 14);
INSERT INTO Feedback (Rating, Comments, FeedbackDate, Attendance_ID) VALUES (5, 'Cybersecurity workshop was eye opening', TO_DATE('2024-06-01', 'YYYY-MM-DD'), 15);
INSERT INTO Feedback (Rating, Comments, FeedbackDate, Attendance_ID) VALUES (4, 'Very relevant and practical content', TO_DATE('2024-06-01', 'YYYY-MM-DD'), 16);
