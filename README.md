# App Activity Analysis

A SQL Server project that uses fictional app activity data to measure user engagement, login friction, and purchase conversion. The analysis follows sessions from the initial visit through successful login, add to cart, and purchase.

## Dataset

The sample contains 6 registered users, 12 sessions, and 42 events. Timestamps use Riyadh local time.

| Table | Description |
| --- | --- |
| `AppUsers` | Registered users and their signup details |
| `UserSessions` | One row per visit, with start and end times, device type, and traffic source |
| `SessionEvents` | Actions within each session, including login attempts, page views, cart additions, purchases, logouts, and timeouts |

## Analysis Questions

1. How many sessions started each day?
2. Which users had the most sessions?
3. How long did each completed session last?
4. What percentage of login attempts failed?
5. Which users failed to log in and then succeeded within the same session?
6. Which sessions included an add-to-cart event but no purchase?
7. What was the average duration of completed sessions by device type?
8. What percentage of sessions resulted in a purchase by traffic source?
9. How many minutes elapsed between successful login and purchase in each purchasing session?
10. What percentage of all sessions reached each stage: visit, successful login, add to cart, and purchase?

## Sample Findings

| Metric | Result |
| --- | --- |
| Failed login rate | 40% (6 of 15 attempts) |
| Cart additions without purchase | Session 104 |
| Purchase conversion | 25% (3 of 12 sessions) |
| Purchase conversion by traffic source | Google and Email each reached 50%. Direct and Instagram each reached 0%. |
| Time from login to purchase | 17–20 minutes across the three purchasing sessions |

Each stage percentage uses all 12 sessions as the denominator. A session is counted once per stage, even if it records the same event multiple times.

## SQL Techniques

- CTEs and joins to connect and summarize users, sessions, and events
- `COUNT(DISTINCT ...)` to count sessions without double-counting repeated events
- `CASE` and conditional aggregation to identify sessions with cart additions but no purchases
- `DATEDIFF()` and `LAG()` to calculate durations and compare event timestamps within a session

## How to Run

1. Open the SQL script in SQL Server Management Studio (SSMS).
2. Select a practice database and run the table creation and sample data sections first.
3. Run the analysis queries individually to review each result.
