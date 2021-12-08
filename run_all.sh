#!/usr/bin/env bash
# This script copies all the inputs to one directory
# and then appends all the solutions into a single
# ruby script called "all.rb".
# Then it runs and times this script.

# Creating one compilation of solutions is better
# than running the solutions individually because 
# it minimizes the amount of time ruby spends starting up.
# (I think)

# I guess I could also structure my project so that I 
# have a uniform structure for each solution that can be
# called by an external runner script, but I like the simplicity
# of having each solution be a bare bones script.

script_location=$(cd -P -- "$(dirname -- "$0")" && pwd -P)
tmpdir="tmp"

cd "$script_location"

mkdir -p $tmpdir
rm $tmpdir/* -f
cp solutions/*/*.txt $tmpdir
cat solutions/*/*.rb >> $tmpdir/all.rb

# avoid the issue of redeclaring a constant:
sed -i 's/INPUT/$inputs/g' $tmpdir/all.rb 

cd $tmpdir

time ruby all.rb # this isn't very precise

cd ..
rm -rf $tmpdir

