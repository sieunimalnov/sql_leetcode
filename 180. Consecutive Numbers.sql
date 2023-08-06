/*
Table: Logs

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| num         | varchar |
+-------------+---------+
In SQL, id is the primary key for this table.
id is an autoincrement column.
 

Find all numbers that appear at least three times consecutively.

Return the result table in any order.

The result format is in the following example.

 

Example 1:

Input: 
Logs table:
+----+-----+
| id | num |
+----+-----+
| 1  | 1   |
| 2  | 1   |
| 3  | 1   |
| 4  | 2   |
| 5  | 1   |
| 6  | 2   |
| 7  | 2   |
+----+-----+
Output: 
+-----------------+
| ConsecutiveNums |
+-----------------+
| 1               |
+-----------------+
Explanation: 1 is the only number that appears consecutively for at least three times.
*/

WITH wb1 AS (
    SELECT
        num AS first,
        LEAD(num, 1) OVER(ORDER BY id ASC) AS second,
        LEAD(num, 2) OVER(ORDER BY id ASC) AS third
    FROM Logs
),

wb2 AS (
    SELECT first AS nums
    FROM wb1
    WHERE (first = second) AND (second = third)
)

SELECT DISTINCT nums AS ConsecutiveNums
FROM wb2;
