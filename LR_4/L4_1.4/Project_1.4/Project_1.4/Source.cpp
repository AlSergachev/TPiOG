#include <iostream>
#include <fstream>
#include <string>
#include <cstdlib>
#include <vector>

using namespace std;

int main(int count, char* array[])
{
    if (count != 5)
    {
        cout << "Count of arguments must be equal 4\n";
        return 1;
    }

    ifstream inf(array[1]);
    if (!inf.is_open())
    {
        cout << "File " << array[1] << " can't be created\n";
        return 1;
    }

    ofstream outf(array[2]);
    if (!outf.is_open())
    {
        cout << "File " << array[2] << " can't be created\n";
        return 1;
    }

    if (!array[3])
    {
        cout << "Error. Enter the search string.\n";
        return 1;
    }
            
    if (!array[4])
    {
        cout << "Error. Enter the replace string.\n";
        return 1;
    }

    string search_str = array[3];
    if (search_str == "")
    {
        cout << "Error. Enter the search string.\n";
        return 1;
    }

    string replace_str = array[4];
    vector <int> count_str;

    int j = 0;
    while (inf)
    {
        j++;
        string str;
        getline(inf, str);

        if (str == search_str)
        {
            outf << replace_str << endl;
            count_str.push_back(j);
        }
        else
        {
            outf << str << endl;
        }
    }

    inf.close();
    outf.close();

    if (count_str.size() != 0)
    {
        cout << "Number of modified rows " << count_str.size() << "\n";
    }
    else
    {
        cout << "Text not found\n";
        return 1;
    }

    return 0;
}
