/******************************
006704029
CSE461   Lab6
*******************************/

#include <iostream>
#include <string>

using namespace std;
#include "shell.h"

Shell::Shell(string filename, int blocksize, int numberofblocks): Filesys(filename, numberofblocks, blocksize){
  int Shell::dir(){
	vector<string> flist=ls();
  	for (int i=0; i<flist.size(); i++){
        	cout << flist[i] << endl;
        }
}

  int Shell::add(string file) {
	string content;
	int isGood = newfile(file);
	if(isGood == -1) {
		return 0;
	}
	
	cout << "Enter a file content: ";
	getline(cin,content);
	if(content == "~") return 1;
	vector<string> blocks = block(content, getblocksize());
	for(int i = 0; i < blocks.size(); i++) {
		addblock(file, blocks[i]);
	}
	return 1;
}

  int Shell::del(string file) {
	int fblock = getfirstblock(file);
	if(fblock == -1) return 0;
	while(fblock != -1 && fblock != 0){
		if(delblock(file, fblock)==0) break;
		fblock = getfirstblock(file);
	}
	rmfile(file);
	return 1;
}
  int Shell::type(string file) {
	int fblock = getfirstblock(file);
	if(fblock == -1) 
		return 0;

	string buffer;
	while(fblock > 0) {
		readblock(file, fblock, buffer);
		fblock = nextblock(file, fblock);
		cout << buffer;
		buffer.erase(buffer.begin(),buffer.end());
	}
	cout << endl;
	return 1;
}
  int Shell::copy(string file1, string file2) {
	int firstFile = getfirstblock(file1);
	int secondFile = getfirstblock(file2);
	if(firstFile == -1) {
		cout << file1 << " doesn't exist\n";
		return 0;
	}

	if(secondFile != -1) { 
		cout <<  file2 << " already exists\n";
		return 0;
	}
	newfile(file2);
	if(firstFile == 0)
		return 0;
	
	string buff;
	while(firstFile > 0) {
		readblock(file1, firstFile, buff);
		addblock(file2, buff);
		firstFile = nextblock(file1, firstFile);
	}
	
	return 0;
}
