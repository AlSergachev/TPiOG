@echo off

SET MyProgram="%~1"

::Test 1 - �������� ������ ��� ���������� ����������
%MyProgram% && goto err
echo "Test 1 Passed"

::Test 2 - �������� �������� �� ��������� �����
%MyProgram% 5 && goto err
echo "Test 2 Passed"

::Test 3 - �������� �������� ������
%MyProgram% "text" && goto err
echo "Test 3 Passed"

::Test 4 - �������� ������������ �������� ���������
%MyProgram% 1 || goto err
echo "Test 4 Passed"

::Test 5 - �������� �������������� �������� ���������
%MyProgram% -10 && goto err
echo "Test 5 Passed"

::Test 6 - �������� ���������������� �������� ���������
%MyProgram% 101100100110110010011011001001 || goto err
echo "Test 6 Passed"

::Test 7 - �������� ������ ��� ������� ���������� ����������
%MyProgram% 101 1011 && goto err
echo "Test 7 Passed"

::Test 8 - �������� ������������ �������� �1
%MyProgram% 101110101101 || goto err
fc result.txt 101110101101.txt || goto err
echo "Test 8 Passed"

::Test 9 - �������� ������������ �������� �2
%MyProgram% 111010001101 || goto err
fc result.txt 111010001101.txt || goto err
echo "Test 9 Passed"

echo "All tests passed successfully"
exit /B 0

:err
echo "Tests failed"
exit /B 1