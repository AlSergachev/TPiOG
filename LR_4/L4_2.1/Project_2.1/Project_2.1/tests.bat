@echo off

SET MyProgram="%~1"

::Test 1 - �������� ������������ ���������
%MyProgram% 5 || goto err
echo "Test 1 Passed"

::Test 2 - �������� ������������ ���������
%MyProgram% 50 || goto err
echo "Test 2 Passed"

::Test 3 - �������� ������ ��� ���������� ����������
%MyProgram% && goto err
echo "Test 3 Passed"

::Test 4 - �������� ������ ��� ������� ���������� ����������
%MyProgram% 5 50 && goto err
echo "Test 4 Passed"

::Test 5 - �������� ��� ������������ ���������
%MyProgram% error.txt && goto err
echo "Test 5 Passed"

::Test 6 - �������� ������������ ���������� �1
%MyProgram% 15 || goto err
fc result.txt 15.txt || goto err
echo "Test 6 Passed"

::Test 7 - �������� ������������ ���������� �2
%MyProgram% 164 || goto err
fc result.txt 164.txt || goto err
echo "Test 7 Passed"

::Test 8 - �������� ��� ��������������� ���������
%MyProgram% 1.7 && goto err
echo "Test 8 Passed"

echo "All tests passed successfully"
exit /B 0

:err
echo "Tests failed"
exit /B 1