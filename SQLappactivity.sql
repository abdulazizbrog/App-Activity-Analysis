create database App_activity

use App_activity

CREATE TABLE AppUsers (
    UserID INT PRIMARY KEY,
    UserName VARCHAR(50),
    Country VARCHAR(50),
    RegistrationDate DATE
);

CREATE TABLE UserSessions (
    SessionID INT PRIMARY KEY,
    UserID INT NULL,
    SessionStart DATETIME2,
    SessionEnd DATETIME2 NULL,
    DeviceType VARCHAR(20),
    TrafficSource VARCHAR(30),
    FOREIGN KEY (UserID) REFERENCES AppUsers(UserID)
);

CREATE TABLE SessionEvents (
    EventID INT PRIMARY KEY,
    SessionID INT,
    EventTime DATETIME2,
    EventType VARCHAR(30),
    PageName VARCHAR(50) NULL,
    FOREIGN KEY (SessionID) REFERENCES UserSessions(SessionID)
);

INSERT INTO AppUsers
    (UserID, UserName, Country, RegistrationDate)
VALUES
(1, 'Ahmed',  'Saudi Arabia', '20260801'),
(2, 'Sara',   'Saudi Arabia', '20260805'),
(3, 'Omar',   'UAE',          '20260810'),
(4, 'Noura',  'Kuwait',       '20260901'),
(5, 'Khalid', 'Bahrain',      '20260912'),
(6, 'Layla',  'Saudi Arabia', '20260920');

INSERT INTO UserSessions
    (SessionID, UserID, SessionStart, SessionEnd,
     DeviceType, TrafficSource)
VALUES
(101, 1, '2026-10-20T08:00:00', '2026-10-20T08:20:00',
 'Mobile', 'Google'),

(102, 2, '2026-10-20T09:00:00', '2026-10-20T09:05:00',
 'Desktop', 'Direct'),

(103, NULL, '2026-10-20T10:00:00', '2026-10-20T10:02:00',
 'Mobile', 'Instagram'),

(104, 3, '2026-10-20T11:00:00', '2026-10-20T11:30:00',
 'Desktop', 'Google'),

(105, 1, '2026-10-21T08:30:00', '2026-10-21T08:45:00',
 'Desktop', 'Direct'),

(106, 4, '2026-10-21T12:00:00', '2026-10-21T12:10:00',
 'Mobile', 'Email'),

(107, 2, '2026-10-21T14:00:00', '2026-10-21T14:25:00',
 'Mobile', 'Google'),

(108, 5, '2026-10-21T23:50:00', '2026-10-22T00:15:00',
 'Tablet', 'Direct'),

(109, NULL, '2026-10-22T09:00:00', '2026-10-22T09:01:00',
 'Desktop', 'Google'),

(110, 3, '2026-10-22T10:00:00', '2026-10-22T10:40:00',
 'Mobile', 'Email'),

(111, 6, '2026-10-22T15:00:00', '2026-10-22T15:08:00',
 'Mobile', 'Instagram'),

(112, 1, '2026-10-22T16:00:00', NULL,
 'Desktop', 'Direct');

 INSERT INTO SessionEvents
    (EventID, SessionID, EventTime, EventType, PageName)
VALUES
(1, 101, '2026-10-20T08:00:00', 'page_view', 'Home'),
(2, 101, '2026-10-20T08:01:00', 'login_success', 'Login'),
(3, 101, '2026-10-20T08:05:00', 'page_view', 'Products'),
(4, 101, '2026-10-20T08:10:00', 'add_to_cart', 'Product Details'),
(5, 101, '2026-10-20T08:18:00', 'purchase', 'Checkout'),
(6, 101, '2026-10-20T08:20:00', 'logout', NULL),

(7, 102, '2026-10-20T09:00:00', 'page_view', 'Login'),
(8, 102, '2026-10-20T09:01:00', 'login_failed', 'Login'),
(9, 102, '2026-10-20T09:02:00', 'login_failed', 'Login'),
(10, 102, '2026-10-20T09:03:00', 'login_success', 'Login'),
(11, 102, '2026-10-20T09:05:00', 'logout', NULL),

(12, 103, '2026-10-20T10:00:00', 'page_view', 'Home'),

(13, 104, '2026-10-20T11:00:00', 'page_view', 'Home'),
(14, 104, '2026-10-20T11:02:00', 'login_success', 'Login'),
(15, 104, '2026-10-20T11:10:00', 'add_to_cart', 'Product Details'),
(16, 104, '2026-10-20T11:30:00', 'session_timeout', NULL),

(17, 105, '2026-10-21T08:30:00', 'login_success', 'Login'),
(18, 105, '2026-10-21T08:35:00', 'page_view', 'Products'),
(19, 105, '2026-10-21T08:45:00', 'logout', NULL),

(20, 106, '2026-10-21T12:00:00', 'page_view', 'Login'),
(21, 106, '2026-10-21T12:01:00', 'login_failed', 'Login'),
(22, 106, '2026-10-21T12:03:00', 'password_reset', 'Reset Password'),
(23, 106, '2026-10-21T12:05:00', 'login_success', 'Login'),
(24, 106, '2026-10-21T12:10:00', 'logout', NULL),

(25, 107, '2026-10-21T14:00:00', 'login_success', 'Login'),
(26, 107, '2026-10-21T14:10:00', 'add_to_cart', 'Product Details'),
(27, 107, '2026-10-21T14:20:00', 'purchase', 'Checkout'),
(28, 107, '2026-10-21T14:25:00', 'logout', NULL),

(29, 108, '2026-10-21T23:50:00', 'login_success', 'Login'),
(30, 108, '2026-10-22T00:05:00', 'page_view', 'Products'),
(31, 108, '2026-10-22T00:15:00', 'logout', NULL),

(32, 109, '2026-10-22T09:00:00', 'page_view', 'Home'),

(33, 110, '2026-10-22T10:00:00', 'login_success', 'Login'),
(34, 110, '2026-10-22T10:10:00', 'add_to_cart', 'Product Details'),
(35, 110, '2026-10-22T10:20:00', 'purchase', 'Checkout'),
(36, 110, '2026-10-22T10:40:00', 'session_timeout', NULL),

(37, 111, '2026-10-22T15:00:00', 'page_view', 'Login'),
(38, 111, '2026-10-22T15:01:00', 'login_failed', 'Login'),
(39, 111, '2026-10-22T15:03:00', 'login_failed', 'Login'),
(40, 111, '2026-10-22T15:06:00', 'login_failed', 'Login'),

(41, 112, '2026-10-22T16:00:00', 'login_success', 'Login'),
(42, 112, '2026-10-22T16:05:00', 'page_view', 'Products');

select *
from AppUsers

select *
from UserSessions
select *
from SessionEvents

--how many session started each day
select 
count(distinct sessionid) Sessions ,
datepart(day,EventTime) Day
from SessionEvents
group by datepart(day,EventTime) 
order by Sessions desc
--which user had the most session 
select 
username ,
count(distinct sessionid) UserSessions
from UserSessions us
left join AppUsers a
on us.UserID = a.UserID
where us.UserID is not null
group by username
order by UserSessions desc
-- what is the duration for each completed session
select 
sessionid ,
datediff(minute,SessionStart ,SessionEnd) SessionDuration
from UserSessions
--what is the Percentage of login failed attempts
with CTElogin
as (
select 
count(eventid) LoginAttempts
FROM SessionEvents
where PageName ='Login'
)
, FaildLogin as
(
select 
count(eventid) Faildlogin
FROM SessionEvents
where EventType = 'login_failed' 
)
select 
cast(FaildLogin as decimal (10,2))/LoginAttempts * 100 FaildLoginPercent
from CTElogin 
Cross join FaildLogin 
--which users login and faild at the same session
with CTEFailed as (
select 
sessionid 
from SessionEvents
where eventtype = 'login_failed' 
)
,CTESuccessd
 as (
select 
sessionid 
from SessionEvents
where eventtype = 'login_success' 
)
select distinct
s.sessionid
from CTEFailed f
inner join CTESuccessd s
on f.sessionid = s.sessionid
---which session include an add to cart but no purchase
select *
from (
select  
sessionid ,
count(eventtype ) Events
from SessionEvents
where EventType = 'add_to_cart' or EventType = 'purchase'
group by sessionid
)t
where Events = 1
-- What is the average  duration of completed session by device type
select 
DeviceType ,
avg(Datediff(Minute,sessionStart , SessionEnd)) AverageSessionDuration
from UserSessions
group by DeviceType
--what percentage  of sessions rsulted in a purhchase grouped by traffic source
with CTE_Sessions
as (
select 
count(distinct us.SessionID) Sessions ,
trafficsource 
from SessionEvents se
left join UserSessions us
on se.SessionID = us.SessionID
group by TrafficSource
)
,CTE_Purchased
as (
select 
count(distinct us.SessionID) PurchasedSession ,
trafficsource 
from SessionEvents se
left join UserSessions us
on se.SessionID = us.SessionID
where EventType = 'Purchase'
group by TrafficSource )
select 
s.trafficsource ,
cast (coalesce (PurchasedSession,0) * 100   / Sessions as decimal(10,2))purchasepercentage
from CTE_Sessions s
left join CTE_Purchased p
on s.trafficsource = p.trafficsource

-- how many minutes elapesed between sucessful login and pruchase with each purchasing session
 with Session_Events as 
 (
select 
sessionid ,
eventTime ,
EventType 
from SessionEvents
where EventType in ('login_success','purchase')
),
previous_event as
(
select *,
LAG(eventTime) OVER (Partition by sessionid  order by eventTime) as previoustime ,
datediff(Minute,LAG(eventTime) OVER (Partition by sessionid  order by eventTime),eventTime)timespend
from Session_Events
)
select 
sessionid ,
timespend ,
previoustime as  SessionStart ,
eventTime as session_end
from previous_event
where EventType ='purchase'
and previoustime  is not null



with tunnel_stage as (
select distinct 
*,
case  
when EventType = 'login_success' then 1
when EventType = 'add_to_cart' then 1
when EventType = 'purchase' then 1
else 0 end as sessiontunnel
from SessionEvents
)
, totalsessions as (
select 
sessionid ,
count (sessiontunnel) PassedTunnels
from tunnel_stage
where sessiontunnel >= 1
group by sessionid
)
, allessesion as
(
select
count(distinct sessionid) Totalsession
from SessionEvents
)
select 
sessionid ,
cast(PassedTunnels as decimal(10,2)) / Totalsession * 100
from totalsessions t
cross join allessesion
where PassedTunnels >= 3











select *
from SessionEvents
SessionID
from UserSessions


