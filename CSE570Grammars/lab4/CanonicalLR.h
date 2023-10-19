#pragma once
#include <iostream>
#include <vector>
#include <string>
#include <set>
#include <unordered_map>
using namespace std;

class CanonicalLR
{
public:
	CanonicalLR(vector<string> v); 
	void print(); 
	void printRM(); 
private:
	unordered_map<string, int> refMap; 
	vector<vector<string>> CLR0; 

	string moveDotRight(string s);
	vector<string> Closure(vector<string> v, string s); 
	vector<string> initial(vector<string> v); 
};

