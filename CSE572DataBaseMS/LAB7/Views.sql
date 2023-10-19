

Spool views_Output.txt

CREATE VIEW "Hotel" AS "Hotel_Info"
SELECT hotelNO, hotelName
FROM Hotel
WHERE hotelNO = "H001"; 

SELECT * FROM Hotel;




CREATE VIEW "Room" AS "Room_Info"
SELECT hotelNO, roomNo
FROM Room
WHERE roomNo = "C01"; 

SELECT * FROM Room;



CREATE VIEW Guest  AS Guest_Info
SELECT guestNO, guestName
FROM Guest
WHERE guestNo = "G001"; 

SELECT * FROM Guest;


CREATE VIEW Guest AS 2nd_Guest_Info
SELECT guestNO, guestName
FROM Guest
WHERE guestNo = "G002"; 

SELECT * FROM Guest;


CREATE VIEW Booking AS Booking_Info
SELECT dateFrom, dateTO
FROM Booking
WHERE hotelNO = "H001"; 

SELECT * FROM Booking;

spool off
	
	
