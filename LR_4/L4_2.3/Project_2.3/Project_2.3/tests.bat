@echo off

SET MyProgram="%~1"

::Test 1 - Проверка работы при отсутствии аргументов
%MyProgram% && goto err
echo "Test 1 Passed"

::Test 2 - Проверка перевода не двоичного числа
%MyProgram% 5 && goto err
echo "Test 2 Passed"

::Test 3 - Проверка перевода строки
%MyProgram% "text" && goto err
echo "Test 3 Passed"

::Test 4 - Проверка однозначного двичного аргумента
%MyProgram% 1 || goto err
echo "Test 4 Passed"

::Test 5 - Проверка отрицательного двичного аргумента
%MyProgram% -10 && goto err
echo "Test 5 Passed"

::Test 6 - Проверка тридцатизначного двичного аргумента
%MyProgram% 101100100110110010011011001001 || goto err
echo "Test 6 Passed"

::Test 7 - Проверка работы при большом количестве аргументов
%MyProgram% 101 1011 && goto err
echo "Test 7 Passed"

::Test 8 - Проверка правильности перевода №1
%MyProgram% 101110101101 || goto err
fc result.txt 101110101101.txt || goto err
echo "Test 8 Passed"

::Test 9 - Проверка правильности перевода №2
%MyProgram% 111010001101 || goto err
fc result.txt 111010001101.txt || goto err
echo "Test 9 Passed"

echo "All tests passed successfully"
exit /B 0

:err
echo "Tests failed"
exit /B 1