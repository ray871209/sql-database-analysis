-- Original, simplified relational schema for a synthetic training-booking example.
-- Designed for MySQL 8; table names and records are not copied from course materials.
CREATE TABLE locations (
  location_id INT PRIMARY KEY,
  location_name VARCHAR(80) NOT NULL,
  suburb VARCHAR(80) NOT NULL
);
CREATE TABLE customers (
  customer_id INT PRIMARY KEY,
  given_name VARCHAR(60) NOT NULL,
  family_name VARCHAR(60) NOT NULL
);
CREATE TABLE pets (
  pet_id INT PRIMARY KEY,
  customer_id INT NOT NULL,
  pet_name VARCHAR(60) NOT NULL,
  breed VARCHAR(80) NOT NULL,
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
CREATE TABLE instructors (
  instructor_id INT PRIMARY KEY,
  location_id INT NOT NULL,
  given_name VARCHAR(60) NOT NULL,
  family_name VARCHAR(60) NOT NULL,
  FOREIGN KEY (location_id) REFERENCES locations(location_id)
);
CREATE TABLE programs (
  program_id INT PRIMARY KEY,
  program_name VARCHAR(80) NOT NULL UNIQUE,
  group_price DECIMAL(10,2) NOT NULL
);
CREATE TABLE reservations (
  reservation_id INT PRIMARY KEY,
  pet_id INT NOT NULL,
  instructor_id INT NOT NULL,
  program_id INT NOT NULL,
  session_date DATE NOT NULL,
  FOREIGN KEY (pet_id) REFERENCES pets(pet_id),
  FOREIGN KEY (instructor_id) REFERENCES instructors(instructor_id),
  FOREIGN KEY (program_id) REFERENCES programs(program_id)
);
CREATE TABLE community_events (
  event_id INT PRIMARY KEY,
  location_id INT NOT NULL,
  event_name VARCHAR(80) NOT NULL,
  event_date DATE NOT NULL,
  FOREIGN KEY (location_id) REFERENCES locations(location_id)
);
CREATE TABLE event_participation (
  event_id INT NOT NULL,
  pet_id INT NOT NULL,
  PRIMARY KEY (event_id, pet_id),
  FOREIGN KEY (event_id) REFERENCES community_events(event_id),
  FOREIGN KEY (pet_id) REFERENCES pets(pet_id)
);
