#!/bin/bash
#
mkdir temp
cd temp
rm *
f77split ../barycentric_interp_1d.f
#
for FILE in `ls -1 *.f`;
do
  gfortran -c -g $FILE >& compiler.txt
  if [ $? -ne 0 ]; then
    echo "Errors compiling " $FILE
    exit
  fi
  rm compiler.txt
done
rm *.f
#
ar qc libbarycentric_interp_1d.a *.o
rm *.o
#
mv libbarycentric_interp_1d.a ~/libf77/$ARCH
cd ..
rmdir temp
#
echo "Library installed as ~/libf77/$ARCH/libbarycentric_interp_1d.a"
