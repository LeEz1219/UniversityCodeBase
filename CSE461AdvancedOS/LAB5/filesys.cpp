/******************************
006704029
CSE461   Lab5
*******************************/
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
		for(int i = 1; i <= rootsize; ++i){
			this->filename.push_back("xxxxx");
			this->firstblock.push_back(0);
		}
		fat.push_back(fatsize + 2); 
		fat.push_back(1);                             // ROOT
		for(int i = 2; i < getnumberofblocks(); ++i){ // FAT 
			i>fatsize+1 ?fat.push_back(i+1):fat.push_back(1);
		}
		fat[getnumberofblocks()-1]=0;
		cout << "filesystem created." << endl;
		fssynch();
		cout << "sychronized" << endl;
	    }else{
		string buffer1;                                //ROOT
		string buffer2;                                //FAT
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
	for(int i = 0; i < rootsize; i++){
		rstream << filename[i] << " " << firstblock[i] << " ";
	}
	buffer1 = rstream.str();
	vector<string> blocks1 = block(buffer1,getblocksize());
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
	for(int i = 0; i < filename.size(); ++i){
		if(filename[i] == "xxxxx"){
			filename[i] = file;
			firstblock[i] = 0;
			fssynch();
			return 1;
		}
	}
	cout << "No room on disk" << endl;
	return 0;
}
int Filesys::rmfile(string file){
	for(int i = 0; i < filename.size(); ++i){
		if(filename[i] == file){
			filename[i] = "xxxxx";
			firstblock[i] = 0;
			fssynch();
			return 1;
		}
	}
	cout << "No such file exists." << endl;
	return 0;
}
int Filesys::getfirstblock(string file){
	for(int i = 0; i < filename.size(); ++i){
                if(filename[i] == file){
			return firstblock[i];
		}
        }
        cout << "No such file exists." << endl;
        return -1;
}
int Filesys::addblock(string file, string buffer){
	int allocate = fat[0];
	if(allocate == 0){
		cout << "No space on device.";
		return 0;
	}
	fat[0] = fat[fat[0]];
	fat[allocate] = 0;
	int fblock = getfirstblock(file);
	if(fblock == -1){
		return 0;
	}
	if(fblock == 0){
		for (int i = 0; i < filename.size(); ++i){
			if(filename[i]==file){
				firstblock[i] = allocate;
				break;
			}
		}
	}else{
		while(fat[fblock]!=0){
			fblock = fat[fblock];
		}
		fat[fblock] = allocate;
	}
	fssynch();
	putblock(allocate, buffer);
	return allocate;
}
int Filesys::delblock(string file, int blocknumber){
	if(!checkblock(blocknumber, file)){
		cout << "Nothing can be done.";
		return 0;
	}
	int fblock = getfirstblock(file);
	if(fblock == blocknumber){
		for(int i = 0; i < filename.size(); ++i){
			if(filename[i] == file){
				firstblock[i] = fat[firstblock[i]];
			}
		}
	}else{
		while(fat[fblock]!=blocknumber){
			fblock = fat[fblock];
		}
		fat[fblock] = fat[fat[fblock]];
	}
	fat[blocknumber] = fat[0];
	fat[0] = blocknumber;
	fssynch();
	return blocknumber;
}
int Filesys::readblock(string file, int blocknumber, string& buffer){
	int fblock = getfirstblock(file);
	if(fblock == -1){
		cout << "File was not found" << endl;
		return -1;
	}
	if(checkblock(blocknumber,file)){
		getblock(blocknumber, buffer);
		return 0;
	}
	return -1;
}
int Filesys::writeblock(string file, int blocknumber, string buffer){
	int fblock = getfirstblock(file);
	if (fblock == -1){
		cout << "File was not found." << endl;
		return -1;
	}
	if (checkblock(blocknumber,file)){
		putblock(blocknumber, buffer);
		return 0;
	}
	return -1;
}
int Filesys::nextblock(string file, int blocknumber){
	int fblock = getfirstblock(file);
	if (fblock == -1){
		cout << "File was not found." << endl;
		return -1;
	}
	if (checkblock(blocknumber,file)){
		return fat[blocknumber];
	}else{
		cout << "Block " << blocknumber << " does not belong to file " << file << "." << endl;
		return -1;
	}
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
bool Filesys::checkblock(int bnum, string file){
	int fblock = getfirstblock(file);
	while(fblock!=0){
		if(fblock == bnum){
			return true;
		}
		fblock = fat[fblock];
	}
	return false;
}
