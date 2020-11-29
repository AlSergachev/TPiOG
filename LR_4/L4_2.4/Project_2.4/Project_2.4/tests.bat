@echo off

SET MyProgram="%~1"

::Test 1 - Проверка работы при отсутствии аргументов
%MyProgram% && goto err
echo "Test 1 Passed"

::Test 2 - Проверка перевода строки
%MyProgram% "text" && goto err
echo "Test 2 Passed"

::Test 3 - Проверка однозначного аргумента
%MyProgram% 5 || goto err
echo "Test 3 Passed"

::Test 4 - Проверка максимального десятичного аргумента
%MyProgram% 2147483646 || goto err
echo "Test 4 Passed"

::Test 5 - Проверка работы при большом количестве аргументов
%MyProgram% 5 45 && goto err
echo "Test 5 Passed"

::Test 6 - Проверка правильности перевода №1
%MyProgram% 214748364 || goto err
fc result.txt 214748364.txt || goto err
echo "Test 6 Passed"

::Test 7 - Проверка правильности перевода №2
%MyProgram% 214748 || goto err
fc result.txt 214748.txt || goto err
echo "Test 7 Passed"

::Test 8 - Проверка десятичного аргумента превышающего допустимое значение
%MyProgram% 2147483649 && goto err
echo "Test 8 Passed"

echo "All tests passed successfully"
exit /B 0

:err
echo "Tests failed"
exit /B 1