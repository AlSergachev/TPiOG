#include <iostream>
#include <fstream>
#include <string>
#include <cstdlib> 

using namespace std;


int main(int count, char* array[])
{
    if (count != 3)
    {
        cout << "Count of arguments must be equal 2\n" << endl;
        return 1;
    }

    ifstream inf(array[1]);
    ofstream outf(array[2]);


    

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

    /*

        

        ::Test 3
% MyProgram % first.txt && goto err
echo "Test 3 Passed"

        ::Test 4
        % MyProgram % &&goto err
        echo "Test 4 Passed"

        ::Test 5
        % MyProgram % error.txt && goto err
        echo "Test 5 Passed"

        ::Test 6
        % MyProgram % error.txt Copy.txt && goto err
        echo "Test 6 Passed"

        ::Test 7
        % MyProgram % first.txt error.txt && goto err
        echo "Test 7 Passed"*/

    return 0;
}


