#include <iostream>
#include <fstream>
#include <iomanip>

using namespace std;

int main(int count, char* array[])
{
    if (count != 3)
    {
        cout << "Count of arguments must be equal 2\n";
        return 1;
    }

    ifstream inf1(array[1]);
    if (!inf1.is_open())
    {
        cout << "File " << array[1] << " can't be created\n";
        return 1;
    }

    ifstream inf2(array[2]);
    if (!inf2.is_open())
    {
        cout << "File " << array[2] << " can't be created\n";
        return 1;
    }

    double matrix1[3][3];
    for (int i = 0; i < 3; i++)
    {
        for (int j = 0; j < 3; j++)
        {
            if (inf1.eof()) {
                cout << "Not enough numbers in the file!" << endl;
                return 1;
            }
            inf1 >> matrix1[i][j];
        }
    }

    double matrix2[3][3];
    for (int i = 0; i < 3; i++)
    {
        for (int j = 0; j < 3; j++)
        {
            if (inf2.eof()) {
                cout << "Not enough numbers in the file!" << endl;
                return 1;
            }
            inf2 >> matrix2[i][j];
        }
    }

    double matrix3[3][3];
    for (int i = 0; i < 3; i++)
    {
        for (int j = 0; j < 3; j++)
        {
            double s(0);
            for (int k = 0; k < 3; k++)
            {
                s += matrix1[i][k] * matrix2[k][j];
            }
            matrix3[i][j] = s;
        }
    }

    ofstream outf("result.txt");
    if (!outf.is_open())
    {
        cout << "File result.txt can't be created\n";
        return 1;
    }

    for (int i = 0; i < 3; i++)
    {
        for (int j = 0; j < 3; j++)
        {
            cout << setprecision(3) << fixed << matrix3[i][j] << "\t";
            outf << setprecision(3) << fixed << matrix3[i][j] << "\t";
        }
        cout << "\n";
        outf << "\n";
    }
    cout << "\n";

    inf1.close();
    inf2.close();

    return 0;
}


