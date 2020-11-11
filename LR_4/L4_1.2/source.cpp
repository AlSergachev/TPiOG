


#include <iostream>
#include <fstream>
#include <string>
#include <cstdlib>

using namespace std;

int main(int count, char* array[])
{
    ifstream inf1(array[1]);
    ifstream inf2(array[2]);

    if (!inf1)
    {
        cerr << "Error. The first file cannot be opened.\n";
        exit(1);
    }

    if (!inf2)
    {
        cerr << "Error. The second file cannot be opened.\n";
        exit(1);
    }

    int j = 0;
    while(inf1)
    {
	    j++;
	    string str1, str2;
	    getline(inf1, str1);
	    getline(inf2, str2);
	    if(str1 != str2)
	    {
		    cout << "Files are defferent. Line number is " << j << "\n";
		    return 1;
	    }
    }

    cout << "Count line " << j << "\n";

    inf1.close();
    inf2.close();

    cout << "Files are equal\n";

    return 0;
}

