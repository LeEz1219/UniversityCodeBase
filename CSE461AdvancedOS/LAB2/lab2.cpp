/**************
Li
CSE461 Dr. Murphy
Lab2
**************/

#include <fstream>
#include <iostream>
#include <string>
#include <vector>
#include "sdisk.h"

using namespace std;



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


int main(){
  Sdisk disk1("test1",16,32);
  string block1, block2, block3, block4;
  for (int i=1; i<=32; i++) block1=block1+"1";
  for (int i=1; i<=32; i++) block2=block2+"2";
  disk1.putblock(4,block1);
  disk1.getblock(4,block3);
  cout << "Should be 32 1s : ";
  cout << block3 << endl;
  disk1.putblock(8,block2);
  disk1.getblock(8,block4);
  cout << "Should be 32 2s : ";
  cout << block4 << endl;;
}

