/*******************************************  
CSE572 S19 Final
EXAM Question 5 views 
006704029
*******************************************/

  CREATE VIEW SickPets AS
  SELECT p.PetName, o.OwnerName, e.VetName
    FROM Pets p, PetOwner o, Examinations e;

  
  CREATE VIEW  StaffInfo AS
  SELECT c.ClincNo, c.Addr, s.MGRname, s.COUNT(*) AS "NumberOfStaff", c.COUNT(*) 
 AS "NumberOfPet"
    FROM Clincs c, Staff s;
 
  SELECT * FROM SickPets;
  SELECT * FROM StaffInfo;
