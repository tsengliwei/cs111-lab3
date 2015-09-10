#!/bin/sh

./crash_setter 5

cd test

echo "touch 1.txt"
touch 1.txt

echo "echo 1 > 1.txt"
echo 1 > 1.txt

echo "touch 2.txt"
touch 2.txt

echo "ln 1.txt 1_copy.txt"
ln 1.txt 1_copy.txt

echo "ln -s 1.txt 1_copy2"
ln -s 1.txt 1_copy2

#should stop working from here

echo "echo 2 >> 1.txt"
echo 2 >> 1.txt

echo "rm 2.txt"
rm 2.txt

echo "ln 1.txt 1_copy3.txt"
ln 1.txt 1_copy3.txt

echo "ln -s 1.txt 1_copy4"
ln -s 1.txt 1_copy4

#set back to normal

cd ..
./crash_setter -1
cd test

echo "cat 1.txt"
cat 1.txt

#Go wrong (should have been removed, but still exists)
echo "cat 2.txt"
cat 2.txt

echo "cat 1_copy.txt"
cat 1_copy.txt

echo "cat 1_copy2"
cat 1_copy2

#Fail
echo "ln 1_copy3.txt copy5"
ln 1_copy3.txt copy5

#Fail
echo "cat 1_copy4"
cat 1_copy4