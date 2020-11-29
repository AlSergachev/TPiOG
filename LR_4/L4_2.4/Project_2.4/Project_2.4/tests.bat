@echo off

SET MyProgram="%~1"

::Test 1 - �������� ������ ��� ���������� ����������
%MyProgram% && goto err
echo "Test 1 Passed"

::Test 2 - �������� �������� ������
%MyProgram% "text" && goto err
echo "Test 2 Passed"

::Test 3 - �������� ������������ ���������
%MyProgram% 5 || goto err
echo "Test 3 Passed"

::Test 4 - �������� ������������� ����������� ���������
%MyProgram% 2147483646 || goto err
echo "Test 4 Passed"

::Test 5 - �������� ������ ��� ������� ���������� ����������
%MyProgram% 5 45 && goto err
echo "Test 5 Passed"

::Test 6 - �������� ������������ �������� �1
%MyProgram% 214748364 || goto err
fc result.txt 214748364.txt || goto err
echo "Test 6 Passed"

::Test 7 - �������� ������������ �������� �2
%MyProgram% 214748 || goto err
fc result.txt 214748.txt || goto err
echo "Test 7 Passed"

::Test 8 - �������� ����������� ��������� ������������ ���������� ��������
%MyProgram% 2147483649 && goto err
echo "Test 8 Passed"

echo "All tests passed successfully"
exit /B 0

:err
echo "Tests failed"
exit /B 1