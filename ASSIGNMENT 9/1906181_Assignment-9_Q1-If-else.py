# -*- coding: utf-8 -*-
"""
Created on Tue Nov 16 22:55:55 2021

Name:Karn Kumar Singh
Roll No:1906181
course code:CSL5404
"""
import numpy as np
import pandas as pd
from prettytable import PrettyTable

ans = PrettyTable()
code = open('if-else.txt','r')

cleancode = code.read().splitlines()
print('Given if-else code is:')
for i in cleancode:
  print('\t',i)

midans = []

for entry in cleancode:
    x = []
    x = entry.split(" ")
    midans.append(x)

check,code1 = [],[]
for i in range(len(cleancode)):
	fans = []
	if 'if' in cleancode[i]:
		fans.append(cleancode[i])
		fans.append('goto()')
		code1.append(fans)
	elif 'return' in cleancode[i]:
		fans.append('t1')
		fans.append('=')
		fans.append(midans[i][-1][:len(midans[i][-1])-1])
		code1.append(fans)
		if('if' in cleancode[i-1]):
			code1.append(['goto()'])
		else:
			check.append(len(code1))
	elif 'else' not in cleancode[i]:
		fans.append(cleancode[i])
		code1.append(fans)

check.append(len(code1)+1)

for i in range(len(code1)):
	if 'if' in code1[i][0]:
		code1[i][0] = code1[i][0].replace('A<B','!A<B')

j=-1
for i in range(len(code1)):
	if 'goto()' in code1[i][0]:
		j+=1
		code1[i][0] = code1[i][0].replace('goto()','goto('+str(check[j])+')')
	elif 'goto()' in code1[i][-1]:
		j+=1
		code1[i][-1] = code1[i][-1].replace('goto()','goto('+str(check[j])+')')

ans.field_names = ['Serial No','Three address code']
for i in range(len(code1)):
	code2 = ""
	for j in code1[i]:
		code2 += j
	ans.add_row([i+1,code2])

ans.add_row([len(code1)+1,"END"])
print('\nThree address code for given if-else code is:')
print(ans)
