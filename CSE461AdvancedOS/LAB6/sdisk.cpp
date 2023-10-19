/******************************
006704029
CSE461   Lab6
*******************************/
#include <iostream>
#include <string>
#include <vector>
#include <fstream>

using namespace std;
#include "sdisk.h"

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

