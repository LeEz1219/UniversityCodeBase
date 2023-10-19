#include <iostream>
#include <string>

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

Shell:Shell(string filename, int blocksize, int numberofblocks): Filesys(filename, numberofblocks, blocksize){

}

int Shell:dir(){
	vector<string> v = ls();
	for(string s : v){
		cout << s << "\t";
	}
	cout << endl;
	return 1;
}

int add(string file){



	
