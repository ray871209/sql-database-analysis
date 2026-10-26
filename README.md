# Relational Database & SQL Analysis | MySQL

A small, reproducible SQL portfolio project demonstrating relational modelling, joins, filtering, aggregation, anti-joins, activity consolidation and reusable views in a **fictional pet-training booking system**.

## Background and provenance

This independently packaged learning project was **inspired by SQL concepts practised in the University of Melbourne INFO90002 Database Systems & Information Modelling coursework (Semester 2, 2023)**. The public example is a **new adaptation**, not the submitted assignment, a reproduction of its questions, or a copy of the institution's dataset. The schema, scenario description and example records here were newly authored for portfolio use, with AI assistance in restructuring and testing. Query patterns reflect relevant coursework skills and were revised for this standalone example.

**Do not assume this project reflects a complete production system.** Customer names and all sample entries are fictional. It is not affiliated with the University of Melbourne or any business.

## Technical highlights

- 8 normalized, related tables with primary/foreign keys
- Multi-table `INNER JOIN` and `LEFT JOIN`
- `NOT EXISTS` for never-booked products, avoiding `NOT IN`/`NULL` pitfalls
- Aggregation with `GROUP BY`, `COUNT`, `SUM`
- `UNION ALL` to preserve distinct activity records
- Calendar-year filtering, plus a reusable `VIEW` and max-value selection

## Project structure

```text
schema/schema.sql          Database DDL (8 tables)
data/sample_data.sql        Fictional demonstration data
queries/                    9 commented SQL exercises
tests/                      Local regression tests
```

## Running locally (MySQL 8)

Create a new empty database in MySQL Workbench or in the CLI:

```bash
mysql -u root -p -e "CREATE DATABASE IF NOT EXISTS pet_training_portfolio;"
mysql -u root -p pet_training_portfolio < schema/schema.sql
mysql -u root -p pet_training_portfolio < data/sample_data.sql
mysql -u root -p pet_training_portfolio < queries/03-event-popularity.sql
mysql -u root -p pet_training_portfolio < queries/09-view-and-ranking.sql
```

Run `schema/schema.sql` **once against an empty database**; rerunning it requires dropping/recreating that database first. All SQL files target MySQL 8.0. Each numbered query can be run separately; query 09 creates a view and should only be run once unless the view is dropped first.

## Examples of analysis

| Analysis | SQL technique | What it illustrates |
| --- | --- | --- |
| Event attendance | `LEFT JOIN`, `COUNT`, `GROUP BY` | Popularity metrics |
| Unbooked programs | `NOT EXISTS` | Anti-join pattern |
| Instructor workload | `LEFT JOIN`, `COUNT` | Coverage of zero-count entities |
| Program value | `SUM`, `YEAR` | Booked-value estimates by year |
| Combined customer activity | `UNION ALL` | Preserve separate records |
| Most-booked breed | `CREATE VIEW`, `MAX` | Reusable aggregation + tie handling |

**Revenue caveat:** `estimated_revenue` sums listed program prices for recorded reservations; it does not account for refunds, actual payments, discounts or cancellations.

## Validation

`python3 tests/test_queries.py` runs queries against an in-memory SQLite copy of the portable schema and fixture records with compatibility functions for MySQL's `YEAR`, `CURDATE` and `CONCAT`. It checks that each query executes and verifies selected expected values. This is **not equivalent to testing on a MySQL server**; final compatibility should also be checked in MySQL 8.

## Disclosure and usage

Educational portfolio example, **not university assessment answers**. University-provided materials, assignment questions, original database dumps and student identifiers are deliberately excluded. Please check applicable institutional academic-integrity rules before publishing any coursework-derived portfolio project. No original university files are redistributed. The project contains no license grant for third-party course materials.
