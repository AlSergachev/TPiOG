#include <iostream>
#include <fstream>
#include <string>
#include <cstdlib> 

using namespace std;


int main(int count, char* array[])
{
    ifstream inf(array[1]);
    ofstream outf(array[2]);


    if (count != 3)
    {
        cout << "Count of arguments must be equal 2\n" << endl;
        return 1;
    }

    if (!inf)
    {
        cout << "Error. The first file cannot be opened." << endl;
        return 1 ;
    }

    if (!outf)
    {
        cout << "Error. The second file cannot be opened." << endl;
        return 1;
    }

    if (!inf.is_open())
    {
        cout << "File "<< array[2] <<" can't be created\n";
        return 1;
    }

    if (!outf.is_open())
    {
        cout << "Your file can't open" << endl;
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


