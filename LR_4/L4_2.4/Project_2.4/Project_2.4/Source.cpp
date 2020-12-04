#include <iostream>
#include <fstream>
#include <vector>

using namespace std;

int main(int count, char* array[])
{
    if (count != 2)
    {
        cout << "Count of arguments must be equal 1\n";
        return 1;
    }

    if (array[1] == "0")
    {cout << 0 << endl;return 0;}

    unsigned int ten = atoi(array[1]);
    if (ten == 0)
    {
        cout << "Invalid input data.\n";
        return 1;
    }
    
    if(ten >= 2147483647)
    {
        cout << "Input data is out of range.\n";
        return 1;
    }

    ofstream outf("result.txt");
    if (!outf.is_open())
    {
        cout << "File result.txt can't be created\n";
        return 1;
    }

    unsigned int i = ten;
    vector<int> two;

    while (i != 0)
    {        
        int r = i % 2;
        i /= 2;
        two.push_back(r);
        //cout << i << "     " << r << "\n";
    }
    
    for (int j = 1; j <= two.size(); j++)
    {
        cout << two.at(two.size() - j);
        outf << two.at(two.size() - j);
    }
    cout << endl;

    outf.close();
    
    return 0;
}

