#include <iostream>
#include <string>
using namespace std;
bool validate1(string str);
bool validate2(string str);
int main(){
	string x = "";
	while (x != "0")
	{
		cout << "input a string to test\n";
		cin >> x;
		if (validate1(x))
			cout << "The string is valid for DFA1" << endl;
		else
			cout << "The string is not valid for DFA1" << endl;
		if (validate2(x))
			cout << "The string is valid for DFA2" << endl;
		else
			cout << "The string is not valid for DFA2" << endl;
		cout << endl;
	}
	system("pause");
	return 0;
}


bool validate1(string str){
	int table[4][4] =
	{
		0,  1,0,    0,
		1,  1,2,    0,
		2,  1,3,    0,
		3,  1,0,    1
	}; 

	int state = 0;
	for (int i = 0; i < str.size(); i++) 
		if (!(str[i] == 'a' || str[i] == 'b'))
			return false;
		switch (state) 
		{
			case 0:
				state = str[i] == 'a' ? table[0][1] : table[0][2];
				break;
			case 1:
				state = str[i] == 'a' ? table[1][1] : table[1][2];
				break;
			case 2:
				state = str[i] == 'a' ? table[2][1] : table[2][2];
				break;
			case 3:
				state = str[i] == 'a' ? table[3][1] : table[3][2];
				break;
		}
	}
	return table[state][3];
}


bool validate2(string str)
{
	int table[4][4] =
	{
		0,  1,0,    0,
		1,  1,2,    0,
		2,  3,0,    0,
		3,  1,2,    1
	};

	int state = 0;
	for (int i = 0; i < str.size(); i++)
	{
		if (!(str[i] == 'a' || str[i] == 'b'))
			return false;
		switch (state)
		{
		case 0:
			state = str[i] == 'a' ? table[0][1] : table[0][2];
			break;
		case 1:
			state = str[i] == 'a' ? table[1][1] : table[1][2];
			break;
		case 2:
			state = str[i] == 'a' ? table[2][1] : table[2][2];
			break;
		case 3:
			state = str[i] == 'a' ? table[3][1] : table[3][2];
			break;
		}
	}
	return table[state][3];
}
