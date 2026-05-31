<div align="center">

<img width="100%" src="https://capsule-render.vercel.app/api?type=waving&color=0:050810,40:0a0e1a,100:050810&height=240&section=header&text=Charter&fontSize=72&fontColor=c9a84c&fontAlignY=38&desc=Campus%20Club%20and%20Event%20Management%20Suite&descAlignY=60&descColor=e8d5a3&animation=fadeIn&fontFamily=Georgia" alt="Charter banner"/>

<br/>

![Oracle](https://img.shields.io/badge/Oracle%20DB-c9a84c?style=for-the-badge&logo=oracle&logoColor=black)
![APEX](https://img.shields.io/badge/Oracle%20APEX-0a0e1a?style=for-the-badge&logo=oracle&logoColor=c9a84c)
![SQL](https://img.shields.io/badge/SQL-16%20Tables-c9a84c?style=for-the-badge&logo=sqlite&logoColor=black)
![Pages](https://img.shields.io/badge/APEX%20Pages-17-0a0e1a?style=for-the-badge&logoColor=c9a84c)
![Roles](https://img.shields.io/badge/Roles-4%20Access%20Levels-e8d5a3?style=for-the-badge)
![Status](https://img.shields.io/badge/Status-Complete-050810?style=for-the-badge)

<br/><br/>

> *"A charter is the founding document of any official organization."*
> Charter is the platform that keeps everything after it running.

<br/>

</div>

---

## ◈ What This Is

A fully database-driven **Campus Club and Event Management Suite** built as the Database Systems semester project. Charter centralizes every operation a university club touches — memberships, events, attendance, budgets, feedback, sponsorships, venues — into a single Oracle SQL backend and Oracle APEX frontend, with role-based access control separating what each user can see and do.

16 tables. 17 APEX pages. 8 analytical queries. 4 roles. One system.

---

## ◈ The Problem It Solves

University clubs operate across spreadsheets, WhatsApp groups, and verbal agreements. There is no single source of truth for who attended what, how much budget remains, which venues are available, or how engaged members actually are.

Charter fixes that — a centralized analytical platform where admins, presidents, faculty advisors, and members each interact with exactly the data their role requires.

---

## ◈ Feature Set

<details>
<summary><b>🔐 Role Based Access Control</b></summary>
<br/>

Four roles. Four different views of the same system. Custom authentication backed by the `CHARTER_USERS` table — not Oracle APEX default accounts. Login credentials verified against the database, roles assigned via session state after authentication.

| Role | Access Level |
|:---:|:---|
| **Admin** | Full access — all pages, all CRUD |
| **President** | Events, Registrations, Attendance, Memberships |
| **Member** | Registration and Feedback only |
| **Advisor** | Analytics and Budget — read only |

</details>

<details>
<summary><b>🏛️ Club and Member Management</b></summary>
<br/>

Create and manage clubs with assigned faculty advisors. Track members by degree, semester, and status. Memberships are club-specific — a member's role (President, Secretary, etc.) is tied to a specific club, not their global account.

</details>

<details>
<summary><b>📅 Event Management — Workshop, Competition, Meetup</b></summary>
<br/>

Events are modeled using **Total Disjoint Specialization** — every event must be exactly one of Workshop, Competition, or Meetup, each with its own subclass-specific fields. Like an abstract class in Java — you cannot instantiate a bare Event.

Subclass-filtered dropdowns ensure Workshop pages only show Workshop-type events. Same for Competitions and Meetups.

</details>

<details>
<summary><b>✅ Registration and Attendance Pipeline</b></summary>
<br/>

Members register for events. Attendance is tracked per registration. Only members with `Attended = YES` are eligible to submit feedback — enforced at the database level, not just the UI.

</details>

<details>
<summary><b>⭐ Feedback System</b></summary>
<br/>

Feedback is linked to Attendance, not Member. You cannot review an event you did not attend. Verified attendance is the gate — keeping the rating system honest.

</details>

<details>
<summary><b>💰 Budget Tracking</b></summary>
<br/>

Per-club, per-semester budgets with a **virtual column** for remaining balance — auto-computed as `TotalAmount - AmountSpent` directly in the schema. No manual updates, no sync issues.

</details>

<details>
<summary><b>🏢 Venue Management</b></summary>
<br/>

Venues tracked with availability control. Only available venues appear in the Event form dropdown — unavailable venues are filtered at the query level, not the application level.

</details>

<details>
<summary><b>📊 Analytics Dashboard</b></summary>
<br/>

8 analytical charts and reports. 4 live stat cards with real-time data. Visible to Admin and Advisor roles.

</details>

---

## ◈ Database Architecture

### Schema — 16 Tables

<div align="center">

| # | Table | Role |
|:---:|:---:|:---|
| 1 | **FacultyAdvisor** | Club oversight |
| 2 | **Club** | Core club entity |
| 3 | **Member** | Registered students |
| 4 | **Role** | Club roles and permissions |
| 5 | **Membership** | Resolves Member ↔ Club M:N |
| 6 | **Venue** | Event locations with availability |
| 7 | **Sponsor** | Event sponsors |
| 8 | **Event** | Superclass — core of the system |
| 9 | **Workshop** | Subclass of Event |
| 10 | **Competition** | Subclass of Event |
| 11 | **Meetup** | Subclass of Event |
| 12 | **Registration** | Resolves Member ↔ Event M:N |
| 13 | **Attendance** | Tracks event attendance |
| 14 | **Budget** | Per club per semester |
| 15 | **Feedback** | Verified attendee reviews |
| 16 | **Charter_Users** | Application user accounts |

</div>

---

### Key Design Decisions

```sql
-- Total Disjoint Specialization on Event
-- Every event MUST be a Workshop, Competition, or Meetup
-- Cannot insert a bare Event row — like abstract class in Java
CONSTRAINT event_type CHECK (EventType IN ('Workshop','Competition','Meetup'))

-- Virtual column — Budget Remaining auto-computed, never stale
BudgetRemaining AS (TotalAmount - AmountSpent)

-- Feedback gate — only verified attendees can review
-- Feedback.AttendanceID → Attendance.AttendanceID
-- WHERE Attendance.Attended = 'YES'

-- Venue filter — only available venues in Event form dropdown
WHERE Venue.IsAvailable = 'YES'
```

---

### Database Diagrams

<details>
<summary><b>📐 Enhanced Entity Relationship Diagram</b></summary>
<br/>

![EERD](docs/EERD.png)

</details>

<details>
<summary><b>🗺️ Relational Model</b></summary>
<br/>

![Relational Model](docs/Relational_Model.png)

</details>

---

## ◈ Analytical Queries

<div align="center">

| # | Query | What It Reveals |
|:---:|:---|:---|
| 1 | Most Attended Events | Events ranked by verified attendance count |
| 2 | Top Rated Events | Events ranked by average feedback score |
| 3 | Club Budget Utilization | Spending percentage per club per semester |
| 4 | Most Active Members | Members ranked by total registrations |
| 5 | Sponsor Contribution Ranking | Sponsors ranked by total amount contributed |
| 6 | Monthly Event Count | Event volume trend over time |
| 7 | Venue Utilization | Venues ranked by events hosted |
| 8 | Member Retention | Membership growth tracked over time |

</div>

---

## ◈ Project Structure

```
charter/
│
├── docs/
│   ├── EERD.png                           ←  entity relationship diagram
│   └── Relational_Model.png               ←  relational model
│
├── sql/
│   ├── 01_create_tables.sql               ←  full schema creation
│   ├── 02_insert_data.sql                 ←  sample data
│   ├── 03_auth_setup.sql                  ←  Charter_Users setup
│   └── analytical_queries/
│       ├── 01_most_attended_events.sql
│       ├── 02_top_rated_events.sql
│       ├── 03_club_budget_utilization.sql
│       ├── 04_most_active_members.sql
│       ├── 05_sponsor_contribution_ranking.sql
│       ├── 06_monthly_event_count.sql
│       ├── 07_venue_utilization.sql
│       └── 08_member_retention.sql
│
├── apex/
│   └── charter_app.sql                    ←  full APEX application export
│
└── README.md
```

---

## 🎨 Design System

| Element | Value |
|---|---|
| Primary Color | `#1B2A4A` Deep Navy |
| Accent Color | `#F0A500` Gold |
| Background | `#F8F9FA` Off White |
| Card Background | `#FFFFFF` Pure White |
| Text | `#2D2D2D` Dark Charcoal |
| Theme | Oracle APEX Universal Theme |
| Icons | Font Awesome |
| Chart Colors | Navy + Gold diagonal alternating |

---

## ◈ Setup

### Prerequisites
Oracle Database · Oracle APEX Workspace

```sql
-- Step 1 — Create the schema
-- SQL Workshop → SQL Scripts → Run
01_create_tables.sql

-- Step 2 — Load sample data
02_insert_data.sql

-- Step 3 — Configure authentication
03_auth_setup.sql
```

```
-- Step 4 — Import the APEX application
App Builder → Import → charter_app.sql
```

### Login Credentials

<div align="center">

```
┌──────────────┬───────────────┬───────────┐
│   Username   │   Password    │   Role    │
├──────────────┼───────────────┼───────────┤
│   admin      │   admin123    │   Admin   │
│   president  │ president123  │ President │
│   member     │   member123   │   Member  │
│   advisor    │   advisor123  │  Advisor  │
└──────────────┴───────────────┴───────────┘
```

</div>

---

## 📚 Course Information

- **Course** — Database Systems (DBS)
- **Semester** — 3
- **Institution** — COMSATS University Islamabad, Wah Cantt Campus
- **Instructor** — Amjad Usman

---

## ◈ Skills This Project Demonstrates

<div align="center">

![](https://img.shields.io/badge/Oracle%20SQL-Schema%20Design-0a0e1a?style=flat-square&logo=oracle&logoColor=c9a84c)
![](https://img.shields.io/badge/Oracle%20SQL-Analytical%20Queries-c9a84c?style=flat-square&logo=oracle&logoColor=black)
![](https://img.shields.io/badge/Oracle%20APEX-17%20Page%20Application-0a0e1a?style=flat-square&logo=oracle&logoColor=e8d5a3)
![](https://img.shields.io/badge/DB%20Design-Total%20Disjoint%20Specialization-c9a84c?style=flat-square&logo=buffer&logoColor=black)
![](https://img.shields.io/badge/DB%20Design-Normalization%20%26%20Constraints-0a0e1a?style=flat-square&logo=buffer&logoColor=c9a84c)
![](https://img.shields.io/badge/RBAC-4%20Role%20Auth%20System-e8d5a3?style=flat-square&logo=shield&logoColor=black)
![](https://img.shields.io/badge/Oracle%20APEX-Custom%20Authentication-0a0e1a?style=flat-square&logo=oracle&logoColor=c9a84c)
![](https://img.shields.io/badge/SQL-Virtual%20Columns%20%26%20CHECK%20Constraints-c9a84c?style=flat-square&logo=sqlite&logoColor=black)

</div>

---

## ◈ A Note on This Project

Every design decision in Charter has a reason. The Total Disjoint Specialization on Event is not an accident — it enforces at the schema level what would otherwise require application-level validation. The Feedback-to-Attendance link is not just good design — it makes gaming the review system structurally impossible. The virtual column on Budget is not a shortcut — it eliminates an entire category of sync bugs before they can exist.

Good database design is not about tables. It's about making wrong states unrepresentable.

---

<div align="center">

<img width="100%" src="https://capsule-render.vercel.app/api?type=waving&color=0:1a2540,50:050810,100:1a2540&height=120&section=footer&animation=fadeIn" alt="footer"/>

*Designed at the schema level. Enforced at every level below it.*

</div>
