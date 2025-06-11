--  QUESTION 6  Rising Temperature
/*
Write a solution to find all dates' id with higher temperatures compared to its previous dates (yesterday).

Return the result table in any order.

The result format is in the following example.

Table: Weather

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| recordDate    | date    |
| temperature   | int     |
+---------------+---------+
id is the column with unique values for this table.
There are no different rows with the same recordDate.
This table contains information about the temperature on a certain day.
 
Example 1:

Input: 
Weather table:
+----+------------+-------------+
| id | recordDate | temperature |
+----+------------+-------------+
| 1  | 2015-01-01 | 10          |
| 2  | 2015-01-02 | 25          |
| 3  | 2015-01-03 | 20          |
| 4  | 2015-01-04 | 30          |
+----+------------+-------------+
Output: 
+----+
| id |
+----+
| 2  |
| 4  |
+----+

*/

-- SOLUTION
with CTE as (
select id,recordDate,temperature,
lag(recordDate,1,recordDate) over(order by recordDate) as yday
lag(temperature,1,temperature) over(order by recordDate asc) as yday_temp,
from Weather)
select id from CTE where temperature > yday_temp and datediff(recordDate,yday)=1;

/*
select w1.id 
from Weather w1
join Weather w2
on w2.recordDate = DATE_SUB(w1.recordDate, INTERVAL 1 DAY)
where w1.temperature > w2.temperature
*/