@echo off

SET MyProgram="%~1"

::Test 1 - Проверка недостаточного количества аргументов, предлогаемых на вход программе
%MyProgram% text.txt && goto err
echo "Test 1 Passed"

::Test 2 - Проверка работы при отсутствии аргументов
%MyProgram% && goto err
echo "Test 2 Passed"

::Test 3 - Проверка при одном аргументе с именнем несуществующего файла
%MyProgram% error.txt && goto err
echo "Test 3 Passed"

::Test 4 - Проверка поиска строки в несуществующем файле
%MyProgram% error1.txt "Pain!" && goto err
echo "Test 4 Passed"

::Test 5 - Проверка поиска существущей строки в файле
%MyProgram% text.txt "Pain!" || goto err
echo "Test 5 Passed"

::Test 6 - Проверка поиска не существущей строки в файле
%MyProgram% text.txt "..." && goto err
echo "Test 6 Passed"


echo "All tests passed successfully"
exit /B 0

:err
echo "Tests failed"
exit /B 1