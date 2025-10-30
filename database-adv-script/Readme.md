# Joins In Advanced SQL

Joins combine data from two or more tables based on related columns.

This document explains different types of SQL JOINS while covering some advanced SQL concepts.

## LEFT JOIN
- Displays all the data from the left table, even if there is no match in the right table.

## RIGHT JOIN
- Displays all the data from the right table, even if there is no match in the left table.

## FULL OUTER JOIN
- Not supported directly in MySQL.
- We use a UNION of LEFT JOIN and RIGHT JOIN to achieve the same result.

## UNION
- Combines the results of two SELECT statements.
- Helps simulate a FULL OUTER JOIN in MySQL.
