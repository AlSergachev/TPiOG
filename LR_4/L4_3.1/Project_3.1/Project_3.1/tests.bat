@echo off

SET MyProgram="%~1"

::Test 1 - Проверка работы при отсутствии аргументов
%MyProgram% && goto err
echo "Test 1 Passed"

::Test 2 -Проверка недостаточного количества аргументов, предлогаемых на вход программе 
%MyProgram% matrix1.txt && goto err
echo "Test 2 Passed"

::Test 3 - Проверка при одном aргументе с именнем несуществующего файла
%MyProgram% error.txt matrix1.txt  && goto err
echo "Test 3 Passed"

::Test 4 - Проверка при одном aргументе с именнем несуществующего файла
%MyProgram% matrix1.txt error.txt && goto err
echo "Test 4 Passed"

::Test 5 - Проверка работы при большом количестве аргументов
%MyProgram% matrix1.txt matrix2.txt error.txt && goto err
echo "Test 5 Passed"

::Test 6 - Проверка правильности вычисления
%MyProgram% matrix1.txt matrix2.txt || goto err
fc result.txt reference_matrix.txt || goto err
echo "Test 6 Passed"

::Test 7 - Проверка работы при пустом входном файле
%MyProgram% matrix3.txt matrix2.txt && goto err
echo "Test 7 Passed"

echo "All tests passed successfully"
exit /B 0

:err
echo "Tests failed"
exit /B 1