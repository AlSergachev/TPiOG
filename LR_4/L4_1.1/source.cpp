#include <iostream>
#include <fstream>
#include <string>
#include <cstdlib> 

using namespace std;

int main(int count, char* array[])
{
    ifstream inf(array[1]);
    ofstream outf(array[2]);
    
    if (!inf)
    {
        cerr << "Error. The first file cannot be opened." << endl;
        exit(1);
    }
    
    if (!outf)
    {
        cerr << "Error. The second file cannot be opened." << endl;
        exit(1);
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


