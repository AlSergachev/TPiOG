@echo off

SET MyProgram="%~1"

::Test 1 - �������� ������ ��� ���������� ����������
%MyProgram% && goto err
echo "Test 1 Passed"

::Test 2 -�������� �������������� ���������� ����������, ������������ �� ���� ��������� 
%MyProgram% matrix1.txt && goto err
echo "Test 2 Passed"

::Test 3 - �������� ��� ����� a�������� � ������� ��������������� �����
%MyProgram% error.txt matrix1.txt  && goto err
echo "Test 3 Passed"

::Test 4 - �������� ��� ����� a�������� � ������� ��������������� �����
%MyProgram% matrix1.txt error.txt && goto err
echo "Test 4 Passed"

::Test 5 - �������� ������ ��� ������� ���������� ����������
%MyProgram% matrix1.txt matrix2.txt error.txt && goto err
echo "Test 5 Passed"

::Test 6 - �������� ������������ ����������
%MyProgram% matrix1.txt matrix2.txt || goto err
fc result.txt reference_matrix.txt || goto err
echo "Test 6 Passed"

::Test 7 - �������� ������ ��� ������ ������� �����
%MyProgram% matrix3.txt matrix2.txt && goto err
echo "Test 7 Passed"

echo "All tests passed successfully"
exit /B 0

:err
echo "Tests failed"
exit /B 1