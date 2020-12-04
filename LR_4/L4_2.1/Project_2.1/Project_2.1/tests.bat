@echo off

SET MyProgram="%~1"

::Test 1 - Проверка однозначного аргумента
%MyProgram% 5 || goto err
echo "Test 1 Passed"

::Test 2 - Проверка двухзначного аргумента
%MyProgram% 50 || goto err
echo "Test 2 Passed"

::Test 3 - Проверка работы при отсутствии аргументов
%MyProgram% && goto err
echo "Test 3 Passed"

::Test 4 - Проверка работы при большом количестве аргументов
%MyProgram% 5 50 && goto err
echo "Test 4 Passed"

::Test 5 - Проверка при некорректном аргументе
%MyProgram% error.txt && goto err
echo "Test 5 Passed"

::Test 6 - Проверка правильности вычисления №1
%MyProgram% 15 || goto err
fc result.txt 15.txt || goto err
echo "Test 6 Passed"

::Test 7 - Проверка правильности вычисления №2
%MyProgram% 164 || goto err
fc result.txt 164.txt || goto err
echo "Test 7 Passed"

::Test 8 - Проверка при нецелочисленном аргументе
%MyProgram% 1.7 && goto err
echo "Test 8 Passed"

echo "All tests passed successfully"
exit /B 0

:err
echo "Tests failed"
exit /B 1