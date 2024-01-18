drop database if exists QuanLiSinhVien;
create database if not exists QuanLiSinhVien;

use QuanLiSinhVien;

create table Class(
classID int auto_increment primary key,
className varchar(60) not null,
startDate datetime not null,
status bit
);

create table Student(
studentID int auto_increment primary key,
studentName varchar(30) not null,
address varchar(50),
phone varchar(20),
status bit,
classID int not null,
foreign key (classID) references Class(classID)
);

create table Subjectt(
subID int auto_increment primary key,
subName varchar(30) not null,
credit tinyint not null default 1 check (credit >= 1),
status bit default 1
);

create table Mark(
markID int auto_increment primary key,
subID int not null,
studentID int not null,
mark float default 0 check (mark between 0 and 100),
examTimes tinyint default 1,
unique (subID, studentID),
foreign key (subID) references Subjectt(subID),
foreign key (studentID) references Student(studentID)
);