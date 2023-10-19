

DROP TABLE Hotel CASCADE CONSTRAINTS;
CREATE TABLE Hotel(
	hotelNo	CHAR(4),
	hotelName   VARCHAR2(15),
	city VARCHAR2(15),
	CONSTRAINTS Hotel_PK PRIMARY KEY (hotelNo)
);


DROP TABLE Room CASCADE CONSTRAINTS;
CREATE TABLE Room (
	roomNo CHAR(3),	
	hotelNo	CHAR(4),
        type VARCHAR2(10),
        price VARCHAR2(5),
        CONSTRAINTS Room_PK PRIMARY KEY(roomNo, hotelNo)
);


DROP TABLE Booking CASCADE CONSTRAINTS;
CREATE TABLE Booking (
	hotelNo	CHAR(4),
        guestNo CHAR(4),
        dateFrom VARCHAR2(10),	
	dateTo VARCHAR2(10),
        roomNo CHAR(3),
        CONSTRAINTS Booking_PK PRIMARY KEY(hotelNo, guestNo, dateFrom)
);

DROP TABLE Guest CASCADE CONSTRAINTS;
CREATE TABLE Guest (
	guestNo CHAR(4),	
	guestName VARCHAR2(20),
        guestAddress VARCHAR2(30),
        CONSTRAINTS Guest_PK PRIMARY KEY(guestNo)
);

ALTER TABLE Room
	ADD CONSTRAINTS Room_hotelNo_FK FOREIGN KEY (hotelNo) REFERENCES Hotel(hotelNo);
	
	
ALTER TABLE Booking
	ADD CONSTRAINTS Booking_hotelNo_FK FOREIGN KEY (hotelNo) 
        REFERENCES Hotel(hotelNo);

ALTER TABLE Booking
	ADD CONSTRAINTS Booking_guestNo_FK FOREIGN KEY (guestNo)
        REFERENCES Guest(guestNo);

	
