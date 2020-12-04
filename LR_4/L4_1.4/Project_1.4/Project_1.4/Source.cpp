#include <iostream>
#include <fstream>
#include <string>

//tests.bat "$(TargetPath)"

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
    int search_str_length = search_str.length();

    int j = 0;
    while (inf)
    {
        string str;
        getline(inf, str);

        int it = str.find(search_str, 0);
        while (it != string::npos)
        {
            j++;
            str.replace(it, search_str_length, replace_str);
            it = str.find(search_str, it);
        }
        outf << str << endl;
    }

    inf.close();
    outf.close();

    if (j != 0)
    {
        cout << "Number of modified rows " << j << "\n";
    }
    else
    {
        cout << "Text not found\n";
        return 1;
    }

    return 0;
}
