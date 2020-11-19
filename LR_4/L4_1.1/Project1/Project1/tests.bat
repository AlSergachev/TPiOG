@echo off

SET MyProgram="%~1"

::Test 1
%MyProgram% first.txt Copy.txt || goto err
fc first.txt Copy.txt
echo "Test 1 Passed"

::Test 2
%MyProgram% second.txt Copy.txt || goto err
fc second.txt Copy.txt
echo "Test 2 Passed"

::Test 3
%MyProgram% first.txt && goto err
echo "Test 3 Passed"

::Test 4
%MyProgram% && goto err
echo "Test 4 Passed"

::Test 5
%MyProgram% error.txt && goto err
echo "Test 5 Passed"

::Test 6
%MyProgram% error.txt Copy.txt && goto err
echo "Test 6 Passed"

::Test 7
%MyProgram% first.txt error.txt && goto err
echo "Test 7 Passed"


echo "All tests passed successfully"
exit /B 0

:err
echo "Tests failed"
exit /B 1