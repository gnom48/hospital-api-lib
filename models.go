package models

import (
	"time"
)

type User struct {
	Id        string    `json:"id"`
	LastName  string    `json:"lastName"`
	FirstName string    `json:"firstName"`
	Username  string    `json:"username"`
	Password  string    `json:"password,omitempty"`
	CreatedAt time.Time `json:"createdAt"`
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
	UserId string `json:"userId"`
	RoleId string `json:"roleId"`
}

type Hospital struct {
	Id           string    `json:"id"`
	Name         string    `json:"name"`
	Address      string    `json:"address"`
	ContactPhone string    `json:"contactPhone"`
	CreatedAt    time.Time `json:"createdAt"`
	IsActive     bool      `json:"is_active"`
}

type Room struct {
	Id         string `json:"id"`
	HospitalId string `json:"hospitalId"`
	Name       string `json:"name"`
}

type Doctor struct {
	Id             string `json:"id"`
	UserId         string `json:"userId"`
	Specialization string `json:"specialization"`
}

type Timetable struct {
	Id         string    `json:"id"`
	HospitalId string    `json:"hospitalId"`
	DoctorId   string    `json:"doctorId"`
	TimeFrom   time.Time `json:"timeFrom"`
	TimeTo     time.Time `json:"timeTo"`
	Room       string    `json:"room"`
}

type Appointment struct {
	Id              string    `json:"id"`
	TimetableId     string    `json:"timetableId"`
	UserId          string    `json:"userId"`
	AppointmentTime time.Time `json:"appointmentTime"`
}

type VisitHistory struct {
	Id         string    `json:"id"`
	PatientId  string    `json:"patientId"`
	HospitalId string    `json:"hospitalId"`
	DoctorId   string    `json:"doctorId"`
	Room       string    `json:"room"`
	VisitDate  time.Time `json:"visitDate"`
	Data       string    `json:"data"`
}
