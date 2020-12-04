@echo off

SET MyProgram="%~1"

::Test 1 - �������� ������ ��� ���������� ����������
%MyProgram% && goto err
echo "Test 1 Passed"

::Test 2 - �������� �������������� ���������� ����������, ������������ �� ���� ���������
%MyProgram% file1.txt && goto err
echo "Test 2 Passed"

::Test 3 - �������� �������������� ���������� ����������, ������������ �� ���� ���������
%MyProgram% file1.txt file2.txt && goto err
echo "Test 3 Passed"

::Test 4 - �������� �������������� ���������� ����������, ������������ �� ���� ���������
%MyProgram% file1.txt file2.txt "Winter, winter." && goto err
echo "Test 4 Passed"

::Test 5 - �������� ����������� ������ ���������
%MyProgram% file1.txt file2.txt "winter." "summer." || goto err
echo "Test 5 Passed"

::Test 6 - �������� ��� ����� ��������� � ������� ��������������� �����
%MyProgram% error.txt && goto err
echo "Test 6 Passed"

::Test 7 - �������� ������ ���������, ����� ����� ������� ������ ����� ����
%MyProgram% file1.txt file2.txt "" "Summer, summer." && goto err
echo "Test 7 Passed"

::Test 8 - �������� ������ ������ � �������������� �����
%MyProgram% error1.txt file2.txt "Winter, winter." "Summer, summer." && goto err
echo "Test 8 Passed"

::Test 9 - �������� ������ ����� � �������������� ����������
%MyProgram% file1.txt "M:\Users\sanya\source\repos\Project1\Project1\error2.txt" "Winter, winter." "Summer, summer." && goto err
echo "Test 9 Passed"

::Test 10 - �������� ������ �� ����������� ������ � �����
%MyProgram% file1.txt file2.txt "..." "Summer, summer."  && goto err
echo "Test 10 Passed"

echo "All tests passed successfully"
exit /B 0

:err
echo "Tests failed"
exit /B 1