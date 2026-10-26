"""Sanity checks using SQLite with a few compatibility functions; not a MySQL integration test."""
import datetime
import pathlib
import sqlite3
import unittest

ROOT = pathlib.Path(__file__).resolve().parents[1]


def build_db():
    conn = sqlite3.connect(":memory:")
    conn.create_function("CONCAT", -1, lambda *values: "".join(str(v) for v in values))
    conn.create_function("YEAR", 1, lambda date: int(str(date)[:4]))
    conn.create_function("CURDATE", 0, lambda: datetime.date.today().isoformat())
    conn.executescript((ROOT / "schema/schema.sql").read_text())
    conn.executescript((ROOT / "data/sample_data.sql").read_text())
    return conn


class QueryTests(unittest.TestCase):
    def setUp(self):
        self.conn = build_db()

    def tearDown(self):
        self.conn.close()

    def test_every_query_executes(self):
        for query_path in sorted((ROOT / "queries").glob("*.sql")):
            with self.subTest(query=query_path.name):
                sql = query_path.read_text()
                if query_path.name.startswith("09-"):
                    self.conn.executescript(sql)
                    rows = self.conn.execute("SELECT * FROM breed_obedience_bookings").fetchall()
                else:
                    rows = self.conn.execute(sql).fetchall()
                self.assertIsInstance(rows, list)

    def test_unbooked_program(self):
        sql = (ROOT / "queries/02-unbooked-programs.sql").read_text()
        rows = self.conn.execute(sql).fetchall()
        self.assertEqual([r[0] for r in rows], ["Senior Dog Fitness"])

    def test_event_counts(self):
        sql = (ROOT / "queries/03-event-popularity.sql").read_text()
        self.assertEqual(dict(self.conn.execute(sql).fetchall()), {"Community Walk": 9, "Skills Showcase": 7})

    def test_preserve_activity_rows(self):
        sql = (ROOT / "queries/07-all-activity.sql").read_text()
        self.assertEqual(len(self.conn.execute(sql).fetchall()), 31)

    def test_top_breed_can_have_ties(self):
        self.conn.executescript((ROOT / "queries/09-view-and-ranking.sql").read_text())
        results = self.conn.execute("""SELECT breed FROM breed_obedience_bookings
                                       WHERE booking_count = (SELECT MAX(booking_count) FROM breed_obedience_bookings)
                                       ORDER BY breed""").fetchall()
        self.assertGreaterEqual(len(results), 1)


if __name__ == "__main__":
    unittest.main()
