-- Question 15 Bigest_Single_Number

/*
A single number is a number that appeared only once in the MyNumbers table.

Find the largest single number. If there is no single number, report null.

The result format is in the following example.
Table: MyNumbers

+-------------+------+
| Column Name | Type |
+-------------+------+
| num         | int  |
+-------------+------+
This table may contain duplicates (In other words, there is no primary key for this table in SQL).
Each row of this table contains an integer.
 
Example 1:

Input: 
MyNumbers table:
+-----+
| num |
+-----+
| 8   |
| 8   |
| 3   |
| 3   |
| 1   |
| 4   |
| 5   |
| 6   |
+-----+
Output: 
+-----+
| num |
+-----+
| 6   |
+-----+
*/

--Solution
with CTE as(select num from MyNumbers group by num having count(num)=1)
select max(num) num from CTE;