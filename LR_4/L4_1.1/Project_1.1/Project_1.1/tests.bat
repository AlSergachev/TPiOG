@echo off

SET MyProgram="%~1"

::Test 1 - Проверка создания пустого файла из другого пустого файла
%MyProgram% second.txt Copy.txt || goto err
fc second.txt Copy.txt
echo "Test 1 Passed"

::Test 2 - Проверка копирования файла с данными
%MyProgram% first.txt Copy.txt || goto err
fc first.txt Copy.txt
echo "Test 2 Passed"

::Test 3 -Проверка недостаточного количества аргументов, предлогаемых на вход программе 
%MyProgram% first.txt && goto err
echo "Test 3 Passed"

::Test 4 - Проверка работы при отсутствии аргуентов
%MyProgram% &&goto err
echo "Test 4 Passed"

::Test 5 - Проверка при одном вргументе с именнем несуществующего файла
%MyProgram% error.txt && goto err
echo "Test 5 Passed"

::Test 6 - Проверка копирования несуществующего файла
%MyProgram% error1.txt Copy.txt && goto err
echo "Test 6 Passed"

::Test 7 - Проверка записи файла в несуществующую директорию
%MyProgram% first.txt "M:\Users\sanya\source\repos\Project1\Project1\error2.txt" && goto err
echo "Test 7 Passed"

echo "All tests passed successfully"
exit /B 0

:err
echo "Tests failed"
exit /B 1