lab4: lab4.o filesys.o sdisk.o
	g++ lab4.o filesys.o sdisk.o -o lab4

filesys.o: filesys.cpp
	g++ -c filesys.cpp 
   
sdisk.o: sdisk.cpp
	g++ -c sdisk.cpp
    
lab4.o: lab4.cpp
	g++ -c lab4.cpp
    
clean: 
	rm *.o 
