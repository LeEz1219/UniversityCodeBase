
#pragma once
#include <map>
#include <set>
#include <iostream>
#include <algorithm>
#include <vector>
#include <string>
using namespace std;
class NonTerminal
{
public:
	NonTerminal(vector<string>);
	void printProduction();
	void printFirst();
	void printFollow();

private:
	map<char, set<char> > FirstMap;
	map<char, set<char> > FollowMap;
	map<char, vector<string> > Productions;
	void findFirst();

	void findFollow();
	set<char> follow(char c, set<char> t, map<char, vector<string> >::iterator i);
	char findRHS(char c, string s);
	char findRHS(int i, string s);
	set<char> firstof(char c);
	bool isFound(string s, char c);
	int getLoc(string s, char c);
	void foilMap();
	bool isTerminal(char c);
	bool inFirstMap(char c);
	void mergeCSet(set<char> &a, set<char> b);

};
