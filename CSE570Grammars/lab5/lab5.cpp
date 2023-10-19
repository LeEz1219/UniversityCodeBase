#include <iostream>
#include "NonTerminal.h"
#include "CanonicalLR.h"
#include <string>
using namespace std;

int main()
{
	vector<string> grammar;

	grammar.push_back("S->E");
	grammar.push_back("E->E+T");
	grammar.push_back("T->T*F");
	grammar.push_back("T->F");
	grammar.push_back("F->i");
	grammar.push_back("F->(E)");



	cout << "Grammar" << endl;
	for (unsigned int i = 0; i < grammar.size(); i++)
	{
		cout << grammar[i] << endl;
	}
	cout << endl;

	NonTerminal language(grammar);
	language.printProduction();
	language.printFirst();
	language.printFollow();

	CanonicalLR clr0(grammar);
	clr0.print();
	clr0.printRM();

	return 0;
}



