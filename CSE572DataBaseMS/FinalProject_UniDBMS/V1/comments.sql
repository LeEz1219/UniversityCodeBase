/*******************************************  
Project Option: University Database 
Purpose: Comments of all tables & columns  
Author: 006704029
*******************************************/

--table Department
COMMENT ON TABLE Department IS 'ALL Departments of the University'; 
COMMENT ON COLUMN Department. Department_No IS 'department number'; 
COMMENT ON COLUMN Department. Department_Name IS 'The name of Department';
COMMENT ON COLUMN Department. Phone_Number IS 'Phone Number of the department';
COMMENT ON COLUMN Department. Location IS 'The location of Department';
COMMENT ON COLUMN Department. Staff_Number IS 'Staff Number who works in this department'; 

--table AcademicStaff
COMMENT ON TABLE AcademicStaff IS 'ALL Academic Staff of the University'; 
COMMENT ON COLUMN AcademicStaff. Staff_Number IS 'Staff Number'; 
COMMENT ON COLUMN AcademicStaff. Department_No IS 'The number of Department';
COMMENT ON COLUMN AcademicStaff. Start_Date IS 'Start Date of the staff';
COMMENT ON COLUMN AcademicStaff. PC_UserID IS 'ID number to access computers and network';
COMMENT ON COLUMN AcademicStaff. Phone_Number IS 'The Phone Number of the staff';
COMMENT ON COLUMN AcademicStaff. Office_Number IS 'The Office Number of the staff';
COMMENT ON COLUMN AcademicStaff. Sex IS 'The gender of the staff';
COMMENT ON COLUMN AcademicStaff. Salary IS 'The Salary of the staff';
COMMENT ON COLUMN AcademicStaff. Post IS 'The profession of the staff';
COMMENT ON COLUMN AcademicStaff. Qualifications IS 'The Qualifications of the staff';
COMMENT ON COLUMN AcademicStaff. Address IS 'The Address of the staff';

--table Courses
COMMENT ON TABLE Courses IS 'ALL courses in the University'; 
COMMENT ON COLUMN Courses. Course_Code IS 'the code number of a course'; 
COMMENT ON COLUMN Courses. Staff_Number IS 'Staff Number of who teaches this course'; 
COMMENT ON COLUMN Courses. Department_No IS 'department number';
COMMENT ON COLUMN Courses. Course_Title IS 'The title of a course';
COMMENT ON COLUMN Courses. Duration_Date IS 'Duration Date'; 

--table TeachingHour
COMMENT ON TABLE TeachingHour IS 'the record of Teaching Hours of every Academic staff'; 
COMMENT ON COLUMN TeachingHour. Staff_Number IS 'Staff Number';
COMMENT ON COLUMN TeachingHour. Module_Code IS 'the Code of a module'; 
COMMENT ON COLUMN TeachingHour. Hours IS 'the record of Teaching Hours of an academic staff';

--table Modules
COMMENT ON TABLE Modules IS 'ALL Modules in the University'; 
COMMENT ON COLUMN Modules. Module_Code IS 'the Code of a module'; 
COMMENT ON COLUMN Modules. Course_Code IS 'the code number of a course inside this module'; 
COMMENT ON COLUMN Modules. Staff_Number IS 'Staff Number who teaches this module';
COMMENT ON COLUMN Modules. Module_Title IS 'The name of a module';
COMMENT ON COLUMN Modules. Start_Date IS 'Start Date of the staff who teaches this module';
COMMENT ON COLUMN Modules. End_Date IS 'End Date of the staff who teaches this module';
COMMENT ON COLUMN Modules. Texts IS 'name of a text book';
COMMENT ON COLUMN Modules. AssessmentScheme IS 'Assessment Scheme';

--table StudentModule
COMMENT ON TABLE StudentModule IS 'the performance of a student in the module'; 
COMMENT ON COLUMN StudentModule. Module_Code IS 'the Code of a module'; 
COMMENT ON COLUMN StudentModule. Matriculation_Number IS 'Matriculation Number of a student';
COMMENT ON COLUMN StudentModule. Performance IS 'the grade of a student';

--table Students
COMMENT ON TABLE Students IS 'ALL Students in the University'; 
COMMENT ON COLUMN Students. Matriculation_Number IS 'the Matriculation Number of a student';
COMMENT ON COLUMN Students. Course_Code IS 'Code number of a course which student is taking'; 
COMMENT ON COLUMN Students. PC_UserID IS 'The ID number to access computers and network';
COMMENT ON COLUMN Students. Student_Name IS 'The name of a Student';
COMMENT ON COLUMN Students. Address IS 'The address of a Student';
COMMENT ON COLUMN Students. Date_of_Birth IS 'The Date of Birth of a Student';
COMMENT ON COLUMN Students. Sex IS 'The gender of the student';
COMMENT ON COLUMN Students. Financial_Loan IS 'whether this student has Financial Loan';

--table NextOfKin
COMMENT ON TABLE NextOfKin IS 'the name of a NextOfKin of a student'; 
COMMENT ON COLUMN NextOfKin. Student_Name IS 'The name of a Student'; 
COMMENT ON COLUMN NextOfKin. Kin_Name IS 'the Kin_Name of a student';
COMMENT ON COLUMN NextOfKin. Matriculation_Number IS 'the Matriculation Number of a student';


