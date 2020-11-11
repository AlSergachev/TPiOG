

#include <iostream>
#include <fstream>
#include <string>
#include <cstdlib>
#include <vector>

using namespace std;

int main(int count, char* array[])
{
    ifstream inf(array[1]);
    ofstream outf(array[2]);

    if (!inf)
    {
        cerr << "Error. The file cannot be opened.\n";
        exit(1);
    }

    /*
     if (!outf)
    {
        cerr <<"Error. The file connot be opened. \n";
	exit(1);
    }
    */

    if (!array[3])
    {
        cerr << "Error. Enter the search string.\n";
        exit(1);
    }

    if (!array[4])
    {
	    cerr << "Error. Enter the search string.\n";
	    exit(1);
    }

    string basic_str = array[3];
    string shange_str = array[4];
    vector <int> count_str;

    int j = 0;
    while(inf)
    {
            j++;
            string str;
            getline(inf,str);

            if(str == basic_str)
            {
		outf << shange_str << endl;
                count_str.push_back(j);
            }
	    else
	    {
		outf << str << endl;
	    }
    }

    cout << "Count line " << j+1 << "\n";

    inf.close();
    outf.close();

    if(count_str.size() != 0)
    {
            cout<<"Number of modified rows "  << count_str.size() << "\n";
    }
    else
    {
            cerr << "Text not found\n";
            return 1;
    }

    return 0;
}
