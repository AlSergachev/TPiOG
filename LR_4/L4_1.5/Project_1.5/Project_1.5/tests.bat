@echo off

SET MyProgram="%~1"

::Test 1 - �������� ������ ��� ���������� ����������
%MyProgram% && goto err
echo "Test 1 Passed"

::Test 2 - �������� �������������� ���������� ����������, ������������ �� ���� ���������
%MyProgram% f1.txt && goto err
echo "Test 2 Passed"

::Test 3 - �������� �������������� ���������� ����������, ������������ �� ���� ���������
%MyProgram% f2.txt ready.txt && goto err
echo "Test 3 Passed"

::Test 4 - �������� ����������� ������ ���������
%MyProgram% f1.txt f2.txt f3.txt ready.txt|| goto err
echo "Test 4 Passed"

::Test 5 - �������� ��� ������ ��������� � ������� ��������������� �����
%MyProgram% error.txt f1.txt f2.txt f3.txt ready.txt && goto err
echo "Test 5 Passed"

::Test 6 - �������� ��� ��������� ��������� � ������� ��������������� �����
%MyProgram% f1.txt f2.txt f3.txt error.txt ready.txt && goto err
echo "Test 6 Passed"

::Test 7 - �������� ������ ����� � �������������� ����������
%MyProgram% f1.txt f2.txt f3.txt "M:\Users\sanya\source\repos\Project1\Project1\error2.txt" && goto err
echo "Test 7 Passed"

::Test 8 - �������� �������� �� �������� ���� ������
%MyProgram% f1.txt f2.txt f3.txt ready.txt || goto err
fc empty.txt ready.txt && goto err
echo "Test 8 Passed"

echo "All tests passed successfully"
exit /B 0

:err
echo "Tests failed"
exit /B 1