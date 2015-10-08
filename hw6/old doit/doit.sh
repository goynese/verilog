#!/bin/bash

# do place and route
cd pnr
./dopnr.sh
cd ..

# fix place and route sdf file
sed '/(WIDTH (negedge RSTB)/d' < sdfout/final.sdf  > sdfout/$$tempfile
sed '/(WIDTH (posedge CLK)/d' < sdfout/$$tempfile > sdfout/$$tempfile2
sed '/(WIDTH (negedge CLK)/d' < sdfout/$$tempfile2 > sdfout/final.sdf

