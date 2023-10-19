DROP TABLE Department CASCADE CONSTRAINTS;
CREATE TABLE Department (
	Department_No  CHAR(4),
	Department_Name  VARCHAR2(10),
	Phone_Number  CHAR(10),
	Fax_Number  CHAR(10),
	Location CHAR(6),
	Staff_Number CHAR(5),
	CONSTRAINTS Department_PK PRIMARY KEY (Department_No)
);

DROP TABLE AcademicStaff CASCADE CONSTRAINTS;
CREATE TABLE AcademicStaff (
                 Staff_Number  CHAR(5),
                 Department_No  CHAR(4),
                 Start_Date  CHAR(9),
                 PC_UserID  VARCHAR2(10),
                 Staff_Name VARCHAR2(20),
                 Phone_Number  CHAR(10),
                 Office_Number  CHAR(10),
                 Sex  CHAR(1),
                 Salary  NUMBER(7, 2),
                 Post  VARCHAR2(10),
                 Qualifications  VARCHAR2(11),
                 Address VARCHAR2(30),         
                 CONSTRAINTS AcademicStaff_PK PRIMARY KEY (Staff_Number)
);


DROP TABLE Courses CASCADE CONSTRAINTS;
CREATE TABLE Courses (
                 Course_Code CHAR(5),              
                 Staff_Number  CHAR(5),
                 Department_No  CHAR(4),
                 Course_Title  VARCHAR2(10),
                 Duration_Date  VARCHAR2(10),
                 CONSTRAINTS Courses_PK PRIMARY KEY (Course_Code)
);


DROP TABLE TeachingHour CASCADE CONSTRAINTS;
CREATE TABLE TeachingHour (
                 Staff_Number  CHAR(5),
                 Module_Code  CHAR(5) NOT NULL,
                 Hours  VARCHAR2(10),
                 CONSTRAINTS TeachingHour_PK PRIMARY KEY (Staff_Number, Module_Code)
);


DROP TABLE Modules CASCADE CONSTRAINTS;
CREATE TABLE Modules (
                 Module_Code  CHAR(5) NOT NULL,
                 Course_Code CHAR(5),
                 Staff_Number  CHAR(5),
                 Module_Title  VARCHAR2(10),  
                 Start_Date  CHAR(9),
                 End_Date  CHAR(9),
                 Texts  VARCHAR2(10),
                 AssessmentScheme  VARCHAR2(20),
                 CONSTRAINTS Modules_PK PRIMARY KEY (Module_Code)
);


DROP TABLE StudentModule CASCADE CONSTRAINTS;
CREATE TABLE StudentModule (
                Module_Code  CHAR(5) NOT NULL,
                Matri_No  CHAR(8),
                Performance  CHAR(1),
                CONSTRAINTS StudentModule_PK PRIMARY KEY (Module_Code, Matri_No)
);


DROP TABLE Students CASCADE CONSTRAINTS;
CREATE TABLE Students (
                Matri_No  CHAR(8),
                Course_Code CHAR(5),
                PC_UserID  VARCHAR2(10),
                Student_Name  VARCHAR2(20),
                Address VARCHAR2(30),
                Date_of_Birth  CHAR(11),  
                Sex  CHAR(1),
                Financial_Loan  CHAR(1),
                CONSTRAINTS Students_PK PRIMARY KEY (Matri_No)
);


DROP TABLE NextOfKin CASCADE CONSTRAINTS;
CREATE TABLE NextOfKin (
               Student_Name  VARCHAR2(20),
               Kin_Name  VARCHAR2(20),
               Matri_No  CHAR(8),
               CONSTRAINTS NextOfKin_PK PRIMARY KEY (Student_Name, Kin_Name)
);


ALTER TABLE Department
	ADD CONSTRAINTS Department_Staff_Number_FK FOREIGN KEY (Staff_Number) 
REFERENCES AcademicStaff(Staff_Number)
	ON DELETE CASCADE DEFERRABLE;


ALTER TABLE AcademicStaff
	ADD CONSTRAINTS AcademicStaff_Department_No_FK FOREIGN KEY (Department_No) 
REFERENCES Department(Department_No)
	ON DELETE CASCADE DEFERRABLE;

ALTER TABLE Courses 
	ADD CONSTRAINTS Courses_Staff_Number_FK FOREIGN KEY (Staff_Number) 
REFERENCES AcademicStaff(Staff_Number)
    ON DELETE CASCADE DEFERRABLE;
                              
ALTER TABLE Courses
     ADD CONSTRAINTS Courses_Department_No_FK FOREIGN KEY (Department_No) 
REFERENCES Department(Department_No)
    ON DELETE CASCADE DEFERRABLE;


ALTER TABLE TeachingHour 
	ADD CONSTRAINTS TeachingHour_Staff_Number_FK FOREIGN KEY (Staff_Number) 
REFERENCES AcademicStaff(Staff_Number)
    ON DELETE CASCADE DEFERRABLE;

                
ALTER TABLE TeachingHour                
    ADD CONSTRAINTS TeachingHour_Module_Code_FK FOREIGN KEY (Module_Code) 
REFERENCES Modules(Module_Code)
    ON DELETE CASCADE DEFERRABLE;


ALTER TABLE Modules 
	ADD CONSTRAINTS Modules_Staff_Number_FK FOREIGN KEY (Staff_Number) 
REFERENCES AcademicStaff(Staff_Number)
      ON DELETE CASCADE DEFERRABLE;
                
ALTER TABLE Modules
         ADD CONSTRAINTS Modules_Course_Code_FK FOREIGN KEY (Course_Code) 
REFERENCES Courses(Course_Code)
       ON DELETE CASCADE DEFERRABLE;


ALTER TABLE StudentModule 
	ADD CONSTRAINTS StudentModule_Module_Code_FK FOREIGN KEY (Module_Code) 
REFERENCES Modules(Module_Code)
    ON DELETE CASCADE DEFERRABLE;

ALTER TABLE StudentModule
     ADD CONSTRAINTS StudentModule_Matri_No_FK FOREIGN KEY (Matri_No) 
REFERENCES Students(Matri_No)
     ON DELETE CASCADE DEFERRABLE;


ALTER TABLE Students
	ADD CONSTRAINTS Students_Course_Code_FK FOREIGN KEY (Course_Code) 
REFERENCES Courses(Course_Code)
	ON DELETE CASCADE DEFERRABLE;



ALTER TABLE NextOfKin 
    ADD CONSTRAINTS NextOfKin_Matri_No_FK FOREIGN KEY (Matri_No) 
REFERENCES Students(Matri_No)
   ON DELETE CASCADE DEFERRABLE;
