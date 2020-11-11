#!/bin/bash

echo Start of testing
./a.out 1.txt Copy.txt

err()
{
	echo RESULT: Tests Failed
	exit 1;
}

# Test 1
echo "Test 1 Checking the opening of the first file"
if (test -e "./1.txt");
then
	echo "  Test 1 Passed"
else
	echo "  Test 1 Failed"
	err;
fi

# Test 2
echo "Test 2 Checking the opening of the second file"
if (test -e "./Copy.txt");
then
	echo "  Test 2 Passed"
else
	echo "  Test 2 Failed"
	err;
fi

# Test 3
echo "Test 3 Checking files"
if (cmp -s Copy.txt 1.txt);
then
	echo "  Test 3 Failed"
	err;
else
	echo "  Test 3 Passed"
fi

echo " RESULT: Tests Passed"
