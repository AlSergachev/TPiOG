#include <iostream>
#include <fstream>
#include <string>

using namespace std;

int main(int count, char* array[])
{
    if (count < 4)
    {
        printf("Count of arguments must be equal 3\n");
        return 1;
    }

    ofstream outf(array[count - 1], ios::binary);
    if (!outf.is_open())
    {
        cout << "File " << array[count - 1] << " can't be created\n";
        return 1;
    }

    for (int i = 1; i < count-1; i++)
    {
        ifstream inf(array[i], ios::binary);

        if (!inf.is_open())
        {
            cout << "File " << array[i] << " can't be created\n";
            return 1;
        }

        char ch(0);
        while (inf.get(ch))
        {
            outf << ch;
        }
        
        inf.close();       
    }

    outf.close();

    return 0;
}


