/**************
Li
CSE461 Dr. Murphy
Lab2
**************/
#ifndef SDISK_H_
#define SDISK_H_

#include <string>
#include <fstream>
#include <iostream>
#include <string>
#include <vector>

using namespace std;

class Sdisk{

public :
Sdisk(string diskname, int numberofblocks, int blocksize);
int getblock(int blocknumber, string& buffer);
int putblock(int blocknumber, string buffer);
int getnumberofblocks();
int getblocksize();
private :
string diskname;       
int numberofblocks;    
int blocksize;         
};

#endif

