/********************
Li 006704029
CSE461
*******************/

#include<fstream>
#include<iostream>
#include<vector>
#include<string>
using namespace std;

#include"PasswordFile.h"

PasswordFile::PasswordFile(string fname){


  ifstream in;
  in.open(fname);
  filename = fname;
  if (!in){
		
            cout << "False" << filename << endl;
	return;

	}

   string str;

	while (!in.eof()){

	in >> str;

	user.push_back(str);

	in >> str;

	password.push_back(str);

	}

	in.close();

}

void PasswordFile::addpw(string u, string p){

	ofstream out;

	out.open(filename);

	user.push_back(u);

	password.push_back(p);

	if (!out){

		cout << "False" << filename << "Ready for writing" << endl;

		return;

	}

	for (int i = 0; i < user.size(); i++){

		cout << user[i] << " " << password[i] << endl;

	}

	out.close();

}

bool PasswordFile::checkpw(string u, string p){

	for (int i = 0; i < user.size(); i++){

	if (user[i] == u && password[i] == p){

			return true;

		}

	}

	return false;

}


#include"PasswordFile.h"

int main(){

	PasswordFile passfile("password.txt");

	passfile.addpw("dbotting", "123qwe");

	passfile.addpw("egomez", "qwerty");

	passfile.addpw("tongyu", "liberty");

	// write some lines to see if passwords match users

	if (passfile.checkpw("tongyu", "liberty") == true){

		cout << "Passowrd matches\n";

	}

	else

	{

		cout << "Password not match\n";

	}

	if (passfile.checkpw("egomez", "qwerty") == true)

	{

		cout << "Passowrd matches\n";

	}

	else

	{

		cout << "Password not match\n";

	}


	if (passfile.checkpw("egomez", "qwerty") == true)

	{

		cout << "Passowrd matches\n";

	}

	else

	{

		cout << "Password ot match\n";

	}

}
