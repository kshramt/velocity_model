#!/usr/bin/python

import sys
import math

import kshramt


def main(fp):
    fp.readline()
    n_depths = int(fp.readline().split()[0])
    for _ in range(math.ceil(n_depths/10)):
        fp.readline()
    n_distances = int(fp.readline().split()[0])
    buf = ''
    for _ in range(math.ceil(n_distances/10)):
        buf += fp.readline()
    distances = map(float, buf.split())
    table = kshramt.list_2d(n_distances, n_depths)
    for i_depth in range(n_depths):
        fp.readline()
        for i_distance in range(n_distances):
            table[i_distance][i_depth] = float(fp.readline().split()[0])
    for d, ts in zip(distances, table):
        print('{} {}'.format(d, ' '.join(map(format_time, ts))))


def format_time(t):
    if t < 0:
        return '{} NaN'.format(-(2**31))
    else:
        return '{} {}'.format(math.floor(t/60), t%60)


main(sys.stdin)
