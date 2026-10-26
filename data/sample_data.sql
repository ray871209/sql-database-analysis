-- Hand-authored, fictional demo records, independent from university datasets.
INSERT INTO locations VALUES (1,'North Studio','Carlton'),(2,'South Studio','Brighton'),(3,'East Studio','Richmond');
INSERT INTO customers VALUES (1,'Avery','Chen'),(2,'Jordan','Lee'),(3,'Morgan','Patel'),(4,'Taylor','Ng'),(5,'Casey','Brown');
INSERT INTO pets VALUES (1,1,'Mochi','Corgi'),(2,1,'Nori','Shiba Inu'),(3,2,'Scout','Labrador'),(4,3,'Luna','Border Collie'),(5,4,'Milo','Poodle'),(6,5,'Pepper','Corgi');
INSERT INTO instructors VALUES (1,1,'Alex','Rivera'),(2,2,'Sam','Walker'),(3,3,'Drew','Kim');
INSERT INTO programs VALUES (1,'Puppy Fundamentals',45.00),(2,'Advanced Obedience',85.00),(3,'Agility Workshop',65.00),(4,'Recall Practice',40.00),(5,'Senior Dog Fitness',55.00);
INSERT INTO reservations VALUES
 (1,1,1,1,'2023-04-12'),(2,2,1,2,'2023-05-02'),(3,3,2,2,'2023-05-10'),
 (4,4,3,3,'2024-03-03'),(5,5,2,1,'2024-03-12'),(6,6,1,2,'2024-05-01'),
 (7,1,1,2,'2025-02-08'),(8,3,2,2,'2025-07-16'),(9,4,3,3,'2025-08-23'),
 (10,2,1,4,'2026-01-20'),(11,5,2,2,'2026-03-04'),(12,6,1,1,'2026-04-01'),
 (13,1,1,2,'2026-06-12'),(14,3,2,3,'2026-07-01'),(15,4,3,2,'2026-08-15');
INSERT INTO community_events VALUES
 (1,1,'Community Walk','2023-04-14'),(2,2,'Skills Showcase','2024-03-15'),
 (3,1,'Community Walk','2025-02-15'),(4,3,'Skills Showcase','2025-08-25'),
 (5,2,'Community Walk','2026-03-10'),(6,3,'Skills Showcase','2026-08-20');
INSERT INTO event_participation VALUES
 (1,1),(1,3),(1,6),(2,2),(2,4),(3,1),(3,4),(3,6),
 (4,3),(4,5),(5,1),(5,2),(5,6),(6,3),(6,4),(6,5);
