/*
Table: Seat

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| student     | varchar |
+-------------+---------+
id is the primary key (unique value) column for this table.
Each row of this table indicates the name and the ID of a student.
id is a continuous increment.
 

Write a solution to swap the seat id of every two consecutive students. If the number of students is odd, the id of the last student is not swapped.

Return the result table ordered by id in ascending order.

The result format is in the following example.

 

Example 1:

Input: 
Seat table:
+----+---------+
| id | student |
+----+---------+
| 1  | Abbot   |
| 2  | Doris   |
| 3  | Emerson |
| 4  | Green   |
| 5  | Jeames  |
+----+---------+
Output: 
+----+---------+
| id | student |
+----+---------+
| 1  | Doris   |
| 2  | Abbot   |
| 3  | Green   |
| 4  | Emerson |
| 5  | Jeames  |
+----+---------+
Explanation: 
Note that if the number of students is odd, there is no need to change the last one's seat.
*/

WITH wb1 As (
    SELECT
        id,
        student,
        (SELECT MAX(id) FROM Seat) AS num_seats
    FROM Seat
)
SELECT
    CASE WHEN (MOD(num_seats, 2.0) != 0) THEN
        CASE WHEN (MOD(id, 2.0) != 0) AND (id != num_seats) THEN (id + 1)
            WHEN (MOD(id, 2.0) != 0) AND (id = num_seats) THEN id
            ELSE (id - 1) END
        ELSE
        CASE WHEN (MOD(id, 2.0) != 0) THEN (id +1)
            ELSE (id - 1) END
        END AS id,
    student
FROM wb1
ORDER BY id;
