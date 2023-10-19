
SET PAGESIZE 150

spool inserthotel_output.txt

SET CONSTRAINTS ALL DEFERRED;

INSERT INTO Hotel(hotelNo, hotelName, city) VALUES ('H001','SunShine', 'SanBernardino');
INSERT INTO Hotel(hotelNo, hotelName, city) VALUES ('H002','KingStay', 'Riverside');
INSERT INTO Hotel(hotelNo, hotelName, city) VALUES ('H003','Hilton', 'LosAngeles');


INSERT INTO Room (roomNo, hotelNo, type, price ) VALUES ('L01','H001','Luxury','200');
INSERT INTO Room (roomNo, hotelNo, type, price ) VALUES ('L02','H001','Deluxe','150');
INSERT INTO Room (roomNo, hotelNo, type, price ) VALUES ('L03','H001','Basic','100');

INSERT INTO Room (roomNo, hotelNo, type, price ) VALUES ('D01','H002','Luxury','150');
INSERT INTO Room (roomNo, hotelNo, type, price ) VALUES ('D02','H002','Deluxe','100');
INSERT INTO Room (roomNo, hotelNo, type, price ) VALUES ('D03','H002','Basic','50');

INSERT INTO Room (roomNo, hotelNo, type, price ) VALUES ('C01','H003','Luxury','300');
INSERT INTO Room (roomNo, hotelNo, type, price ) VALUES ('C02','H003','Deluxe','200');
INSERT INTO Room (roomNo, hotelNo, type, price ) VALUES ('C03','H003','Basic','100');


INSERT INTO Guest(guestNo, guestName, guestAddress) VALUES ('G001','LarryWhites','124MainSt, Riverside 92403');
INSERT INTO Guest(guestNo, guestName, guestAddress) VALUES ('G002','BarryBlack','125MainSt, Redlands 92404');
INSERT INTO Guest(guestNo, guestName, guestAddress) VALUES ('G003','MarvinGaye','126MainSt, Crona 92405');


INSERT INTO Booking(hotelNo, guestNo, dateFrom, dateTo, roomNo) VALUES ('H001','G001','4_Jan_19', '8_Jan_19', 'L01');
INSERT INTO Booking(hotelNo, guestNo, dateFrom, dateTo, roomNo) VALUES ('H001','G001','4_Feb_19', '8_Feb_19', 'L02');

INSERT INTO Booking(hotelNo, guestNo, dateFrom, dateTo, roomNo) VALUES ('H002','G002','11_Feb_19', '8_Jan_19', 'D02');
INSERT INTO Booking(hotelNo, guestNo, dateFrom, dateTo, roomNo) VALUES ('H002','G002','11_Mar_19', '8_Mar_19', 'D03');

INSERT INTO Booking(hotelNo, guestNo, dateFrom, dateTo, roomNo) VALUES ('H003','G003','12_Apr_19', '22_May_19', 'C01');
INSERT INTO Booking(hotelNo, guestNo, dateFrom, dateTo, roomNo) VALUES ('H003','G003','12_Jun_19', '22_Aug_19', 'C02');

 
SET CONSTRAINTS ALL IMMEDIATE;

SELECT * FROM Hotel;
SELECT * FROM Room;
SELECT * FROM Guest;
SELECT * FROM Booking;
spool off

