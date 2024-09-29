-- Создание таблицы пользователей
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    last_name VARCHAR(100) NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    username VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Создание таблицы ролей
CREATE TABLE roles (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL
);

-- Создание таблицы для связи пользователей и ролей (многие ко многим)
CREATE TABLE user_roles (
    user_id INT REFERENCES users(id) ON DELETE CASCADE,
    role_id INT REFERENCES roles(id) ON DELETE CASCADE,
    PRIMARY KEY (user_id, role_id)
);

-- Создание таблицы больниц
CREATE TABLE hospitals (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    contact_phone VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Создание таблицы кабинетов
CREATE TABLE rooms (
    id SERIAL PRIMARY KEY,
    hospital_id INT REFERENCES hospitals(id) ON DELETE CASCADE,
    name VARCHAR(50) NOT NULL
);

-- Создание таблицы врачей
CREATE TABLE doctors (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id) ON DELETE CASCADE,
    specialization VARCHAR(100)
);

-- Создание таблицы расписания
CREATE TABLE timetable (
    id SERIAL PRIMARY KEY,
    hospital_id INT REFERENCES hospitals(id) ON DELETE CASCADE,
    doctor_id INT REFERENCES doctors(id) ON DELETE CASCADE,
    time_from TIMESTAMP NOT NULL,
    time_to TIMESTAMP NOT NULL,
    room VARCHAR(50) NOT NULL,
    CHECK (time_to > time_from),
    CHECK ((EXTRACT(MINUTE FROM time_to - time_from) % 30 = 0) AND (EXTRACT(SECOND FROM time_to - time_from) = 0))
);

-- Создание таблицы для записей на прием
CREATE TABLE appointments (
    id SERIAL PRIMARY KEY,
    timetable_id INT REFERENCES timetable(id) ON DELETE CASCADE,
    user_id INT REFERENCES users(id) ON DELETE CASCADE,
    appointment_time TIMESTAMP NOT NULL,
    UNIQUE (timetable_id, appointment_time)
);

-- Создание таблицы истории посещений
CREATE TABLE visit_history (
    id SERIAL PRIMARY KEY,
    patient_id INT REFERENCES users(id) ON DELETE CASCADE,
    hospital_id INT REFERENCES hospitals(id) ON DELETE CASCADE,
    doctor_id INT REFERENCES doctors(id) ON DELETE CASCADE,
    room VARCHAR(50) NOT NULL,
    visit_date TIMESTAMP NOT NULL,
    data TEXT,
    UNIQUE (patient_id, visit_date)
);
