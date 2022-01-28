drop database example;
##1.- create new databases
create database example;
use example;
create table Course (
    CourseName varchar(100),
    duration char(2)
    );
create table Student (
     names VARCHAR(50),
     Grade VARCHAR(5),
     Courses VARCHAR(100)
     );
create table Enrollment (
     Name VARCHAR(50));
##2.-drop tables and data base
drop table student;
drop table enrollment;
drop table course;
drop database example;

###3.- Alter table to add unique, primary and foreign key constraints
create database example;
use example;
create table student(
    name varchar (50) not null);
create table course (
    description varchar (100)not null);
create table enrollment(
    enrollments varchar (50)not null);
alter table student add column Student_Id int not null primary key auto_increment;
alter table course add column Course_Id int not null primary key auto_increment;
alter table enrollment add column Enrollment_Id int not null primary key auto_increment;
alter table enrollment add column Student_Id int not null;
alter table enrollment add foreign key (Student_Id) references student(Student_Id);
alter table enrollment add column Courses_Id int not null;
alter table enrollment add foreign key (Courses_Id) references course(Course_Id);
alter table enrollment drop column enrollments;

##4.-Insert values to all 3 tables
insert into student(name) values row('victor'), row('pedro'), row('kevin');
insert into course(description) values row('Java'), row('MySQL'), row('C++');
insert into student(name) values ('jose'), ('juan'), ('maria');
insert into course(description) values ('Python'), ('VisualStudio'), ('Ruby');
insert into enrollment(Student_Id, Courses_Id) values (1,2);
insert into enrollment(Student_Id, Courses_Id) values (1,3);
insert into enrollment(Student_Id, Courses_Id) values (2,1), (3,1);

##5 delete a few courses
delete from course where Course_Id=4;
delete from course where Course_Id=5;

##6 fecth all student details who have courses enrolled and all students who have not enrolled also
select a.name, c.description from student as a
inner join enrollment as b on a.Student_Id = b.Student_Id
inner join course as c on c.Course_Id = b.Courses_Id;

#students not enrolled to the other courses
select distinct a.name, c.description from student as a
inner join enrollment as b on a.Student_Id != b.Student_Id
inner join course as c on c.Course_Id != b.Courses_Id;

#7.- get the number of students enrolled for all courses
select count(Courses_id) from enrollment where Courses_Id = 1;
select count(Courses_id) from enrollment where Courses_Id = 2; 
select count(Courses_id) from enrollment where Courses_Id = 3; 
select count(Courses_id) from enrollment where Courses_Id = 4;
select count(Courses_id) from enrollment where Courses_Id = 5;
select count(Courses_id) from enrollment where Courses_Id = 6;   
