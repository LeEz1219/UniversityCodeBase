#ifndef TABLE_H_
#define TABLE_H_

#include <iostream>
#include <string>
#include "filesys.h"

using namespace std;

class Table : public Filesys
{
public:
Table(string diskname,int blocksize,int numberofblocks, string flatfile, string indexfile);
int build_table(string input_file);
int search(string value);
private :
string flatfile;
string indexfile;
int indexSearch(string value);
};

#endif
