#include <iostream>
#include <string>
#include "shell.h"

using namespace std;

/*
class Shell: public Filesys
{
Public :
Shell(string filename, int blocksize, int numberofblocks);
int dir();// lists all files
int add(string file);// add a new file using input from the keyboard
int del(string file);// deletes the file
int type(string file);//lists the contents of file
int copy(string file1, string file2);//copies file1 to file2
};
*/

Shell::Shell(string filename, int blocksize, int numberofblocks): Filesys(filename, numberofblocks, blocksize){

}

int Shell::dir(){
	/*
	vector<string> v = ls();
	for(string s : v){
		cout << s << "\t";
	}
	cout << endl;
	return 1;
	*/
	vector<string> flist=ls();
  	for (int i=0; i<flist.size(); i++){
        	cout << flist[i] << endl;
        }
}

// add a new file using input from the keyboard
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

// deletes the file
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

//lists the contents of file
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

//copies file1 to file2
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
	// create file 
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
