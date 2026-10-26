# SQL analysis: query decisions and caveats

This guide expands the independently authored fictional booking example, not assessed problem statements.

| Technique | Usage | Caveat |
|---|---|---|
| INNER JOIN | Only matched records | Drops unmatched entities |
| LEFT JOIN | Preserve zero-activity entities | Use COUNT(right_table.id), not COUNT(*) |
| NOT EXISTS | Programs without bookings | Avoids NULL traps of NOT IN |
| GROUP BY | Aggregate at a defined grain | Avoid duplicate multiplication |
| UNION ALL | Combine activity streams | Keeps legitimately repeated entries |
| VIEW | Reuse reporting logic | Portability depends on SQL dialect |

## Quality assurance
Validate foreign keys, duplicate identifiers, date ranges and pricing grain. Sum of listed reservation prices is *not* confirmed paid revenue.

## Exercises for expansion
Compare INNER JOIN and LEFT JOIN on an empty venue; validate NOT EXISTS against nullable values; investigate duplicate-safe aggregation; explain when UNION ALL is required. These are independent exercises, not reproduction of assessed tasks.
