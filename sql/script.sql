-- Создание таблицы пользователей
CREATE TABLE users (
    id VARCHAR(36) PRIMARY KEY,
    last_name VARCHAR(100) NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    username VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    is_active BOOLEAN DEFAULT true
);

-- Создание таблицы токенов
CREATE TABLE tokens (
    id VARCHAR(36) PRIMARY KEY,
    token VARCHAR(255),
    user_id VARCHAR(36) REFERENCES users(id) ON DELETE CASCADE,
    is_regular BOOLEAN
);

-- Создание таблицы ролей
CREATE TABLE roles (
    id VARCHAR(36) PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL
);

-- Создание таблицы для связи пользователей и ролей (многие ко многим)
CREATE TABLE user_roles (
    user_id VARCHAR(36) REFERENCES users(id) ON DELETE CASCADE,
    role_id VARCHAR(36) REFERENCES roles(id) ON DELETE CASCADE,
    PRIMARY KEY (user_id, role_id)
);

-- Создание таблицы больниц
CREATE TABLE hospitals (
    id VARCHAR(36) PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    contact_phone VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    is_active BOOLEAN DEFAULT true
);

-- Создание таблицы кабинетов
CREATE TABLE rooms (
    id VARCHAR(36) PRIMARY KEY,
    hospital_id VARCHAR(36) REFERENCES hospitals(id) ON DELETE CASCADE,
    name VARCHAR(50) NOT NULL
);

-- Создание таблицы врачей
CREATE TABLE doctors (
    id VARCHAR(36) PRIMARY KEY,
    user_id VARCHAR(36) REFERENCES users(id) ON DELETE CASCADE,
    specialization VARCHAR(100)
);

-- Создание таблицы расписания
CREATE TABLE timetable (
    id VARCHAR(36) PRIMARY KEY,
    hospital_id VARCHAR(36) REFERENCES hospitals(id) ON DELETE CASCADE,
    doctor_id VARCHAR(36) REFERENCES doctors(id) ON DELETE CASCADE,
    time_from TIMESTAMP NOT NULL,
    time_to TIMESTAMP NOT NULL,
    room VARCHAR(50) NOT NULL,
    CHECK (time_to > time_from),
    CHECK ((EXTRACT(MINUTE FROM time_to - time_from) % 30 = 0) AND (EXTRACT(SECOND FROM time_to - time_from) = 0))
);

-- Создание таблицы для записей на прием
CREATE TABLE appointments (
    id VARCHAR(36) PRIMARY KEY,
    timetable_id VARCHAR(36) REFERENCES timetable(id) ON DELETE CASCADE,
    user_id VARCHAR(36) REFERENCES users(id) ON DELETE CASCADE,
    appointment_time TIMESTAMP NOT NULL,
    UNIQUE (timetable_id, appointment_time)
);

-- Создание таблицы истории посещений
CREATE TABLE visit_history (
    id VARCHAR(36) PRIMARY KEY,
    patient_id VARCHAR(36) REFERENCES users(id) ON DELETE CASCADE,
    hospital_id VARCHAR(36) REFERENCES hospitals(id) ON DELETE CASCADE,
    doctor_id VARCHAR(36) REFERENCES doctors(id) ON DELETE CASCADE,
    room VARCHAR(50) NOT NULL,
    visit_date TIMESTAMP NOT NULL,
    data TEXT,
    UNIQUE (patient_id, visit_date)
);

-- создание пользователя по умолчанию
INSERT INTO users (id, last_name, first_name, username, password) VALUES ('ee7741a7-4301-36a8-fcfb-845fe752a35e', 'Ivanov', 'Egor', 'gnom48', 'pswd') RETURNING id;
