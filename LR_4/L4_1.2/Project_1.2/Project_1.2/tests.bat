@echo off

SET MyProgram="%~1"

::Test 1 - Проверка недостаточного количества аргументов, предлогаемых на вход программе
%MyProgram% file1.txt && goto err
echo "Test 1 Passed"

::Test 2 - Проверка работы при отсутствии аргуентов
%MyProgram% && goto err
echo "Test 2 Passed"

::Test 3 - Проверка при одном вргументе с именнем несуществующего файла
%MyProgram% error.txt && goto err
echo "Test 3 Passed"

::Test 4 - Проверка стравнения несуществующего файла
%MyProgram% error1.txt file2.txt && goto err
echo "Test 4 Passed"

::Test 5 - Проверка стравнения файла с несуществующим файлом
%MyProgram% file1.txt "M:\Users\sanya\source\repos\Project1\Project1\error2.txt" && goto err
echo "Test 5 Passed"

::Test 6 - Проверка сравнения файлов с одинаковыми данными
%MyProgram% file1.txt file1_copy.txt || goto err
fc file1.txt file1_copy.txt || goto err
echo "Test 6 Passed"

::Test 7 - Проверка сравнения файлов с разными данными
%MyProgram% file1.txt file2.txt && goto err
fc file1.txt file2.txt && goto err
echo "Test 7 Passed"

echo "All tests passed successfully"
exit /B 0

:err
echo "Tests failed"
exit /B 1