#include <iostream>
#include <fstream>
#include <cstdlib>

using namespace std;

int main(int count, char* array[])
{
    if (count != 2)
    {
        cout << "Count of arguments must be equal 1\n";
        return 1;
    }

    if (array[1] == "0")
    {
        cout << 0 << endl;
        return 0;
    }

    int b = atoi(array[1]);
    if (b == 0)
    {
        cout << "Invalid input data.\n";
        return 1;
    }

    int count_bit = 0;
    while (b != 0) {
        count_bit += 1; 
        b &= b - 1;
    }
    
    cout << count_bit << endl;

    ofstream outf("result.txt");
    if (!outf.is_open())
    {
        cout << "File result.txt can't be created\n";
        return 1;
    }
    outf << count_bit;
    outf.close();





    return 0;
}


