/* University Database
Purpose: Insert data into each table
Author: Li and Yniguez
*/

SET LINESIZE 150

SET CONSTRAINTS ALL DEFERRED;

-- Adds departments to table

INSERT INTO Department VALUES ('2345', 'CompSciEng', '5555555555', '5555555555', 'BlockA', '00123');
INSERT INTO Department VALUES ('2346', 'Math', '5555555555', '5555555555', 'BlockB', '00124');
INSERT INTO Department VALUES ('2347', 'CyberSec', '5555555555', '5555555555', 'BlockC', '00125');
INSERT INTO Department VALUES ('2348', 'Business', '5555555555', '5555555555', 'BlockD', '00126');
INSERT INTO Department VALUES ('2349', 'Hum', '5555555555', '5555555555', 'BlockE', '00127');


-- Adds staff to table

INSERT INTO AcademicStaff VALUES ('00128', '2345', '01-11-19', '00128', 'Jackson Storm', '5555555555', '5555555555', 'M', '50000', 'Lecturer', 'BS CompSci', '725 Thanos Lane');
INSERT INTO AcademicStaff VALUES ('00129', '2345', '09-08-99', '00129', 'Tony Stark', '5555555555', '5555555555', 'M', '20000', 'Professor', 'MS CompSci', '828 Bixby Drive');
INSERT INTO AcademicStaff VALUES ('00130', '2346', '01-11-08', '00130', 'Triss Merigold', '5555555555', '5555555555', 'F', '80000', 'Sr Lectur', 'BS Math', '725 Orchid Lane');
INSERT INTO AcademicStaff VALUES ('00131', '2346', '01-06-05', '00131', 'Mariaramm Billy', '5555555555', '5555555555', 'F', '85000', 'Professor', 'MS Math', 'Moonbase Outpost 69B');
INSERT INTO AcademicStaff VALUES ('00132', '2347', '01-08-15', '00132', 'Jasmine Patella', '5555555555', '5555555555', 'F', '65000', 'Lecturer', 'BS InfoTec', '565 Memorial Drive');
INSERT INTO AcademicStaff VALUES ('00133', '2347', '06-18-12', '00133', 'Richard Parker', '5555555555', '5555555555', 'M', '70000', 'Sr Lecture', 'BS InfoTec', '555 New York Street');
INSERT INTO AcademicStaff VALUES ('00134', '2348', '01-07-03', '00134', 'Captain America', '5555555555', '5555555555', 'M', '80000', 'Professor', 'BS BusAdmin', '682 New York Street');
INSERT INTO AcademicStaff VALUES ('00135', '2348', '03-16-95', '00135', 'Commander Shepard', '5555555555', '5555555555', 'M', '10000', 'Professor', 'BS BusAdmin', '999 Exodus Drive');
INSERT INTO AcademicStaff VALUES ('00136', '2349', '03-13-06', '00136', 'Cloud Strife', '5555555555', '5555555555', 'M', '75000', 'Professor', 'MS LibArt', 'Sector 7');
INSERT INTO AcademicStaff VALUES ('00137', '2349', '08-09-01', '00137', 'John Marston', '5555555555', '5555555555', 'M', '85000', 'Professor', 'MS Human', 'Beechers Hope');

-- Adds courses to table

INSERT INTO Courses VALUES ('86255', '00128', '2345', 'CompSci', '4 Years');
INSERT INTO Courses VALUES ('86258', '00129', '2345', 'CompEng', '5 Years');
INSERT INTO Courses VALUES ('76255', '00130', '2346', 'Math', '4 Years');
INSERT INTO Courses VALUES ('76256', '00131', '2346', 'ApplMath', '3 Years');
INSERT INTO Courses VALUES ('66257', '00132', '2347', 'InfoTech', '2 Years');
INSERT INTO Courses VALUES ('66258', '00133', '2347', 'CyberSec', '3 Years');
INSERT INTO Courses VALUES ('56259', '00134', '2348', 'Business', '4 Years');
INSERT INTO Courses VALUES ('56260', '00135', '2348', 'BusAdmin', '4 Years');
INSERT INTO Courses VALUES ('46255', '00136', '2349', 'LibArts', '3 Years');
INSERT INTO Courses VALUES ('46256', '00137', '2349', 'Sociology', '3 Years');


-- Adds teaching hours to tables
INSERT INTO TeachingHour VALUES ('00128', '99880', '100 Hours');
INSERT INTO TeachingHour VALUES ('00128', '99881', '100 Hours');

INSERT INTO TeachingHour VALUES ('00129', '99882', '100 Hours');
INSERT INTO TeachingHour VALUES ('00129', '99883', '90 Hours');

INSERT INTO TeachingHour VALUES ('00130', '99884', '100 Hours');
INSERT INTO TeachingHour VALUES ('00130', '99885', '80 Hours');

INSERT INTO TeachingHour VALUES ('00131', '99886', '100 Hours');
INSERT INTO TeachingHour VALUES ('00131', '99887', '85 Hours');

INSERT INTO TeachingHour VALUES ('00132', '99888', '100 Hours');
INSERT INTO TeachingHour VALUES ('00132', '99889', '75 Hours');

INSERT INTO TeachingHour VALUES ('00133', '99890', '100 Hours');
INSERT INTO TeachingHour VALUES ('00133', '99891', '60 Hours');

INSERT INTO TeachingHour VALUES ('00134', '99892', '100 Hours');
INSERT INTO TeachingHour VALUES ('00134', '99893', '80 Hours');

INSERT INTO TeachingHour VALUES ('00135', '99894', '100 Hours');
INSERT INTO TeachingHour VALUES ('00135', '99895', '100 Hours');

INSERT INTO TeachingHour VALUES ('00136', '99896', '100 Hours');
INSERT INTO TeachingHour VALUES ('00136', '99897', '95 Hours');

INSERT INTO TeachingHour VALUES ('00137', '99898', '60 Hours');
INSERT INTO TeachingHour VALUES ('00137', '99899', '50 Hours');


-- Adds modules to tables

INSERT INTO Modules VALUES ('99880', '86255', '00128', 'CSE201', '17-SEP-18', '19-DEC-18', 'C++ Progr.', '95%');
INSERT INTO Modules VALUES ('99881', '86255', '00128', 'CSE202', '09-JAN-19', '13-MAR-19', 'C++ Progr.', '92%');

INSERT INTO Modules VALUES ('99882', '86258', '00129', 'CSE208', '20-MAR-19', '13-JUN-19', 'Verilog', '90%');
INSERT INTO Modules VALUES ('99883', '86258', '00129', 'CSE308', '23-JUN-19', '09-AUG-19', 'Verilog', '93%');

INSERT INTO Modules VALUES ('99884', '76255', '00130', 'MATH272', '17-SEP-18', '19-DEC-18', 'Algebra', '98%');
INSERT INTO Modules VALUES ('99885', '76255', '00130', 'MATH372', '09-JAN-19', '13-MAR-19', 'Calculus', '92%');

INSERT INTO Modules VALUES ('99886', '76256', '00131', 'MATH250', '20-MAR-19', '13-JUN-19', 'Disc. Math', '89%');
INSERT INTO Modules VALUES ('99887', '76256', '00131', 'MATH350', '23-JUN-19', '09-AUG-19', 'Combinat.', '78%');

INSERT INTO Modules VALUES ('99888', '66257', '00132', 'CIT150', '17-SEP-18', '19-DEC-18', 'CompTIA A+', '95%');
INSERT INTO Modules VALUES ('99889', '66257', '00132', 'CIT151', '09-JAN-19', '13-MAR-19', 'CompTIA A+', '90%');

INSERT INTO Modules VALUES ('99890', '66258', '00133', 'CIT350', '20-MAR-19', '13-JUN-19', 'Network+', '86%');
INSERT INTO Modules VALUES ('99891', '66258', '00133', 'CSE351', '23-JUN-19', '09-AUG-19', 'Security+', '82%');

INSERT INTO Modules VALUES ('99892', '56259', '00134', 'BUS211', '17-SEP-18', '19-DEC-18', 'Bus Princ', '95%');
INSERT INTO Modules VALUES ('99893', '56259', '00134', 'BUS212', '09-JAN-19', '13-MAR-19', 'Bus Princ', '90%');

INSERT INTO Modules VALUES ('99894', '56260', '00135', 'BUS311', '20-MAR-19', '13-JUN-19', 'MGMT Thry', '92%');
INSERT INTO Modules VALUES ('99895', '56260', '00135', 'BUS312', '23-JUN-19', '09-AUG-19', 'MGMT Thry', '90%');

INSERT INTO Modules VALUES ('99896', '46255', '00136', 'LIB150', '17-SEP-18', '19-DEC-18', 'Lib Arts', '98%');
INSERT INTO Modules VALUES ('99897', '46255', '00136', 'LIB180', '09-JAN-19', '13-MAR-19', 'Lib Arts', '95%');

INSERT INTO Modules VALUES ('99898', '46256', '00137', 'SPC306', '20-MAR-19', '13-JUN-19', 'Soc Theory', '99%');
INSERT INTO Modules VALUES ('99899', '46256', '00137', 'SOC400', '23-JUN-19', '09-AUG-19', 'Soc Theory', '98%');


-- Adds student modules info to tables

INSERT INTO StudentModule VALUES ('99880', '00562555', 'A');
INSERT INTO StudentModule VALUES ('99880', '00562556', 'B');
INSERT INTO StudentModule VALUES ('99880', '00562557', 'A');

INSERT INTO StudentModule VALUES ('99881', '00562558', 'B');
INSERT INTO StudentModule VALUES ('99881', '00562559', 'A');
INSERT INTO StudentModule VALUES ('99881', '00562560', 'C');

INSERT INTO StudentModule VALUES ('99882', '00562561', 'A');
INSERT INTO StudentModule VALUES ('99882', '00562562', 'C');
INSERT INTO StudentModule VALUES ('99882', '00562563', 'C');

INSERT INTO StudentModule VALUES ('99883', '00562564', 'B');
INSERT INTO StudentModule VALUES ('99883', '00562565', 'A');
INSERT INTO StudentModule VALUES ('99883', '00562566', 'A');

INSERT INTO StudentModule VALUES ('99884', '00562567', 'A');
INSERT INTO StudentModule VALUES ('99884', '00562568', 'C');
INSERT INTO StudentModule VALUES ('99884', '00562569', 'D');

INSERT INTO StudentModule VALUES ('99885', '00562570', 'B');
INSERT INTO StudentModule VALUES ('99885', '00562571', 'B');
INSERT INTO StudentModule VALUES ('99885', '00562572', 'A');

INSERT INTO StudentModule VALUES ('99886', '00562573', 'A');
INSERT INTO StudentModule VALUES ('99886', '00562574', 'B');
INSERT INTO StudentModule VALUES ('99886', '00562575', 'B');

INSERT INTO StudentModule VALUES ('99887', '00562576', 'C');
INSERT INTO StudentModule VALUES ('99887', '00562577', 'A');
INSERT INTO StudentModule VALUES ('99887', '00562578', 'C');

INSERT INTO StudentModule VALUES ('99888', '00562579', 'B');
INSERT INTO StudentModule VALUES ('99888', '00562580', 'B');
INSERT INTO StudentModule VALUES ('99888', '00562581', 'A');

INSERT INTO StudentModule VALUES ('99889', '00562582', 'A');
INSERT INTO StudentModule VALUES ('99889', '00562583', 'D');
INSERT INTO StudentModule VALUES ('99889', '00562584', 'D');

INSERT INTO StudentModule VALUES ('99890', '00562585', 'B');
INSERT INTO StudentModule VALUES ('99890', '00562586', 'B');
INSERT INTO StudentModule VALUES ('99890', '00562587', 'C');

INSERT INTO StudentModule VALUES ('99891', '00562588', 'F');
INSERT INTO StudentModule VALUES ('99891', '00562589', 'A');
INSERT INTO StudentModule VALUES ('99891', '00562590', 'B');

INSERT INTO StudentModule VALUES ('99892', '00562591', 'B');
INSERT INTO StudentModule VALUES ('99892', '00562592', 'B');
INSERT INTO StudentModule VALUES ('99892', '00562593', 'B');

INSERT INTO StudentModule VALUES ('99893', '00562594', 'B');
INSERT INTO StudentModule VALUES ('99893', '00562595', 'B');
INSERT INTO StudentModule VALUES ('99893', '00562596', 'C');

INSERT INTO StudentModule VALUES ('99894', '00562597', 'C');
INSERT INTO StudentModule VALUES ('99894', '00562598', 'C');
INSERT INTO StudentModule VALUES ('99894', '00562599', 'D');

INSERT INTO StudentModule VALUES ('99895', '00562600', 'C');
INSERT INTO StudentModule VALUES ('99895', '00562601', 'C');
INSERT INTO StudentModule VALUES ('99895', '00562602', 'C');

INSERT INTO StudentModule VALUES ('99896', '00562603', 'A');
INSERT INTO StudentModule VALUES ('99896', '00562604', 'A');
INSERT INTO StudentModule VALUES ('99896', '00562605', 'A');

INSERT INTO StudentModule VALUES ('99897', '00562606', 'A');
INSERT INTO StudentModule VALUES ('99897', '00562607', 'B');
INSERT INTO StudentModule VALUES ('99897', '00562608', 'C');

INSERT INTO StudentModule VALUES ('99898', '00562609', 'C');
INSERT INTO StudentModule VALUES ('99898', '00562610', 'B');
INSERT INTO StudentModule VALUES ('99898', '00562611', 'C');

INSERT INTO StudentModule VALUES ('99899', '00562612', 'A');
INSERT INTO StudentModule VALUES ('99899', '00562613', 'A');
INSERT INTO StudentModule VALUES ('99899', '00562614', 'B');


-- Adds students to tables

INSERT INTO Students VALUES ('00562555', '99880', '562555', 'Isaac Newton', 'Titanus Moon', '08-MAY-95', 'M', 'Y');
INSERT INTO Students VALUES ('00562556', '99880', '562556', 'Jane Shepard', '325 Lincoln Avenue', '01-JAN-94', 'F', 'Y');
INSERT INTO Students VALUES ('00562557', '99880', '562557', 'John Shepard', '324 Lincoln Avenue', '01-JAN-94', 'M', 'N');
INSERT INTO Students VALUES ('00562558', '99881', '562558', 'Garrus Vakarian', '76543 Imaginary Lane', '05-MAR-90', 'M', 'Y');
INSERT INTO Students VALUES ('00562559', '99881', '562559', 'Tali Zorrah', '468 Chastity Drive', '21-FEB-96', 'F', 'Y');
INSERT INTO Students VALUES ('00562560', '99881', '562560', 'Miranda Lawson', '799 Illusive Parkway', '18-DEC-92', 'F', 'N');
INSERT INTO Students VALUES ('00562561', '99882', '562561', 'Jacob Taylor', '234 Johnson Street', '15-NOV-93', 'M', 'N');
INSERT INTO Students VALUES ('00562562', '99882', '562562', 'Thane Krios', '555 Madeup Road', '18-JUL-90', 'M', 'Y');
INSERT INTO Students VALUES ('00562563', '99882', '562563', 'Kasumi Goto', '21356 Spy Avenue', '25-MAY-94', 'F', 'Y');
INSERT INTO Students VALUES ('00562564', '99883', '562564', 'Urdnot Grunt', '3456 Tuchanka', '30-APR-2005', 'M', 'N');
INSERT INTO Students VALUES ('00562565', '99883', '562565', 'Jack Sharpe', '6892 Tormund Road', '25-AUG-2000', 'M', 'N');
INSERT INTO Students VALUES ('00562566', '99883', '562566', 'Jane Chakwas', '2345 Normandy Lane', '22-SEP-1960', 'F', 'Y');
INSERT INTO Students VALUES ('00562567', '99884', '562567', 'David Anderson', '5432 Dreadnaught Parkway', '15-APR-69', 'M', 'N');
INSERT INTO Students VALUES ('00562568', '99884', '562568', 'Liara T-soni', '2315 Thessia Avenue', '12-MAY-42', 'F', 'Y');
INSERT INTO Students VALUES ('00562569', '99884', '562569', 'Samara McNamara', '5679 Thessia Avenue', '15-NOV-32', 'F', 'N');
INSERT INTO Students VALUES ('00562570', '99885', '562570', 'Gwen Stacy', '1498 Washington Street', '29-DEC-89', 'F', 'Y');
INSERT INTO Students VALUES ('00562571', '99885', '562571', 'Peter Parker', '2341 Adams Street', '12-JAN-89', 'M', 'Y');
INSERT INTO Students VALUES ('00562572', '99885', '562572', 'Gordon Lachance', '156 Castle Rock Drive', '08-FEB-39', 'M', 'N');
INSERT INTO Students VALUES ('00562573', '99886', '562573', 'Chris Chambers', '236 Castle Rock Drive', '05-JAN-39', 'M', 'Y');
INSERT INTO Students VALUES ('00562574', '99886', '562574', 'Jake Chambers', '112 Train Avenue', '25-MAR-59', 'M', 'N');
INSERT INTO Students VALUES ('00562575', '99886', '562575', 'The Rock', '7651 Doom Drive', '30-APR-81', 'M', 'N');
INSERT INTO Students VALUES ('00562576', '99887', '562576', 'Austin Powers', '9731 Shaggy Lane', '13-JUN-51', 'M', 'N');
INSERT INTO Students VALUES ('00562577', '99887', '562577', 'Genghis Kahn', '2234 Mongolia Street', '18-SEP-75', 'M', 'N');
INSERT INTO Students VALUES ('00562578', '99887', '562578', 'Walter White', '135 Negro Arroya Lane', '11-FEB-51', 'M', 'Y');
INSERT INTO Students VALUES ('00562579', '99888', '562579', 'Teddy Duchamp', '542 Castle Rock Drive', '11-APR-39', 'M', 'Y');
INSERT INTO Students VALUES ('00562580', '99888', '562580', 'Andy Dufresne', '2349 Royal River Avenue', '21-APR-25', 'M', 'N');
INSERT INTO Students VALUES ('00562581', '99888', '562581', 'Don Norton', '9821 Royal River Avenue', '21-MAY-22', 'M', 'Y');
INSERT INTO Students VALUES ('00562582', '99889', '562582', 'Ricky Ricardo', '555 Donna Street', '28-DEC-41', 'M', 'Y');
INSERT INTO Students VALUES ('00562583', '99889', '562583', 'Lucille Ball', '555 Donna Street', '05-MAY-45', 'F', 'N');
INSERT INTO Students VALUES ('00562584', '99889', '562584', 'Doctor Strange', '321 Mysterious Lane', '18-JUN-85', 'M', 'N');
INSERT INTO Students VALUES ('00562585', '99890', '562585', 'Lady Gaga', '5985 Poker Face Street', '23-JUL-85', 'F', 'Y');
INSERT INTO Students VALUES ('00562586', '99890', '562586', 'Darkseid', '222 Heaven Street', '20-NOV-56', 'M', 'N');
INSERT INTO Students VALUES ('00562587', '99890', '562587', 'I AM GROOT', 'I AM GROOT', '05-MAY-95', 'M', 'Y');
INSERT INTO Students VALUES ('00562588', '99891', '562588', 'Napolean Bonaparte', '574 Pike Drive', '20-JAN-45', 'M', 'Y');
INSERT INTO Students VALUES ('00562589', '99891', '562589', 'Gilgamesh', '2019 Flood Lane', '24-AUG-56', 'M', 'Y');
INSERT INTO Students VALUES ('00562590', '99891', '562590', 'Hector Salamanca', '2087 Walter Avenue', '14-SEP-79', 'M', 'N');
INSERT INTO Students VALUES ('00562591', '99892', '562591', 'James Dean', '444 Pie Street', '21-MAY-92', 'M', 'Y');
INSERT INTO Students VALUES ('00562592', '99892', '562592', 'Rod Stewart', '980 Maggie May Drive', '20-JAN-58', 'M', 'N');
INSERT INTO Students VALUES ('00562593', '99892', '562593', 'Arthur Morgan', '432 Penny Lane', '21-MAR-61', 'M', 'N');
INSERT INTO Students VALUES ('00562594', '99893', '562594', 'John Marston', '219 Nickel Street', '25-MAY-78', 'M', 'Y');
INSERT INTO Students VALUES ('00562595', '99893', '562595', 'Jack Marston', '219 Nickel Street', '30-DEC-96', 'M', 'N');
INSERT INTO Students VALUES ('00562596', '99893', '562596', 'Abigail Roberts', '219 Nickel Street', '29-OCT-82', 'F', 'N');
INSERT INTO Students VALUES ('00562597', '99894', '562597', 'Jon Snow', '8975 Kingslanding Street', '15-FEB-92', 'M', 'Y');
INSERT INTO Students VALUES ('00562598', '99894', '562598', 'Rob Stark', '2225 Winterfell Lane', '12-MAR-94', 'M', 'Y');
INSERT INTO Students VALUES ('00562599', '99894', '562599', 'Roose Bolton', '5278 Reach Avenue', '28-APR-81', 'M', 'Y');
INSERT INTO Students VALUES ('00562600', '99895', '562600', 'Hannibal Lector', '2964 Clarice Lane', '15-JUN-45', 'M', 'N');
INSERT INTO Students VALUES ('00562601', '99895', '562601', 'Clarice Starling', '55432 Lector Lane', '21-JUL-78', 'F', 'Y');
INSERT INTO Students VALUES ('00562602', '99895', '562602', 'Chris Evans', '1397 America Road', '04-JUL-24', 'M', 'N');
INSERT INTO Students VALUES ('00562603', '99896', '562603', 'Stan Lee', '25790 Marvel Street', '09-SEP-32', 'M', 'Y');
INSERT INTO Students VALUES ('00562604', '99896', '562604', 'Van Gogh', '5342 Vincent Road', '11-OCT-82', 'M', 'Y');
INSERT INTO Students VALUES ('00562605', '99896', '562605', 'Godzilla', 'Pacific Ocean', '00-JAN-00', 'M', 'N');
INSERT INTO Students VALUES ('00562606', '99897', '562606', 'Mr. Crowley', '665 Dark Magic Cloud', '01-JAN-00', 'M', 'Y');
INSERT INTO Students VALUES ('00562607', '99897', '562607', 'Bruce Wayne', '2301 Batman Street', '05-FEB-67', 'M', 'N');
INSERT INTO Students VALUES ('00562608', '99897', '562608', 'Harvey Dent', '2222 Joker Drive', '09-SEP-65', 'M', 'N');
INSERT INTO Students VALUES ('00562609', '99898', '562609', 'The Joker', '2300 Batman Street', '04-FEB-67', 'M', 'Y');
INSERT INTO Students VALUES ('00562610', '99898', '562610', 'Superman', '135 Krypton Drive', '15-SEP-45', 'M', 'N');
INSERT INTO Students VALUES ('00562611', '99898', '562611', 'The Punisher', '51234 Redemption Lane', '21-OCT-61', 'M', 'Y');
INSERT INTO Students VALUES ('00562612', '99899', '562612', 'Anakin Skywalker', '9712 Darth Drive', '20-DEC-67', 'M', 'Y');
INSERT INTO Students VALUES ('00562613', '99899', '562613', 'Luke Skywalker', '5179 Force Road', '21-JAN-85', 'M', 'N');
INSERT INTO Students VALUES ('00562614', '99899', '562614', 'Johnny Cash', '531 June Bug Lane', '14-MAY-31', 'M', 'Y');


-- Adds next-of-kin to tables

INSERT INTO NextOfKin VALUES ('Isaac Newton', 'James Newton', '00562555');
INSERT INTO NextOfKin VALUES ('Jane Shepard', 'John Shepard', '00562556');
INSERT INTO NextOfKin VALUES ('John Shepard', 'Jane Shepard', '00562557');
INSERT INTO NextOfKin VALUES ('Garrus Vakarian', 'Nylus Vakarian', '00562558');
INSERT INTO NextOfKin VALUES ('Tali Zorrah', 'Jenna Zorrah', '00562559');
INSERT INTO NextOfKin VALUES ('Miranda Lawson', 'Jenny Lawson', '00562560');
INSERT INTO NextOfKin VALUES ('Jacob Taylor', 'Teddy Taylor', '00562561');
INSERT INTO NextOfKin VALUES ('Thane Krios', 'Koliak Krios', '00562562');
INSERT INTO NextOfKin VALUES ('Kasumi Goto', 'Kalara Goto', '00562563');
INSERT INTO NextOfKin VALUES ('Urdnot Grunt', 'Urdnot Wrex', '00562564');
INSERT INTO NextOfKin VALUES ('Jack Sharpe', 'Samwell Sharpe', '00562565');
INSERT INTO NextOfKin VALUES ('Jane Chakwas', 'John Chakwas', '00562566');
INSERT INTO NextOfKin VALUES ('David Anderson', 'Hackett Anderson', '00562567');
INSERT INTO NextOfKin VALUES ('Liara T-soni', 'Thomas T-soni', '00562568');
INSERT INTO NextOfKin VALUES ('Samara McNamara', 'Clarice McNamara', '00562569');
INSERT INTO NextOfKin VALUES ('Gwen Stacy', 'Maryann Stacy', '00562570');
INSERT INTO NextOfKin VALUES ('Peter Parker', 'Jameson Parker', '00562571');
INSERT INTO NextOfKin VALUES ('Gordon Lachance', 'Danny Lachance', '00562572');
INSERT INTO NextOfKin VALUES ('Chris Chambers', 'Henry Chambers', '00562573');
INSERT INTO NextOfKin VALUES ('Jake Chambers', 'Chris Chambers', '00562574');
INSERT INTO NextOfKin VALUES ('The Rock', 'Anthony Rock', '00562575');
INSERT INTO NextOfKin VALUES ('Austin Powers', 'Rebekah Powers', '00562576');
INSERT INTO NextOfKin VALUES ('Genghis Khan', 'Han Khan', '00562577');
INSERT INTO NextOfKin VALUES ('Walter White', 'Skyler White', '00562578');
INSERT INTO NextOfKin VALUES ('Teddy Duchamp', 'James Duchamp', '00562579');
INSERT INTO NextOfKin VALUES ('Andy Dufresne', 'Michelle Dufresne', '00562580');
INSERT INTO NextOfKin VALUES ('Don Norton', 'Andrew Norton', '00562581');
INSERT INTO NextOfKin VALUES ('Ricky Ricardo', 'Jose Ricardo', '00562582');
INSERT INTO NextOfKin VALUES ('Lucille Ball', 'Esther Ball', '00562583');
INSERT INTO NextOfKin VALUES ('Doctor Strange', 'Mister Strange', '00562584');
INSERT INTO NextOfKin VALUES ('Lady Gaga', 'Gentleman Gaga', '00562585');
INSERT INTO NextOfKin VALUES ('Darkseid', 'Lightseid', '00562586');
INSERT INTO NextOfKin VALUES ('I AM GROOT', 'WE ARE GROOT', '00562587');
INSERT INTO NextOfKin VALUES ('Napolean Bonaparte', 'Pedro Bonaparte', '00562588');
INSERT INTO NextOfKin VALUES ('Gilgamesh', 'Moses', '00562589');
INSERT INTO NextOfKin VALUES ('Hector Salamanca', 'Tio Salamanca', '00562590');
INSERT INTO NextOfKin VALUES ('James Dean', 'Jack Dean', '00562591');
INSERT INTO NextOfKin VALUES ('Rod Stewart', 'Marcus Stewart', '00562592');
INSERT INTO NextOfKin VALUES ('Arthur Morgan', 'Stacy Morgan', '00562593');
INSERT INTO NextOfKin VALUES ('John Marston', 'Abigail Roberts', '00562594');
INSERT INTO NextOfKin VALUES ('Jack Marston', 'Abigail Roberts', '00562595');
INSERT INTO NextOfKin VALUES ('Abigail Roberts', 'John Marston', '00562596');
INSERT INTO NextOfKin VALUES ('Jon Snow', 'Dany Snow', '00562597');
INSERT INTO NextOfKin VALUES ('Rob Stark', 'Ned Stark', '00562598');
INSERT INTO NextOfKin VALUES ('Roose Bolton', 'Ramsey Bolton', '00562599');
INSERT INTO NextOfKin VALUES ('Hannibal Lector', 'Caroline Lector', '00562600');
INSERT INTO NextOfKin VALUES ('Clarice Starling', 'Jordon Starling', '00562601');
INSERT INTO NextOfKin VALUES ('Chris Evans', 'Dan Evans', '00562602');
INSERT INTO NextOfKin VALUES ('Stan Lee', 'Bruce Lee', '00562603');
INSERT INTO NextOfKin VALUES ('Van Gogh', 'Car Gogh', '00562604');
INSERT INTO NextOfKin VALUES ('Godzilla', 'Gidorrah', '00562605');
INSERT INTO NextOfKin VALUES ('Mr. Crowley', 'Dr. Crowley', '00562606');
INSERT INTO NextOfKin VALUES ('Bruce Wayne', 'John Wayne', '00562607');
INSERT INTO NextOfKin VALUES ('Harvey Dent', 'James Dent', '00562608');
INSERT INTO NextOfKin VALUES ('The Joker', 'The Comedian', '00562609');
INSERT INTO NextOfKin VALUES ('Superman', 'Hyperman', '00562610');
INSERT INTO NextOfKin VALUES ('The Punisher', 'The Forgiver', '00562611');
INSERT INTO NextOfKin VALUES ('Anakin Skywalker', 'John Skywalker', '00562612');
INSERT INTO NextOfKin VALUES ('Luke Skywalker', 'Leia Skywalker', '00562613');
INSERT INTO NextOfKin VALUES ('Johnny Cash', 'Eddy Cash', '00562614');

SET CONSTRAINTS ALL IMMEDIATE;

SET PAUSE OFF

spool UniversityDB.txt

SELECT * FROM Department;
SELECT * FROM AcademicStaff;
SELECT * FROM Courses;
SELECT * FROM TeachingHour;
SELECT * FROM Modules;
SELECT * FROM StudentModule;
SELECT * FROM Students;
SELECT * FROM NextOfKin;

SET PAUSE ON

spool off
