package sql

const (
	// Users (Пользователи)
	QueryCreateUser = `INSERT INTO users (last_name, first_name, username, password) VALUES ($1, $2, $3, $4) RETURNING id;`
	QueryGetUser    = `SELECT * FROM users WHERE id = $1;`
	QueryUpdateUser = `UPDATE users SET last_name = $2, first_name = $3, username = $4, password = $5 WHERE id = $1;`
	QueryDeleteUser = `DELETE FROM users WHERE id = $1;`

	// Roles (Роли)
	QueryCreateRole = `INSERT INTO roles (name) VALUES ($1) RETURNING id;`
	QueryGetRole    = `SELECT * FROM roles WHERE id = $1;`
	QueryUpdateRole = `UPDATE roles SET name = $2 WHERE id = $1;`
	QueryDeleteRole = `DELETE FROM roles WHERE id = $1;`

	// User Roles (Связь пользователей и ролей)
	QueryCreateUserRole = `INSERT INTO user_roles (user_id, role_id) VALUES ($1, $2);`
	QueryGetUserRoles   = `SELECT * FROM user_roles WHERE user_id = $1;`
	QueryDeleteUserRole = `DELETE FROM user_roles WHERE user_id = $1 AND role_id = $2;`

	// Hospitals (Больницы)
	QueryCreateHospital = `INSERT INTO hospitals (name, address, contact_phone) VALUES ($1, $2, $3) RETURNING id;`
	QueryGetHospital    = `SELECT * FROM hospitals WHERE id = $1;`
	QueryUpdateHospital = `UPDATE hospitals SET name = $2, address = $3, contact_phone = $4 WHERE id = $1;`
	QueryDeleteHospital = `DELETE FROM hospitals WHERE id = $1;`

	// Rooms (Кабинеты)
	QueryCreateRoom = `INSERT INTO rooms (hospital_id, name) VALUES ($1, $2) RETURNING id;`
	QueryGetRoom    = `SELECT * FROM rooms WHERE id = $1;`
	QueryUpdateRoom = `UPDATE rooms SET name = $2 WHERE id = $1;`
	QueryDeleteRoom = `DELETE FROM rooms WHERE id = $1;`

	// Doctors (Врачи)
	QueryCreateDoctor = `INSERT INTO doctors (user_id, specialization) VALUES ($1, $2) RETURNING id;`
	QueryGetDoctor    = `SELECT * FROM doctors WHERE id = $1;`
	QueryUpdateDoctor = `UPDATE doctors SET specialization = $2 WHERE id = $1;`
	QueryDeleteDoctor = `DELETE FROM doctors WHERE id = $1;`

	// Timetable (Расписание)
	QueryCreateTimetable = `INSERT INTO timetable (hospital_id, doctor_id, time_from, time_to, room) VALUES ($1, $2, $3, $4, $5) RETURNING id;`
	QueryGetTimetable    = `SELECT * FROM timetable WHERE id = $1;`
	QueryUpdateTimetable = `UPDATE timetable SET hospital_id = $2, doctor_id = $3, time_from = $4, time_to = $5, room = $6 WHERE id = $1;`
	QueryDeleteTimetable = `DELETE FROM timetable WHERE id = $1;`

	// Appointments (Записи на прием)
	QueryCreateAppointment = `INSERT INTO appointments (timetable_id, user_id, appointment_time) VALUES ($1, $2, $3) RETURNING id;`
	QueryGetAppointment    = `SELECT * FROM appointments WHERE id = $1;`
	QueryUpdateAppointment = `UPDATE appointments SET timetable_id = $2, user_id = $3, appointment_time = $4 WHERE id = $1;`
	QueryDeleteAppointment = `DELETE FROM appointments WHERE id = $1;`

	// Visit History (История посещений)
	QueryCreateVisitHistory = `INSERT INTO visit_history (patient_id, hospital_id, doctor_id, room, visit_date, data) VALUES ($1, $2, $3, $4, $5, $6) RETURNING id;`
	QueryGetVisitHistory    = `SELECT * FROM visit_history WHERE id = $1;`
	QueryUpdateVisitHistory = `UPDATE visit_history SET hospital_id = $2, doctor_id = $3, room = $4, visit_date = $5, data = $6 WHERE id = $1;`
	QueryDeleteVisitHistory = `DELETE FROM visit_history WHERE id = $1;`
)
