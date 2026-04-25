--Show customer and event infor for hip-hop events-
SELECT 
e.event_name, 
e.genre, 
t.customer_name
FROM events e
JOIN ticket_sales t
ON e.event_id = t.event_id
WHERE e.genre= ’Hip-Hop’
--show ticket for events with volumes higher than 50--
Select 
e.event_name, 
e.genre, 
SUM(t.quantity) as ticket_sales
FROM events e
JOIN ticket_sales t
ON e.event_id = t.event_id
GROUP BY event_name
HAVING SUM(t.quantity) > 50
-- show sections with sales that have a revenue below 500--
SELECT
e.venue_section, 
SUM(e.ticket_price * t.quantity) as revenue
FROM events e
INNER JOIN ticket_sales t
ON e.event_id = t.event_id
GROUP BY e.venue_section
HAVING revenue < 500
