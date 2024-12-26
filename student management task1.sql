-- Create the database
create database studentmanagement;

-- Use the database
use studentmanagement;

-- Create the Students table
create table students (
    studentid int auto_increment primary key,
    name varchar(50) not null,
    gender varchar(1) not null check (gender in ('M', 'F')),
    age int not null,
    grade varchar(10),
    mathscore int check (mathscore between 0 and 100),
    sciencescore int check (sciencescore between 0 and 100),
    englishscore int check (englishscore between 0 and 100)
);
-- Purpose: Populate the Students table with 10 sample records 

insert into students (name, gender, age, grade, mathscore, sciencescore, englishscore) values
('arjun sharma', 'M', 15, 'A', 92, 85, 88),
('shivani verma', 'F', 16, 'A', 95, 92, 90),
('rahul patel', 'M', 14, 'B', 78, 80, 82),
('ananya gupta', 'F', 17, 'A', 90, 87, 94),
('krishna iyer', 'M', 15, 'B', 85, 88, 84),
('riya jain', 'F', 14, 'C', 65, 70, 68),
('akash kumar', 'M', 16, 'B', 82, 75, 80),
('neha deshmukh', 'F', 15, 'A', 94, 96, 93),
('manish joshi', 'M', 17, 'C', 60, 65, 62),
('priya nair', 'F', 14, 'B', 88, 84, 86);

select *from students;

-- Purpose: Calculate average scores for male and female students to compare gender-based performance
select gender, 
       avg(mathscore) as avg_mathscore, -- Average Math score for each gender
       avg(sciencescore) as avg_sciencescore, -- Average Science score for each gender
       avg(englishscore) as avg_englishscore -- Average English score for each gender
from students
group by gender;

-- Purpose: highest total score across all subjects to identify the top performer
select
    StudentID,
    Name,
    Gender,
    Age,
    Grade,
    MathScore,
    ScienceScore,
    EnglishScore,
    (MathScore + ScienceScore + EnglishScore) AS TotalScore
from Students
order by TotalScore desc
limit 1;
select *from students;

-- Purpose: Count the number of students in each grade to observe grade distributions
select grade, count(*) as student_count
from students
group by grade;

-- Purpose: Calculate average scores for male and female students to compare gender-based performance
select gender, 
       avg(mathscore) as avg_mathscore,
       avg(sciencescore) as avg_sciencescore,
       avg(englishscore) as avg_englishscore
from students
group by gender;

select *
from students
where mathscore > 80;
-- Purpose:update the data
update students
set grade = 'A'
where studentid = 3;

-- Display the updated data
select * 
from students;

show databases;
