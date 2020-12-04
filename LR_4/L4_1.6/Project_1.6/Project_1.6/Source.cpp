#include <iostream>
#include <fstream>
#include <string>
//tests.bat "$(TargetPath)"
using namespace std;

int main(int count, char* array[])
{
    if (count != 5)
    {
        printf("Count of arguments must be equal 4\n");
        return 1;
    }

    ifstream inf(array[1], ios::binary);
    if (!inf.is_open())
    {
        cout << "File " << array[1] << " can't be created\n";
        return 1;
    }

    ofstream outf(array[2], ios::binary);
    if (!outf.is_open())
    {
        cout << "File " << array[2] << " can't be created\n";
        return 1;
    }

    if (!array[3])
    {
        cout << "Error. Enter your start position.\n";
        return 1;
    }

    if (!array[4])
    {
        cout << "Error. Enter the fragment size..\n";
        return 1;
    }


    double a = atof(array[3]);
    int start_position = a;

    if (a - start_position != 0)
    {
        cout << "Invalid input data.\n";
        return 1;
    }

    double b = atof(array[4]);
    int fragment_size = b;

    if (b - fragment_size != 0)
    {
        cout << "Invalid input data.\n";
        return 1;
    }

    int i(0);
    char ch(0);
    string str;

    while (inf.get(ch))
    {
        if (i >= start_position && i < start_position + fragment_size)
        {
            outf << ch;
        }
        i++;
    }
    inf.close();       
    outf.close();

    return 0;
}


