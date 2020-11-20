@echo off

SET MyProgram="%~1"

::Test 1 - �������� �������������� ���������� ����������, ������������ �� ���� ���������
%MyProgram% text.txt && goto err
echo "Test 1 Passed"

::Test 2 - �������� ������ ��� ���������� ����������
%MyProgram% && goto err
echo "Test 2 Passed"

::Test 3 - �������� ��� ����� ��������� � ������� ��������������� �����
%MyProgram% error.txt && goto err
echo "Test 3 Passed"

::Test 4 - �������� ������ ������ � �������������� �����
%MyProgram% error1.txt "Pain!" && goto err
echo "Test 4 Passed"

::Test 5 - �������� ������ ����������� ������ � �����
%MyProgram% text.txt "Pain!" || goto err
echo "Test 5 Passed"

::Test 6 - �������� ������ �� ����������� ������ � �����
%MyProgram% text.txt "..." && goto err
echo "Test 6 Passed"


echo "All tests passed successfully"
exit /B 0

:err
echo "Tests failed"
exit /B 1