#include "table.h"
#include <iostream>
#include <vector>
#include <string>
#include <sstream>
#include <fstream>

using namespace std;

/*
Class Table : public FileSys
{
public :
Table(string diskname,int blocksize,int numberofblocks, string flatfile, string indexfile);
int build_table(string input_file);
int search(string value);
private :
string flatfile;
string indexfile;
int numberofrecords;
FileSys filesystem;
int indexSearch(string value);
};
*/

Table::Table(string diskname,int blocksize,int numberofblocks, string flatfile, string indexfile)
	:Filesys(diskname, numberofblocks, blocksize)
{
	this->flatfile=flatfile;
	this->indexfile=indexfile;
	newfile(flatfile);
	newfile(indexfile);
	//this->numberofrecords = 0;
	//this->filesystem = Filesys(diskname, numberofblocks, blocksize);
}

int Table::build_table(string inputfile){
	string rec, key;
	int blockid;
	ostringstream ostream;
	ifstream mfile;
	mfile.open(inputfile);
	getline(mfile, rec);
	//numberofrecords++;
	while(mfile.good()){
		key=rec.substr(0,5);
		vector<string> blocks=block(rec, getblocksize());
		blockid=addblock(flatfile,blocks[0]);
		ostream << key << " " << blockid << " ";
		getline(mfile, rec);
		//numberofrecords++;
	}
	ostream << "xxxxx" << " " << 0 << " ";
	string buffer1 = ostream.str();
	vector<string> blocks = block(buffer1, getblocksize());
	for(int i = 0; i < blocks.size(); ++i){
		addblock(indexfile, blocks[i]);
	}
}

int Table::search(string key){
	int block = this->indexSearch(key);
	if(block == -1){
		cout << "Record not found" << endl;
	}else{
		string buffer;
		readblock(flatfile, block, buffer);
		cout << buffer;
	}
}

int Table::indexSearch(string key){
	string buffer;
	int fblock = getfirstblock(indexfile);
	while(fblock!=0){
		string b;
		readblock(indexfile,fblock, b);
		buffer += b;
		fblock = nextblock(indexfile, fblock);
	}
	istringstream istream;
	istream.str(buffer);
	string k;
	int b;
	istream >> k >> b;
	while(k!="xxxxx"){
		if(k==key){
			return b;
		}
		istream >> k >> b;
	}
	return -1;
}

