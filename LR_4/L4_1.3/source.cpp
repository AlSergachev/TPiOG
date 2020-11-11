#include <iostream>
#include <fstream>
#include <string>
#include <cstdlib>
#include <vector>

using namespace std;

int main(int count, char* array[])
{
    ifstream inf(array[1]);

    if (!inf)
    {
        cerr << "Error. The file cannot be opened.\n";
        exit(1);
    }

    if (!array[2])
    {
        cerr << "Error. Enter the search string.\n";
        exit(1);
    }

    string basic_str = array[2];
    vector <int> count_str;

    int j = 0;
    while(inf)
    {
	    j++;
            string str;
            getline(inf,str);
	    if(str == basic_str)
	    {
		    count_str.push_back(j);
	    }
    }

    cout << "Count line " << j+1 << "\n";

    inf.close();

    if(count_str.size() != 0)
    {
	    for(size_t i = 0; i < count_str.size();i++)
	    {
	    cout << count_str[i] << "\n";
	    }
    }
    else
    {
	    cerr << "Text not found\n";
	    return 1;
    }

    return 0;
}

