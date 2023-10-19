#ifndef FILESYS_H
#define FILESYS_H

#include "sdisk.h"
#include <vector>
#include <string>

class Filesys: public Sdisk
{
public :
Filesys();
Filesys(string diskname, int numberofblocks, int blocksize);
int fsclose();
int fssynch();
int newfile(string file);
int rmfile(string file);
int getfirstblock(string file);
int addblock(string file, string block);
int delblock(string file, int blocknumber);
int readblock(string file, int blocknumber, string& buffer);
int writeblock(string file, int blocknumber, string buffer);
int nextblock(string file, int blocknumber);
vector<string> block(string s, int b); //blocks string s into nice b size strings
vector<string> ls(); //return all files in vector "filename".
private :
int rootsize;           // maximum number of entries in ROOT
int fatsize;            // number of blocks occupied by FAT
vector<string> filename;   // filenames in ROOT
vector<int> firstblock; // firstblocks in ROOT
vector<int> fat;             // FAT
bool checkblock(int bnum, string file); //Check if block bnum is allocated to file file
};

#endif
