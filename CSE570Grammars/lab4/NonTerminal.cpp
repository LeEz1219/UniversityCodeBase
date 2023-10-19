
#include "NonTerminal.h"

NonTerminal::NonTerminal(vector<string> x)
{
	generateProduction(x);
	findFirst();
	findFollow();
}

void NonTerminal::printFirst()
{
	cout << "First: " << endl;
	cout << "---------------------------------" << endl;
	map<char, set<char> >::iterator mapitr = this->FirstMap.begin();
	while (mapitr != this->FirstMap.end())
	{
		cout << mapitr->first << " -> ";
		for (set<char>::iterator setitr = mapitr->second.begin(); setitr != mapitr->second.end(); ++setitr)
		{
			cout << *setitr << " ";
		}
		cout << endl;
		mapitr++;
	}
	cout << "---------------------------------" << endl;
	cout << endl;
}

void NonTerminal::printFollow()
{
	cout << "Follow: " << endl;
	cout << "---------------------------------" << endl;
	map<char, set<char> >::iterator mapitr = this->FollowMap.begin();
	while (mapitr != this->FollowMap.end())
	{
		cout << mapitr->first << " -> ";
		for (set<char>::iterator setitr = mapitr->second.begin(); setitr != mapitr->second.end(); ++setitr)
		{
			cout << *setitr << " ";
		}
		cout << endl;
		mapitr++;
	}
	cout << "---------------------------------" << endl;
	cout << endl;
}

void NonTerminal::printProduction()
{
	cout << "Production: " << endl;
	cout << "---------------------------------" << endl;
	map<char, vector<string> >::iterator mapitr = this->Productions.begin();
	while (mapitr != this->Productions.end())
	{
		cout << mapitr->first << " -> ";
		for (unsigned int i = 0; i < mapitr->second.size(); i++)
		{
			cout << mapitr->second[i];
			if (i < mapitr->second.size() - 1)
				cout << " | ";
		}
		cout << endl;
		mapitr++;
	}
	cout << "---------------------------------" << endl;
	cout << endl;
}

void NonTerminal::generateProduction(vector<string> x)
{
	vector<string> temp;
	set<char> stemp;
	stemp.insert('$');
	this->FollowMap.insert(make_pair(x[0][0], stemp)); 
	for (unsigned int i = 0; i < x.size(); i++)
	{
		if (this->Productions.find(x[i][0]) == this->Productions.end()) 
		{
			this->Productions.insert(make_pair(x[i][0], temp));
		}
		this->Productions[x[i][0]].push_back(x[i].substr(3, x[i].size()));
	}
}

void NonTerminal::findFirst()
{
	bool bad = true;
	map<char, vector<string> >::iterator mapitr = this->Productions.begin();
	while (mapitr != this->Productions.end())
	{
		bad = false;
		for (unsigned int i = 0; i < mapitr->second.size(); i++)
		{
			if (!isTerminal(mapitr->second[i][0])) 
				bad = true;
		}
		if (!bad)
		{
			set<char> temp;
			for (unsigned int i = 0; i < mapitr->second.size(); i++)
			{
				temp.insert(mapitr->second[i][0]);
			}
			FirstMap.insert(make_pair(mapitr->first, temp));
		}
		mapitr++;
	}
	bad = true;
	while (bad)
	{
		bad = false;
		map<char, vector<string> >::iterator mapitr = this->Productions.begin();
		while (mapitr != this->Productions.end()) {
			if (!inFirstMap(mapitr->first)) 
			{
				bool sBad = false;
				set<char> temp;
				temp.clear();
				for (unsigned int i = 0; i < mapitr->second.size(); i++) // loop through vector of strings to find bad production case
				{
					unsigned int j = 0;
					while (j < mapitr->second[i].size()) // loop through character of string while
					{
						if (!isTerminal(mapitr->second[i][j])) // if it is Nonterminal
						{
							if (inFirstMap(mapitr->second[i][j])) // if the Non Terminal is good
							{
								mergeCSet(temp, FirstMap.find(mapitr->second[i][j])->second);
							}
							else
							{
								bad = true; // if find a non terminal that is bad then it is bad
								sBad = true;
								break;
							}
						}
						else // if it is terminal add to temp set
						{
							temp.insert(mapitr->second[i][j]);
							break;
						}

						if (temp.find('#') == temp.end() || (mapitr->second[i].size() - 1 == j)) // if e is not in temp set or on last item of string break
							break;
						else
							temp.erase('#');
						j++;
					}
					if (sBad)
						break;
				}
				if (!sBad) // if all is good add the NonTerm to FirstMap and the temp set with it
					FirstMap.insert(make_pair(mapitr->first, temp));
			}
			mapitr++;
		}
	}
}

void NonTerminal::findFollow()
{
	set<char> temp;
	map<char, vector<string> >::iterator mapitr1 = this->Productions.begin();
	while (mapitr1 != this->Productions.end()) // loop through Nonterminals: S then A then B then C then D
	{
		char TARGET = mapitr1->first; // our target to find production is the Nonterminal we are looking at
		if (FollowMap.find(TARGET) != FollowMap.end())
		{
			temp = follow(TARGET, temp, this->Productions.begin());
			for (set<char>::iterator setiter = temp.begin(); setiter != temp.end(); setiter++)
			{
				FollowMap[TARGET].insert(*setiter);
			}
		}
		else
		{
			FollowMap.insert(make_pair(TARGET, follow(TARGET, temp, this->Productions.begin())));
		}
		
		mapitr1++;
	}
	//printFollow();
	this->foilMap();
}

set<char> NonTerminal::follow(char c, set<char> t, map<char, vector<string> >::iterator i)
{

	if (i == this->Productions.end())
		return t;

	for (unsigned int j = 0; j < i->second.size(); j++)  // loop through the vector of strings of production NonTerminal
	{
		if (isFound(i->second[j], c)) // if an instance is found 
		{
			if (isTerminal(findRHS(c, i->second[j])) && findRHS(c, i->second[j]) != ' ') // if it is terminal we just add the terminal to the set
			{
				t.insert(findRHS(c, i->second[j])); // if whats on right hand side is a terminal then add it to set
			}
			else if (!isTerminal(findRHS(c, i->second[j])))// if it is nonterminal we add it to set and also check for e
			{
				int loc = getLoc(i->second[j], c);
				mergeCSet(t, firstof(findRHS(c, i->second[j])));
				while (!isTerminal(findRHS(loc, i->second[j])) && t.find('#') != t.end()) // if there is a rhs variable that is a NT and it contains epsilon
				{
					t.erase('#');
					mergeCSet(t, firstof(findRHS(loc, i->second[j]))); // merge that set with t
					loc++;
				}
				if (findRHS(loc, i->second[j]) != ' ' && loc > i->second[j].find(c) + 1)
				{
					mergeCSet(t, firstof(findRHS(loc, i->second[j])));
				}
				if (t.find('#') != t.end())
				{
					t.erase('#');
					t.insert(i->first);
				}
			}
			else if (findRHS(c, i->second[j]) == ' ') // if nonterm is last term // -> WRONG ->>> in production and contains e
			{
				t.insert(i->first);
			}
		}
	}
	i++;
	return follow(c, t, i);
}

char NonTerminal::findRHS(char c, string s)
{
	for (unsigned int i = 0; i < s.size() - 1; i++)
	{
		if (s[i] == c)
			return s[i + 1];
	}
	return ' ';
}

char NonTerminal::findRHS(int i, string s)
{
	if (i < s.size() - 1)
		return s[i + 1];
	return ' ';
}

set<char> NonTerminal::firstof(char c)
{
	if (!isTerminal(c))
	{
		return FirstMap.find(c)->second;
	}
	set<char> stemp;
	stemp.insert(c);
	return stemp;
}

bool NonTerminal::isFound(string s, char c)
{
	for (unsigned int i = 0; i < s.size(); i++)
	{
		if (s[i] == c)
			return true;
	}
	return false;
}

int NonTerminal::getLoc(string s, char c)
{
	for (unsigned int i = 0; i < s.size(); i++)
	{
		if (s[i] == c)
			return i;
	}
	return 0;
}

void NonTerminal::foilMap()
{
	set<char> good;
	bool bad = true;
	while (bad)
	{
		bad = false;
		for (map<char, set<char> >::iterator itr = this->FollowMap.begin(); itr != this->FollowMap.end(); itr++) // iterate through map
		{
			bool smallbad = false;
			for (set<char>::iterator setitr = itr->second.begin(); setitr != itr->second.end(); setitr++) // iterate through set
			{
				if (!isTerminal(*setitr)) // if it is nonterminal we need to foil
				{
					bad = true;
					smallbad = true;
					if (*setitr == itr->first) // if set contins key nonterminal then remove from set
					{
						itr->second.erase(*setitr);
						break;
					}
					else if (good.find(*setitr) == good.end())// if it is bad we break
					{
						break;
					}
					else // if not we merge and remove
					{
						mergeCSet(itr->second, FollowMap.find(*setitr)->second);
						itr->second.erase(*setitr);
						break;
					}
				}
			}
			if (!smallbad)
			{
				good.insert(itr->first);
			}
		}
	}
}

bool NonTerminal::isTerminal(char c)
{
	return (Productions.find(c) == Productions.end()); // true if is a Terminal
}

bool NonTerminal::inFirstMap(char c)
{
	return (FirstMap.find(c) != FirstMap.end()); // true if in the FirstMap
}

void NonTerminal::mergeCSet(set<char> &a, set<char> b)
{
	for (set<char>::iterator setitr = b.begin(); setitr != b.end(); ++setitr)
	{
		a.insert(*setitr);
	}
}

