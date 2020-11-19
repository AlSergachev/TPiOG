@echo off

SET MyProgram="%~1"

::Test 1
% MyProgram % first.txt Copy.txt || goto err
fc first.txt Copy.txt
echo "Test 1 Passed"

::Test 2
% MyProgram % second.txt Copy.txt || goto err
fc second.txt Copy.txt
echo "Test 2 Passed"

::Test 3
% MyProgram % first.txt && goto err
echo "Test 3 Passed"

echo "All tests passed successfully"
exit /B 0

:err
echo "Tests failed"
exit /B 1