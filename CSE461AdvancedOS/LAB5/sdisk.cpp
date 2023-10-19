/******************************
006704029
CSE461   Lab5
*******************************/

#include <iostream>
#include <fstream>
#include <string>
#include <vector>

using namespace std;
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
};


Sdisk::Sdisk(string diskname, int numberofblocks, int blocksize){
	this->diskname = diskname;
	this->numberofblocks = numberofblocks;
	this->blocksize = blocksize;
	ifstream ifs;
	ifs.open(diskname.c_str(), ios::in);
	char x = ifs.get();
	if(ifs.good()){
		cout << diskname << " disk exists." << endl;
		ifs.close();
	}else{
		ifs.close();
		ofstream ofs;
		ofs.open(diskname.c_str(), ios::out);
		for(int i = 1; i <= (blocksize * numberofblocks); ++i){
			ofs << "#";
		}
		ofs.close();
	}
}

int Sdisk::getblock(int blocknumber, string& buffer){
	if(blocknumber > this->numberofblocks) return 0;
	ifstream ifs;
	ifs.open(this->diskname, ios::in);
	ifs.seekg(blocknumber * getblocksize());
	char c;
	for(int i = 0; i < getblocksize(); ++i){
		ifs.get(c);
		buffer += c;
	}
	ifs.close();
	return 1;
}

int Sdisk::putblock(int blocknumber, string buffer){
	if(blocknumber > this->numberofblocks) return 0;
	ofstream ofs;
	ofs.open(this->diskname.c_str(), ios::out | ios::in);
	ofs.seekp((blocknumber * blocksize));
	for(int i = 0; i < blocksize && i < buffer.length(); ++i){
		ofs.put(buffer[i]);
	}
	ofs.close();
	return 1;
}
int Sdisk::getnumberofblocks(){
	return this->numberofblocks;
}
int Sdisk::getblocksize(){
	return this->blocksize;
}

