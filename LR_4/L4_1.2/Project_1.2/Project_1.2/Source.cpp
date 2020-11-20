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

    int j = 0;
    while (inf1)
    {
        j++;
        string str1, str2;
        getline(inf1, str1);
        getline(inf2, str2);
        if (str1 != str2)
        {
            cout << "Files are defferent. Line number is " << j << "\n";
            return 1;
        }
    }

    //cout << "Count line " << j << "\n";

    inf1.close();
    inf2.close();

    cout << "Files are equal\n";

    return 0;
}

//::Test 2 - Проверка копирования файла с данными
//% MyProgram % first.txt Copy.txt || goto err
//fc first.txt Copy.txt
//echo "Test 2 Passed"
//
//::Test 3 - Проверка недостаточного количества аргументов, предлогаемых на вход программе
//% MyProgram% first.txt&& goto err
//echo "Test 3 Passed"
//
//::Test 4 - Проверка работы при отсутствии аргуентов
//% MyProgram % &&goto err
//echo "Test 4 Passed"
//
//::Test 5 - Проверка при одном вргументе с именнем несуществующего файла
//% MyProgram % error.txt && goto err
//echo "Test 5 Passed"
//
//::Test 6 - Проверка копирования несуществующего файла
//% MyProgram % error1.txt Copy.txt && goto err
//echo "Test 6 Passed"
//
//::Test 7 - Проверка записи файла в несуществующую директорию
//% MyProgram % first.txt "M:\Users\sanya\source\repos\Project1\Project1\error2.txt" && goto err
//echo "Test 7 Passed"