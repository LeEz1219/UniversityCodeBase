/*****************
006704029 
CSE461 LAB3
*****************/


#include <iostream>
#include <string>
#include <sstream>
#include <fstream>
#include <vector>

using namespace std;
#include "filesys.h"

Filesys::Filesys(string diskname, int numberofblocks, int blocksize) : Sdisk(diskname,numberofblocks, blocksize){
	this->rootsize = getblocksize() / 11;
	this->fatsize = (5 * getnumberofblocks()) / getblocksize() + 1;
	string buffer;
	getblock(1, buffer);
	if(buffer[0] == '#'){
		cout << "aaa" << endl;
		for(int i = 1; i <= rootsize; ++i){
			this->filename.push_back("xxxxx");
			this->firstblock.push_back(0);
		}
		fat.push_back(fatsize + 2); 
		fat.push_back(1); 
		for(int i = 2; i < getnumberofblocks(); ++i){ 
			i>fatsize+1 ?fat.push_back(i+1):fat.push_back(1);
		}
		for(int i = fatsize+2; i < getnumberofblocks(); ++i){
			fat[i] = i+1;		}
		fat[getnumberofblocks()-1]=0;
		cout << "filesystem created." << endl;
		fssynch()
		fssynch();
		cout << "sychronized" << endl;
	}else{
		
		string buffer1; 
		string buffer2; 
		string temp;
		getblock(1, buffer1);
		for(int i = 0; i < fatsize; ++i){
			getblock(2+i, temp);
		}
		buffer2 = temp;
		istringstream ibuffer1;
		istringstream ibuffer2;
		ibuffer1.str(buffer1);
		ibuffer2.str(buffer2);
		string temp1, temp2;
		for(int i = 0; i < rootsize; ++i){
			ibuffer1 >> temp1 >> temp2;
			filename.push_back(temp1);
			firstblock.push_back(stoi(temp2,nullptr));
		}
		int n;
		for (int i = 0; i < getnumberofblocks(); ++i){
			ibuffer2 >> n;
			fat.push_back(n);
		}
		cout << "file system loaded." << endl;
	}
}

int Filesys::fsclose(){
}

int Filesys::fssynch(){
	string buffer1, buffer2;
	ostringstream rstream;
	cout << "bbb" << endl;
	cout << "ccc" << endl;
	for(int i = 0; i < filename.size(); ++i){
	for(int i = 0; i < rootsize; i++){
		cout << i;
		rstream << filename[i] << " " << firstblock[i] << " ";
	}
	cout << "miao" << endl;
	buffer1 = rstream.str();
	vector<string> blocks1 = block(buffer1,getblocksize());
	cout << "woof" << endl;
	putblock(1, blocks1[0]);
	ostringstream fastream;
	for(int i = 0; i < fat.size(); ++i){
		fastream << fat[i] << " ";
	}
	buffer2 = fastream.str();
	vector<string> blocks2 = block(buffer2,getblocksize());
	for(int i = 0; i < blocks2.size(); ++i){
		putblock(2+i, blocks2[i]);
	}
}

int Filesys::newfile(string file){
}

int Filesys::rmfile(string file){
}

int Filesys::getfirstblock(string file){
}

int Filesys::addblock(string file, string block){
}

int Filesys::delblock(string file, int blocknumber){
}

int Filesys::readblock(string file, int blocknumber, string& buffer){
}

int Filesys::writeblock(string file, int blocknumber, string buffer){
}

int Filesys::nextblock(string file, int blocknumber){
}

vector<string> Filesys::block(string s, int b){
	int numofblocks;
	if(s.length()%b == 0){
		numofblocks = s.length()/b;
	}else{
		numofblocks = s.length()/b +1;
	}
	vector<string> blocks;
	for(int i = 0; i < numofblocks; ++i){
		blocks.push_back(s.substr(i*b, b));
	}
	int lastblock = blocks.size()-1;
	for(int i = blocks[lastblock].length();i<b;++i){
		blocks[lastblock]+="#";
	}
	return blocks;
}

