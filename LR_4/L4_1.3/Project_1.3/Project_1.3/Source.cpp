#include <iostream>
#include <fstream>
#include <string>
#include <cstdlib>

using namespace std;

int main(int count, char* array[])
{
    if (count != 3)
    {
        cout << "Count of arguments must be equal 2\n";
        return 1;
    }

    ifstream inf(array[1]);
    if (!inf.is_open())
    {
        cout << "File " << array[1] << " can't be created\n";
        return 1;
    }

    if (!array[2])
    {
        cout << "Error. Enter the search string.\n";
        return 1;
    }

    string basic_str = array[2];

    int j = 0,
        n = 0;
    while (inf)
    {
        j++;
        string str;
        getline(inf, str);
        if (str == basic_str)
        {
            cout << j << "\n";
            n++;
        }
    }

    inf.close();
    if (n==0)
    {
        cout << "Text not found\n";
        return 1;
    }
     
    return 0;
}

