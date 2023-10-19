#include "CanonicalLR.h"

CanonicalLR::CanonicalLR(vector<string> v)
{
	vector<string> dotProductions = initial(v);
	string augProd = dotProductions[0];
	CLR0.push_back(Closure(dotProductions, augProd));
	refMap.insert(pair<string, int>(augProd, 0));
	for (unsigned int i = 0; i < CLR0.size(); i++) {
		for (unsigned int j = 0; j < CLR0[i].size(); j++) {
			string currentProd = CLR0[i][j];
			string nextProd = moveDotRight(currentProd);
			if (nextProd != currentProd) {
				if (refMap.find(nextProd) == refMap.end()) {
					vector<string> closure = Closure(dotProductions, nextProd);
					CLR0.push_back(closure);
					refMap.insert(pair<string, int>(nextProd, CLR0.size() - 1));
				}
			}
		}
	}
}

vector<string> CanonicalLR::initial(vector<string> v)
{
	vector<string> s;
	string temp;
	temp = v[0][0];
	temp += "'->.";
	temp += v[0][0];
	s.push_back(temp);
	for (unsigned int i = 0; i < v.size(); i++) {
		temp = v[i];
		temp.insert(3, ".");
		s.push_back(temp);
	}
	return s;
}

void CanonicalLR::printRM()
{
	cout << "Reference Map" << endl;
	cout << "---------------------------------" << endl;
	for (auto it = this->refMap.begin(); it != this->refMap.end(); it++) {
		cout << it->first << " - " << it->second << endl;
	}
	cout << "---------------------------------" << endl;
	cout << endl;

}

string CanonicalLR::moveDotRight(string s)
{
	int loc = s.find(".", 3);
	if (loc != s.size() - 1)
		swap(s.at(loc), s.at(loc + 1));
	return s;
}

vector<string> CanonicalLR::Closure(vector<string> v, string s)
{
	vector<string> temp;
	temp.push_back(s);
	set<char> variables;
	for (unsigned int i = 0; i < v.size(); i++) {
		variables.insert(v[i][0]);
	}
	set<char> seen;
	for (unsigned int i = 0; i < temp.size(); i++) {
		int dotLoc = temp[i].find(".", 3);
		char nextChar = temp[i][dotLoc + 1];
		if (variables.find(nextChar) != variables.end() && seen.find(nextChar) == seen.end()) {
			for (unsigned int j = 1; j < v.size(); j++) {
				if (v[j][0] == nextChar) {
					temp.push_back(v[j]);
				}
			}
			seen.insert(nextChar);
		}
	}
	return temp;
}

void CanonicalLR::print()
{
	cout << "Canonical LR(0) Collection" << endl;
	cout << "---------------------------------" << endl;
	for (unsigned int i = 0; i < this->CLR0.size(); i++) {
		cout << "Table: " << i << endl;
		for (unsigned int j = 0; j < this->CLR0[i].size(); j++) {
			cout << this->CLR0[i][j] << endl;
		}
		cout << endl;
	}
	cout << "---------------------------------" << endl;
	cout << endl;
}
