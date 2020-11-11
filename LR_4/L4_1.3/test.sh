#!/bin/bash

echo Start of testing
./a.out text.txt "Я свободен словно птица в небесах"

err()
{
        echo RESULT: Tests Failed
        exit 1;                                                        }

# Test 1
echo "Test 1 Checking the opening of the first file"
if (test -e "./text.txt");
then
        echo "  Test 1 Passed"
else
        echo "  Test 1 Failed"
        err;
fi


echo " RESULT: Tests Passed"
