/******************************
006704029
CSE461   Lab5
*******************************/

#ifndef FILESYS_H
#define FILESYS_H

#include <vector>
#include <string>
#include "sdisk.h"

Class Filesys : public Sdisk
{
Public:
	Filesys(string filename);
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
Private:
	int rootsize;           // maximum number of entries in ROOT
	int fatsize;            // number of blocks occupied by FAT
	vector<string> filename;   // filenames in ROOT
	vector<int> firstblock; // firstblocks in ROOT
	vector<int> fat;             // FAT
}

#endif
