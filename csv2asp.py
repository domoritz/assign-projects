#!/usr/bin/python

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
