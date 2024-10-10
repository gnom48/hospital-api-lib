package models

import (
	"time"
)

type User struct {
	Id        string    `json:"id"`
	LastName  string    `json:"last_name"`
	FirstName string    `json:"first_name"`
	Username  string    `json:"username"`
	Password  string    `json:"password,omitempty"`
	CreatedAt time.Time `json:"created_at"`
	IsActive  bool      `json:"is_active"`
}

type Token struct {
	Id        string `json:"id"`
	UserId    string `json:"user_id"`
	Token     string `json:"token"`
	IsRegular bool   `json:"is_regular"`
}

type Role struct {
	Id   string `json:"id"`
	Name string `json:"name"`
}

type UserRole struct {
	UserId string `json:"user_id"`
	RoleId string `json:"role_id"`
}

type Hospital struct {
	Id           string    `json:"id"`
	Name         string    `json:"name"`
	Address      string    `json:"address"`
	ContactPhone string    `json:"contact_phone"`
	CreatedAt    time.Time `json:"created_at"`
	IsActive     bool      `json:"is_active"`
}

type Room struct {
	Id         string `json:"id"`
	HospitalId string `json:"hospital_dd"`
	Name       string `json:"name"`
}

type Doctor struct {
	Id             string `json:"id"`
	UserId         string `json:"user_id"`
	Specialization string `json:"specialization"`
}

type Timetable struct {
	Id         string    `json:"id"`
	HospitalId string    `json:"hospital_id"`
	DoctorId   string    `json:"doctor_id"`
	TimeFrom   time.Time `json:"time_from"`
	TimeTo     time.Time `json:"time_to"`
	Room       string    `json:"room"`
}

type Appointment struct {
	Id              string    `json:"id"`
	TimetableId     string    `json:"timetable_id"`
	UserId          string    `json:"user_id"`
	AppointmentTime time.Time `json:"appointment_time"`
}

type VisitHistory struct {
	Id         string    `json:"id"`
	PatientId  string    `json:"patient_id"`
	HospitalId string    `json:"hospital_id"`
	DoctorId   string    `json:"doctor_id"`
	Room       string    `json:"room"`
	VisitDate  time.Time `json:"visit_date"`
	Data       string    `json:"data"`
}
