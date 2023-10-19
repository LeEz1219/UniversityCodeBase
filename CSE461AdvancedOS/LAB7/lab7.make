lab7: lab7.o table.o shell.o filesys.o sdisk.o
	g++ lab7.o table.o shell.o filesys.o sdisk.o -o lab7

table.o: table.cpp
	g++ -c table.cpp

shell.o: shell.cpp
	g++ -c shell.cpp

filesys.o: filesys.cpp
	g++ -c filesys.cpp 
   
sdisk.o: sdisk.cpp
	g++ -c sdisk.cpp
    
lab7.o: lab7.cpp
	g++ -c lab7.cpp
    
clean: 
	rm *.o 
