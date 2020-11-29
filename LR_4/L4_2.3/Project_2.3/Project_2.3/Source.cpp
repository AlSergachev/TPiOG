#include <iostream>
#include <fstream>

using namespace std;

int main(int count, char* array[])
{
    if (count != 2)
    {
        cout << "Count of arguments must be equal 1\n";
        return 1;
    }

    string two = array[1];
    int size = two.size();
    int ten = 0;

    for (int i = 1, j = 0; i <= size; i++, j++)
    {
        int a = two[size - i];
        int b = 7;

        if (a == 49){b = 1;}
        else if(a == 48){b = 0;}
        else
        {
            cout << "Invalid binary number.\n";
            return 1;
        }

        ten += b * pow(2, j);
    }

    cout << ten << "\n";

    ofstream outf("result.txt");
    if (!outf.is_open())
    {
        cout << "File result.txt can't be created\n";
        return 1;
    }
    outf << ten;
    outf.close();

    return 0;
}

