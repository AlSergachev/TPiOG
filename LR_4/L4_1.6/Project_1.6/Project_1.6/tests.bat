@echo off

SET MyProgram="%~1"

::Test 1 - Проверка работы при отсутствии аргументов
%MyProgram% && goto err
echo "Test 1 Passed"

::Test 2 - Проверка недостаточного количества аргументов, предлогаемых на вход программе
%MyProgram% f1.txt && goto err
echo "Test 2 Passed"

::Test 3 - Проверка недостаточного количества аргументов, предлогаемых на вход программе
%MyProgram% f2.txt ready.txt && goto err
echo "Test 3 Passed"

::Test 4 - Проверка недостаточного количества аргументов, предлогаемых на вход программе
%MyProgram% bin_file_1.exe ready.txt 4 && goto err
echo "Test 4 Passed"

::Test 5 - Проверка корректоной работы программы с текстровыми файлами
%MyProgram% bin_file_1.exe ready.txt 4 20|| goto err
echo "Test 5 Passed"

::Test 6 - Проверка при первом аргументе с именнем несуществующего файла
%MyProgram% error.txt ready.txt 4 20 && goto err
echo "Test 6 Passed"

::Test 7 - Проверка записи файла в несуществующую директорию
%MyProgram% bin_file_1.exe "M:\Users\sanya\source\repos\Project1\Project1\error2.txt" 4 54 && goto err
echo "Test 7 Passed"

::Test 8 - Проверка является ли выходной файл пустым
%MyProgram% bin_file_1.exe ready.txt 4 20 || goto err
fc empty.txt ready.txt && goto err
echo "Test 8 Passed"

::Test 9 - Проверка при нецелочисленном значении стартовой позиции 
%MyProgram% bin_file_1.exe ready.txt 1.7 20 && goto err
echo "Test 9 Passed"

::Test 10 - Проверка при нецелочисленном значении размера фрагмента 
%MyProgram% bin_file_1.exe ready.txt 20 20.8 && goto err
echo "Test 10 Passed"

echo "All tests passed successfully"
exit /B 0

:err
echo "Tests failed"
exit /B 1