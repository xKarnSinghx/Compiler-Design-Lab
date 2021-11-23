# -*- coding: utf-8 -*-
"""
Created on Tue Nov 16 22:40:37 2021

Name:Karn Kumar Singh
Roll No:1906181
course code:CSL5404
"""
import numpy as np
import pandas as pd
from prettytable import PrettyTable
def Forloop(code):
    fc = []
    idx = None
    for i in range(len(code)):
        just = code[i]

        if 'while' in just:
            idx = i
            newid = just.index('(')
            end_idx = just.index(')')
            bool_condn = ''.join(just[newid:end_idx+1])
            fc.append('if !{} goto({})'.format(bool_condn,None))
            idx = i
        elif '}' in just:
            fc.append('goto({})'.format(idx+1))
            #
            fc[idx] = fc[idx].replace('None',str(i+2))
            idx = None
        else:
            fc.append(just)
    return fc

with open('For.txt') as f:
    code = f.readlines()

print('Given for-loop code is:')
print(''.join(code))

ans = []
for i in range(len(code)):
    if code[i] != '\n':
        if code[i][-1] == '\n':
            ans.append(code[i][:-1].strip())
        else:
            ans.append(code[i].strip())


midans = []
for i in range(len(ans)):
    just = ans[i]
    if 'for' in just:
        nextcon = just[4:-2].split(';')
        ini = nextcon[0].strip()
        break_condn = nextcon[1].strip()
        checks = nextcon[2].strip().split(',')
        midans.append(ini)
        midans.append('while(' + break_condn + '){')
    elif '}' in just:
        for check in checks:
            midans.append(check+';')
        midans.append('}')
    else:
        midans.append(just)


fans = Forloop(midans)
fans.append('END')

print('\nThree address code for given for-loop code is:')
show = PrettyTable()
show.field_names = ['Serial No','Three address code']
for i in range(len(fans)):
	show.add_row([i+1,fans[i]])

print(show)
