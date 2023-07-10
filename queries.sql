CREATE TABLE Learner(
  Learner_Id INT NOT NULL,
  DOB DATE,
  Name Varchar(20) NOT NULL,
  Gender VARCHAR(2),
  Country VARCHAR(20) ,
  PRIMARY KEY (Learner_Id)
);


CREATE TABLE Category
(
  Category_Id INT NOT NULL,
  Category_Name VARCHAR(20) NOT NULL,
  PRIMARY KEY (Category_Id)
);


CREATE TABLE Qualification
(
  qualification_id INT NOT NULL,
  Graduation VARCHAR(20),
  Post_Graduation VARCHAR(20),
  Years_Of_Experience INT,
  PRIMARY KEY (qualification_id)
);

CREATE TABLE Course
(
  Course_Id INT NOT NULL,
  Name VARCHAR(20) NOT NULL,
  Description VARCHAR(100) ,
  Duration INT NOT NULL,
  Price INT NOT NULL,
  Category_Id INT NOT NULL,
  PRIMARY KEY (Course_Id),
  FOREIGN KEY (Category_Id) REFERENCES Category(Category_Id)
);

CREATE TABLE Review
(
  Review_Id INT NOT NULL,
  Rating INT NOT NULL,
  Review_Title VARCHAR(20),
  Description VARCHAR(100),
  Learner_Id INT NOT NULL,
  Course_Id INT NOT NULL,
  PRIMARY KEY (Review_Id),
  FOREIGN KEY (Learner_Id) REFERENCES Learner(Learner_Id),
  FOREIGN KEY (Course_Id) REFERENCES Course(Course_Id)
);

CREATE TABLE Instructor
(
  Instructor_Id INT NOT NULL,
  Name VARCHAR(20) NOT NULL,
  Gender VARCHAR(20),
  Country VARCHAR(20),
  qualification_id INT,
  PRIMARY KEY (Instructor_Id),
  FOREIGN KEY (qualification_id) REFERENCES Qualification(qualification_id)
);


CREATE TABLE Certificate
(
  Certificate_Id INT NOT NULL,
  Certificate_Date DATE NOT NULL,
  Learner_Id INT NOT NULL,
  Course_Id INT NOT NULL,
  PRIMARY KEY (Certificate_Id),
  FOREIGN KEY (Learner_Id) REFERENCES Learner(Learner_Id),
  FOREIGN KEY (Course_Id) REFERENCES Course(Course_Id)
);

CREATE TABLE Quiz
(
  quiz_id INT NOT NULL,
  Quiz_number INT,
  Course_Id INT NOT NULL,
  Instructor_Id INT NOT NULL,
  PRIMARY KEY (quiz_id),
  FOREIGN KEY (Course_Id) REFERENCES Course(Course_Id),
  FOREIGN KEY (Instructor_Id) REFERENCES Instructor(Instructor_Id)
);


CREATE TABLE question
(
  question_id INT NOT NULL,
  question VARCHAR(100) NOT NULL,
  quiz_id INT NOT NULL,
  PRIMARY KEY (question_id),
  FOREIGN KEY (quiz_id) REFERENCES Quiz(quiz_id)
);


CREATE TABLE answer
(
  answer_id INT NOT NULL,
  answer VARCHAR(10) NOT NULL,
  question_id INT NOT NULL,
  PRIMARY KEY (answer_id),
  FOREIGN KEY (question_id) REFERENCES question(question_id)
);



CREATE TABLE groupp
(
  group_id INT NOT NULL,
  group_name VARCHAR(20) NOT NULL,
  Instructor_Id INT NOT NULL,
  PRIMARY KEY (group_id),
  FOREIGN KEY (Instructor_Id) REFERENCES Instructor(Instructor_Id)
);




CREATE TABLE post
(
  id INT NOT NULL,
  body VARCHAR(100) ,
  group_id INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (group_id) REFERENCES groupp(group_id)
);


CREATE TABLE Learner_Course
(
  Learner_Id INT NOT NULL,
  Course_Id INT NOT NULL,
  PRIMARY KEY (Learner_Id, Course_Id),
  FOREIGN KEY (Learner_Id) REFERENCES Learner(Learner_Id),
  FOREIGN KEY (Course_Id) REFERENCES Course(Course_Id)
);



CREATE TABLE Instructor_Course
(
  Instructor_Id INT NOT NULL,
  Course_Id INT NOT NULL,
  PRIMARY KEY (Course_Id, Instructor_Id),
  FOREIGN KEY (Course_Id) REFERENCES Course(Course_Id),
  FOREIGN KEY (Instructor_Id) REFERENCES Instructor(Instructor_Id)
);


CREATE TABLE solve
(
  grade VARCHAR(2),
  Learner_Id INT NOT NULL,
  quiz_id INT NOT NULL,
  PRIMARY KEY (Learner_Id, quiz_id),
  FOREIGN KEY (Learner_Id) REFERENCES Learner(Learner_Id),
  FOREIGN KEY (quiz_id) REFERENCES Quiz(quiz_id)
);


CREATE TABLE joinn
(
  Learner_Id INT NOT NULL,
  group_id INT NOT NULL,
  PRIMARY KEY (Learner_Id, group_id),
  FOREIGN KEY (Learner_Id) REFERENCES Learner(Learner_Id),
  FOREIGN KEY (group_id) REFERENCES groupp(group_id)
);



CREATE TABLE Account
(
  Account_Id INT NOT NULL,
  Account_Type VARCHAR(20) NOT NULL,
  Learner_Id INT,
  Instructor_Id INT,
  PRIMARY KEY (Account_Id),
  FOREIGN KEY (Learner_Id) REFERENCES Learner(Learner_Id),
  FOREIGN KEY (Instructor_Id) REFERENCES Instructor(Instructor_Id)
);


insert into Learner values (1, '01-MAY-2003', 'Aman', 'M', 'India');
insert into Learner values (2, '11-JUNE-2003', 'Naman', 'M', 'India');
insert into Learner values (3, '07-JAN-2003', 'Raman', 'M', 'India');
insert into Learner values (4, '10-DEC-2003', 'Isha', 'F', 'India');
insert into Learner values (5, '04-SEP-2003', 'Sneha', 'F', 'India');

select * from Learner;


insert into Category values (1, 'Programming');
insert into Category values (2, 'Design');
insert into Category values (3, 'Business');
insert into Category values (4, 'Marketing');

select * from Category;


insert into Qualification values (1, 'B.Tech', 'M.Tech', 2);
insert into Qualification values (2, 'B.Com', 'M.Com', 2);
insert into Qualification values (3, 'B.A', 'M.A', 2);
select * from Qualification;


insert into Course values (1, 'Java', 'Java is a programming language', 2, 1000, 1);
insert into Course values (2, 'C++', 'C++ is a programming language', 3, 3000, 1);
insert into Course values (3, 'Stocks', 'Learn to invest', 4, 4000, 3);
insert into Course values (4, 'Marketing', 'Learn to market', 5, 5000, 4);
insert into Course values (5, 'Photoshop', 'Designing from scratch', 6, 6000, 2);
insert into Course values (6, 'Illustrator', 'Industry level Illustrator course', 7, 7000, 2);

select * from Course;



insert into Review values (1, 4, 'Good', 'Good course', 1, 1);
insert into Review values (2, 3, 'Average', 'Average course', 2, 2);
insert into Review values (3, 5, 'Excellent', 'Excellent course', 3, 3);
insert into Review values (4, 4, 'Good', 'Good course', 4, 4);
insert into Review values (5, 3, 'Average', 'Average course', 5, 5);

select * from Review;



insert into Instructor values(1, 'Ramakrishna', 'M', 'India', 2);
insert into Instructor values(2, 'Rajesh', 'M', 'India', 3);
insert into Instructor values(3, 'Priya', 'F', 'India', 3);
insert into Instructor values(4, 'Rahul', 'M', 'India', 1);
insert into Instructor values(5, 'Monica', 'F', 'India', 2);


select * from Instructor;



insert into Certificate values (1, '07-JUNE-2018', 1, 1);
insert into Certificate values (2, '11-NOV-2018', 2, 2);
insert into Certificate values (3, '06-OCT-2018', 3, 3);
insert into Certificate values (4, '08-DEC-2018', 4, 4);

select * from Certificate;



insert into Quiz values (1, 1, 1, 1);
insert into Quiz values (2, 2, 5, 2);
insert into Quiz values (3, 3, 6, 3);
insert into Quiz values (4, 4, 4, 4);

select * from Quiz;


insert into question values(1,'Is java object oriented?',1);
insert into question values(2,'Is photoshop a product of adobe',2);
insert into question values(3 ,'Is illustrator a product of adobe',3);
insert into question values(4,'Is marketing a good career option',4);
insert into question values(5,'Is java a product of microsoft',1);

select * from question;




insert into answer values(1,'yes',1);
insert into answer values(2,'no',2);
insert into answer values(3,'yes',3);
insert into answer values(4,'no',4);
insert into answer values(5,'yes',5);

select * from answer;




insert into groupp values(1,'Java Ki Padhai',1);
insert into groupp values(2,'C++ Ki Padhai',2);
insert into groupp values(3,'Stocks ka Group',3);
insert into groupp values(4,'Marketing ka Group',4);
insert into groupp values(5,'Photoshop pe baatein',5);

select * from groupp;



insert into post values(1,'I have uploaded the codes on my github page. Check them out',1);
insert into post values(2,'I will be rolling another course where I will continue from where I left.',2);
insert into post values(3,'Steven will be your mentor, you may contact him anytime',3);
insert into post values(4,'Follow my youtube channel, I will be sharing interview tips regarding the subject.',4);

select * from post;




insert into Learner_Course values(1,1);
insert into Learner_Course values(1,2);
insert into Learner_Course values(2,6);
insert into Learner_Course values(2,4);
insert into Learner_Course values(3,3);
insert into Learner_Course values(3,5);
insert into Learner_Course values(4,6);
insert into Learner_Course values(4,4);
insert into Learner_Course values(5,5);
insert into Learner_Course values(5,1);

select * from Learner_Course;


insert into Instructor_Course values(1,1);
insert into Instructor_Course values(2,2);
insert into Instructor_Course values(3,3);
insert into Instructor_Course values(4,4);
insert into Instructor_Course values(5,5);
insert into Instructor_Course values(5,6);




select * from solve;



insert into joinn values(1,1);
insert into joinn values(1,2);
insert into joinn values(2,3);
insert into joinn values(2,4);
insert into joinn values(3,5);
insert into joinn values(3,1);
insert into joinn values(4,2);
insert into joinn values(4,3);
insert into joinn values(5,4);
insert into joinn values(5,5);

select * from joinn;



insert into Account values(1,'Learner',1,NULL);
insert into Account values(2,'Learner',2,NULL);
insert into Account values(3,'Learner',3,NULL);
insert into Account values(4,'Learner',4,NULL);
insert into Account values(5,'Learner',5,NULL);
insert into Account values(6,'Instructor',NULL,1);
insert into Account values(7,'Instructor',NULL,2);
insert into Account values(8,'Instructor',NULL,3);
insert into Account values(9,'Instructor',NULL,4);
insert into Account values(10,'Instructor',NULL,5);

select * from Account;







-- find out the grades achieved by all the learners in the quiz they have attempted till now ..
select name , concat('in quiz number : ' , quiz_number) as grade , concat( 'has grade as : ' , grade) as Grade from learner
join solve on solve.learner_id = learner.learner_id
join quiz on quiz.quiz_id = solve.quiz_id
where learner.learner_id=2;



-- find out the certificates recieved by learners in all the courses they have been enrolled in ..
select learner.name as Name , concat('Has a cerrtificate in ' ,course.name) as Topic from learner
join certificate on certificate.certificate_id = learner.learner_id
join course on course.course_id = certificate.course_id;



-- find the reviews given by all learners on a course such that he is enrolled after 01-11-18..
select learner.name , review.description , certificate_date as enroll_date,Course.name as Course from Certificate
join learner on certificate.certificate_id = learner.learner_id
join course on course.course_id = certificate.course_id
join review on review.course_id = course.course_id
where certificate.Certificate_date >= '01-NOV-2018' AND Course.Course_id=2;


-- find the questions in quiz for course having category as design
select course.description from category
join course on course.category_id = category.category_id
join quiz on quiz.course_id = course.course_id
join question on quiz.quiz_id = question.quiz_id
where category.category_name = 'Design';


-- find the post done by the instructors who have B.Tech as qualification and M.Tech as post graduation
select post.body , instructor.name , qualification.graduation as degree from post
join groupp on post.group_id = groupp.group_id
join instructor on groupp.instructor_id = instructor.instructor_id
join qualification on instructor.qualification_id = instructor.qualification_id
where qualification.graduation = 'B.Tech' and qualification.post_graduation = 'M.Tech';


-- find the post and group which belong to the category of programming
select post.body , groupp.group_name from post
join groupp on post.group_id = groupp.group_id
join instructor on groupp.instructor_id = instructor.instructor_id
join Instructor_Course on Instructor_Course.instructor_id = instructor.instructor_id
join course on course.course_id = instructor_course.course_id
join category on course.category_id = category.category_id
where category.category_name = 'Programming';