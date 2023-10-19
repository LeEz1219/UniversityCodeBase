#include <iostream>
#include "NonTerminal.h"
#include "CanonicalLR.h"
#include <string>
using namespace std;

int main()
{
	vector<string> grammar;

	

	grammar.push_back("E->TD");
	grammar.push_back("D->+TD");
	grammar.push_back("D->#");
	grammar.push_back("T->FU");
	grammar.push_back("U->*FU");
	grammar.push_back("U->#");
	grammar.push_back("F->(E)");
	grammar.push_back("F->I");
	grammar.push_back("I->x");
	grammar.push_back("I->y");
	grammar.push_back("I->z");

	//grammar.push_back("S->ABCD");
	//grammar.push_back("A->a");
	//grammar.push_back("A->#");
	//grammar.push_back("B->CD");
	//grammar.push_back("B->b");
	//grammar.push_back("C->c");
	//grammar.push_back("C->#");
	//grammar.push_back("D->Aa");
	//grammar.push_back("D->d");
	//grammar.push_back("D->#");



	cout << "Grammar" << endl;
	for (unsigned int i = 0; i < grammar.size(); i++)
	{
		cout << grammar[i] << endl;
	}
	cout << endl;


	CanonicalLR clr0(grammar);
	clr0.print();
	clr0.printRM();

	return 0;
}



