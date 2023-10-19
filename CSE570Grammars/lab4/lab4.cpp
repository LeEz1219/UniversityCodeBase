#include <iostream>
#include "NonTerminal.h"
#include "CanonicalLR.h"
#include <string>
using namespace std;

int main()
{
	vector<string> grammar1;
	vector<string> grammar2;
	vector<string> grammar3;

	grammar1.push_back("S->A");
	grammar1.push_back("S->B");
	grammar1.push_back("A->C0A");
	grammar1.push_back("A->C0C");
	grammar1.push_back("C->0C1");
	grammar1.push_back("C->1C0");
	grammar1.push_back("C->CC");
	grammar1.push_back("C->#");
	grammar1.push_back("B->D1B");
	grammar1.push_back("B->D1D");
	grammar1.push_back("D->0D1");
	grammar1.push_back("D->1D0");
	grammar1.push_back("D->DD");
	grammar1.push_back("D->#");

	grammar2.push_back("S->0S0");
	grammar2.push_back("S->1S1");
	grammar2.push_back("S->1");
	grammar2.push_back("S->0");

	grammar3.push_back("S->SS");
	grammar3.push_back("S->00");
	grammar3.push_back("S->11");


	cout << "Grammar 1" << endl;
	for (unsigned int i = 0; i < grammar1.size(); i++)
	{
		cout << grammar1[i] << endl;
	}
	cout << endl;

	CanonicalLR clr0(grammar1);
	clr0.print();
	clr0.printRM();

	cout << "Grammar 2" << endl;
	for (unsigned int i = 0; i < grammar2.size(); i++)
	{
		cout << grammar2[i] << endl;
	}
	cout << endl;

	CanonicalLR clr0(grammar2);
	clr0.print();
	clr0.printRM();

	cout << "Grammar 3" << endl;
	for (unsigned int i = 0; i < grammar3.size(); i++)
	{
		cout << grammar3[i] << endl;
	}
	cout << endl;

	CanonicalLR clr0(grammar3);
	clr0.print();
	clr0.printRM();

	return 0;
}



