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

    ofstream outf(array[2]);
    if (!outf.is_open())
    {
        cout << "File " << array[2] << " can't be created\n";
        return 1;
    }

    while (inf)
    {
        string strInput;
        getline(inf, strInput);
        outf << strInput << endl;
    }

    inf.close();
    outf.close();

    return 0;
}


