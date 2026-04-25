-- ============================================================
-- Week 1: JOIN Foundations
-- Concepts: INNER JOIN, LEFT JOIN, WHERE, table aliases
-- Platform: ThoughtSpot / SQL Sandboxes
-- Date: April 2026
-- ============================================================


-- ------------------------------------------------------------
-- Query 1: INNER JOIN
-- Business question: Which tickets were sold for Hip-Hop events,
-- and who bought them?
-- Only returns rows where a match exists in BOTH tables.
-- ------------------------------------------------------------

SELECT
  e.event_name,
  e.genre,
  t.customer_name
FROM events e
INNER JOIN ticket_sales t
  ON e.event_id = t.event_id
WHERE e.genre = 'Hip-Hop';


-- ------------------------------------------------------------
-- Query 2: LEFT JOIN
-- Business question: Show all events, including those with
-- no ticket sales on record.
-- Keeps every row from the left table (events) regardless
-- of whether a match exists in ticket_sales.
-- Rows with no match will show NULL in the ticket_sales columns.
-- ------------------------------------------------------------

SELECT
  e.event_name,
  e.genre,
  t.customer_name,
  t.sale_date
FROM events e
LEFT JOIN ticket_sales t
  ON e.event_id = t.event_id;


-- ------------------------------------------------------------
-- Query 3: LEFT JOIN exclusion pattern
-- Business question: Which events have had zero ticket sales?
-- Adding WHERE IS NULL after a LEFT JOIN filters to ONLY
-- the rows with no match — the "never sold" events.
-- This cannot be replicated with an INNER JOIN.
-- ------------------------------------------------------------

SELECT
  e.event_name,
  e.genre
FROM events e
LEFT JOIN ticket_sales t
  ON e.event_id = t.event_id
WHERE t.event_id IS NULL;


-- ============================================================
-- Key concepts from this week:
--
-- INNER JOIN  → only rows with a match in both tables
-- LEFT JOIN   → all rows from left table, NULLs where no match
-- WHERE IS NULL after LEFT JOIN → find unmatched rows (exclusion join)
-- Table aliases (e, t) → shorthand to avoid repeating full table names
-- ON clause order does not affect results — it is an equality condition
-- ============================================================
