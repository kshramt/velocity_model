#!/usr/bin/python

import sys
import json


def wrap(arr):
    ret = ''
    i = 1
    for el in arr:
        ret += ' {}'.format(el)
        if i >= 10:
            ret += '\n'
            i = 1
        else:
            i += 1
    return ret


params = json.load(sys.stdin)
depths = sorted(params['depths'])
distances = sorted(params['distances'])

print(
    """\
n # P travel-time tables for iasp91 structure. (From TauP_Table)
{n_depths} # number of depth samples
{depths}
{n_distances} # number of distances
{distances}""".format(n_depths=len(depths),
                      depths=wrap(depths),
                      n_distances=len(distances),
                      distances=wrap(distances))
)
