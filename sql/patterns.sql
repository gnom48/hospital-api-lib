-- 1. Пользователи (users)
-- Создание
INSERT INTO users (last_name, first_name, username, password) VALUES ($1, $2, $3, $4) RETURNING id;
-- Чтение
SELECT * FROM users WHERE id = $1;
-- Обновление
UPDATE users SET last_name = $2, first_name = $3, username = $4, password = $5 WHERE id = $1;
-- Удаление
DELETE FROM users WHERE id = $1;

-- 2. Роли (roles)
-- Создание
INSERT INTO roles (name) VALUES ($1) RETURNING id;
-- Чтение
SELECT * FROM roles WHERE id = $1;
-- Обновление
UPDATE roles SET name = $2 WHERE id = $1;
-- Удаление
DELETE FROM roles WHERE id = $1;

-- 3. Связь пользователей и ролей (user_roles)
-- Создание
INSERT INTO user_roles (user_id, role_id) VALUES ($1, $2);
-- Чтение
SELECT * FROM user_roles WHERE user_id = $1;
-- Удаление
DELETE FROM user_roles WHERE user_id = $1 AND role_id = $2;

-- 4. Больницы (hospitals)
-- Создание
INSERT INTO hospitals (name, address, contact_phone) VALUES ($1, $2, $3) RETURNING id;
-- Чтение
SELECT * FROM hospitals WHERE id = $1;
-- Обновление
UPDATE hospitals SET name = $2, address = $3, contact_phone = $4 WHERE id = $1;
-- Удаление
DELETE FROM hospitals WHERE id = $1;

-- 5. Кабинеты (rooms)
-- Создание
INSERT INTO rooms (hospital_id, name) VALUES ($1, $2) RETURNING id;
-- Чтение
SELECT * FROM rooms WHERE id = $1;
-- Обновление
UPDATE rooms SET name = $2 WHERE id = $1;
-- Удаление
DELETE FROM rooms WHERE id = $1;

-- 6. Врачи (doctors)
-- Создание
INSERT INTO doctors (user_id, specialization) VALUES ($1, $2) RETURNING id;
-- Чтение
SELECT * FROM doctors WHERE id = $1;
-- Обновление
UPDATE doctors SET specialization = $2 WHERE id = $1;
-- Удаление
DELETE FROM doctors WHERE id = $1;

-- 7. Расписание (timetable)
-- Создание
INSERT INTO timetable (hospital_id, doctor_id, time_from, time_to, room) VALUES ($1, $2, $3, $4, $5) RETURNING id;
-- Чтение
SELECT * FROM timetable WHERE id = $1;
-- Обновление
UPDATE timetable SET hospital_id = $2, doctor_id = $3, time_from = $4, time_to = $5, room = $6 WHERE id = $1;
-- Удаление
DELETE FROM timetable WHERE id = $1;

-- 8. Записи на прием (appointments)
-- Создание
INSERT INTO appointments (timetable_id, user_id, appointment_time) VALUES ($1, $2, $3) RETURNING id;
-- Чтение
SELECT * FROM appointments WHERE id = $1;
-- Обновление
UPDATE appointments SET timetable_id = $2, user_id = $3, appointment_time = $4 WHERE id = $1;
-- Удаление
DELETE FROM appointments WHERE id = $1;

-- 9. История посещений (visit_history)
-- Создание
INSERT INTO visit_history (patient_id, hospital_id, doctor_id, room, visit_date, data) VALUES ($1, $2, $3, $4, $5, $6) RETURNING id;
-- Чтение
SELECT * FROM visit_history WHERE id = $1;
-- Обновление
UPDATE visit_history SET hospital_id = $2, doctor_id = $3, room = $4, visit_date = $5, data = $6 WHERE id = $1;
-- Удаление
DELETE FROM visit_history WHERE id = $1;
