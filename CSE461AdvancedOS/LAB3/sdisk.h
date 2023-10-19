/*****************
006704029 
CSE461 LAB3
*****************/

#ifndef SDISK_H_
#define SDISK_H_

#include <string>

using namespace std;

class Sdisk
{
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

