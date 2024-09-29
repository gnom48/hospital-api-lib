package models

import (
	"time"
)

type User struct {
	Id        int       `json:"id"`
	LastName  string    `json:"lastName"`
	FirstName string    `json:"firstName"`
	Username  string    `json:"username"`
	Password  string    `json:"password"`
	CreatedAt time.Time `json:"createdAt"`
}

type Role struct {
	Id   int    `json:"id"`
	Name string `json:"name"`
}

type UserRole struct {
	UserId int `json:"userId"`
	RoleId int `json:"roleId"`
}

type Hospital struct {
	Id           int       `json:"id"`
	Name         string    `json:"name"`
	Address      string    `json:"address"`
	ContactPhone string    `json:"contactPhone"`
	CreatedAt    time.Time `json:"createdAt"`
}

type Room struct {
	Id         int    `json:"id"`
	HospitalId int    `json:"hospitalId"`
	Name       string `json:"name"`
}

type Doctor struct {
	Id             int    `json:"id"`
	UserId         int    `json:"userId"`
	Specialization string `json:"specialization"`
}

type Timetable struct {
	Id         int       `json:"id"`
	HospitalId int       `json:"hospitalId"`
	DoctorId   int       `json:"doctorId"`
	TimeFrom   time.Time `json:"timeFrom"`
	TimeTo     time.Time `json:"timeTo"`
	Room       string    `json:"room"`
}

type Appointment struct {
	Id              int       `json:"id"`
	TimetableId     int       `json:"timetableId"`
	UserId          int       `json:"userId"`
	AppointmentTime time.Time `json:"appointmentTime"`
}

type VisitHistory struct {
	Id         int       `json:"id"`
	PatientId  int       `json:"patientId"`
	HospitalId int       `json:"hospitalId"`
	DoctorId   int       `json:"doctorId"`
	Room       string    `json:"room"`
	VisitDate  time.Time `json:"visitDate"`
	Data       string    `json:"data"`
}
