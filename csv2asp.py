#!/usr/bin/python
'''
This script can be used to generate the asp code for students.encoding.lp
from a CSV file. Excel sheets can be exported as CSV.
'''

import sys
import csv

with open(sys.argv[1], 'rU') as csvfile:
    data = csv.reader(csvfile)
    for S, line in enumerate(data):
        for P, N in enumerate(line):
            if not N:
                continue
            print 'select({},{},{}).'.format(S + 1, P + 1, N)
        print
