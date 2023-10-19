//PasswordFile.cpp
//By Huanqing Nong 005814662
//Lab 1 for 660
// Apr 17 2018

#include <iostream>
#include <string>
#include <vector>
#include <fstream>
#include "PasswordFile.h"

using namespace std;

PasswordFile::PasswordFile(string _filename){
	this->filename = _filename;
	ifstream ifs;
        ifs.open(filename);
	if (!ifs) {
		cerr << "Unable to open file datafile.txt";
		exit(1);   // call system to stop
	}
	string u,p;
	ifs >> u >> p;
	while(ifs.good()){
		user.push_back(u);
		password.push_back(p);
		ifs >> u >> p;
	}
	ifs.close();
}

void PasswordFile::addpw(string newuser, string newpassword){
	//Check if user newuser exists already.
	for (string usr : user){
		if (usr == newuser){
			cout << "User exists.";
			return;
		}
	}
	user.push_back(newuser);
	password.push_back(encrypt(newpassword));
	synch();
}

bool PasswordFile::checkpw(string user, string passwd){
	for (int i = 0; i < this->user.size(); ++i){
                if (this->user[i] == user){
                        if (this->password[i] == encrypt(passwd)) return true;
			else return false;
                }
        }
	return false;
}

void PasswordFile::synch(){
        ofstream ofs;
	ofs.open(filename);
        if (!ofs) {
                cerr << "Unable to open file datafile.txt";
                exit(1);   // call system to stop
        }
	for (int i = 0; i < this->user.size(); ++i){
               ofs << this->user[i];
	       ofs << " ";
	       ofs << this->password[i];
	       ofs << endl;
        }
        ofs.close();
}

int PasswordFile::salt=1;

void PasswordFile::newsalt(int ns)
{
	salt=ns;
}

string PasswordFile::encrypt(string s)
{ 
	for (int i=0; i<s.size(); i++)
	{ 
		s[i]+=salt;
	}
	return s;
}

string PasswordFile::decrypt(string s)
// NOT NEEDED -
{ 
	for (int i=0; i<s.size(); i++)
	{
		s[i]-=salt;
	}
	return s;
}


int main()
{
 PasswordFile passfile("password.txt");
 passfile.addpw("dbotting","123qwe");
 passfile.addpw("egomez","qwerty");
 passfile.addpw("tongyu","liberty");
 // write some lines to see if passwords match users
 if(passfile.checkpw("tongyu", "liberty")){
	 cout << "The password matches the user." << endl;
 }
 if(!passfile.checkpw("tongyu", "liberty123")){
         cout << "The password does not match the user." << endl;
 }

}

