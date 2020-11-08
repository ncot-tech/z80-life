#!/usr/bin/python3
from os import system
import time
import random

width = 10
height = 10
wxh = width*height
wtwo = width*2

# constants
a = 0
b = width-1
c = width*(height-1)
d = wxh-1

grid1 = [0,0,0,0,0,0,0,0,0,0,
         0,0,0,0,0,0,0,0,0,0,
         0,0,0,0,0,0,0,0,0,0,
         0,0,0,0,0,0,0,0,0,0,
         0,0,0,0,1,0,0,0,0,0,
         0,0,0,0,0,1,0,0,0,0,
         0,0,0,1,1,1,0,0,0,0,
         0,0,0,0,0,0,0,0,0,0,
         0,0,0,0,0,0,0,0,0,0,
         0,0,0,0,0,0,0,0,0,0,
]

#grid1 = [0] * wxh
grid2 = [1] * wxh
currentGrid = 0
otherGrid = 1
grids = [grid1,grid2]

def swapGrid():
    global currentGrid
    global otherGrid
    otherGrid = currentGrid
    if currentGrid == 0: currentGrid = 1
    elif currentGrid == 1: currentGrid = 0

def printGrid():
    system("clear")
    for x in range(len(grids[currentGrid])):
        if (x > 0 and x % width == 0): print ("")
        if (grids[currentGrid][x] == 0): print (" ", end="")
        else: print ("#",end="")
    print("")

def calcA():
    #
    return grids[currentGrid][d] + grids[currentGrid][c] + grids[currentGrid][c+1] +\
            grids[currentGrid][b] + grids[currentGrid][a+1] +\
            grids[currentGrid][b+width] + grids[currentGrid][b+1] + grids[currentGrid][b+2]

def calcB():
    return grids[currentGrid][d-1] + grids[currentGrid][d] + grids[currentGrid][c] +\
            grids[currentGrid][b-1] + grids[currentGrid][a] +\
            grids[currentGrid][b+width-1] + grids[currentGrid][b+width] + grids[currentGrid][b+1]

def calcC():
    return grids[currentGrid][d-width] + grids[currentGrid][c-width] + grids[currentGrid][c-width-1] +\
            grids[currentGrid][d] + grids[currentGrid][c+1] +\
            grids[currentGrid][b] + grids[currentGrid][a] + grids[currentGrid][a+1]

def calcD():
    return grids[currentGrid][c-2] + grids[currentGrid][c-1] + grids[currentGrid][c-width] +\
            grids[currentGrid][d-1] + grids[currentGrid][c] +\
            grids[currentGrid][b-1] + grids[currentGrid][b] + grids[currentGrid][a]

def calcTopRowCell(x):
    return grids[currentGrid][(c+x)-1] + grids[currentGrid][c+x] + grids[currentGrid][c+x+1] +\
            grids[currentGrid][x-1] + grids[currentGrid][x+1] +\
            grids[currentGrid][x+width-1] + grids[currentGrid][x+width] + grids[currentGrid][x+width+1]

def calcMiddleCell(x):
    return grids[currentGrid][x-width-1] + grids[currentGrid][x-width] + grids[currentGrid][x-width+1] +\
            grids[currentGrid][x-1] + grids[currentGrid][x+1] +\
            grids[currentGrid][x+width-1] + grids[currentGrid][x+width] + grids[currentGrid][x+width+1]

def calcBottomRowCell(x):
    topOff = x - (wxh-width)
    return grids[currentGrid][x-width-1] + grids[currentGrid][x-width] + grids[currentGrid][x-width+1] +\
            grids[currentGrid][x-1] + grids[currentGrid][x+1] +\
            grids[currentGrid][topOff-1] + grids[currentGrid][topOff] + grids[currentGrid][topOff+1]

def calcLCell(x):
    return grids[currentGrid][x-1] + grids[currentGrid][x-width] + grids[currentGrid][x-width+1] +\
            grids[currentGrid][x+width-1] + grids[currentGrid][x+1] +\
            grids[currentGrid][x+(width*2)-1] + grids[currentGrid][x+width] + grids[currentGrid][x+width+1]

def calcRCell(x):
    return grids[currentGrid][x-width-1] + grids[currentGrid][x-width] + grids[currentGrid][x-width-width+1] +\
            grids[currentGrid][x-1] + grids[currentGrid][(x-width)+1] +\
            grids[currentGrid][x+width-1] + grids[currentGrid][x+width] + grids[currentGrid][x+1]

def setNewCell(x, ntot):
    global grids
    if (grids[currentGrid][x] == 1):
        if (ntot == 2 or ntot == 3):
            grids[otherGrid][x] = 1
        else:
            grids[otherGrid][x] = 0
    elif (grids[currentGrid][x] == 0):
        if (ntot == 3):
            grids[otherGrid][x] = 1
        else:
            grids[otherGrid][x] = 0

def calcCells():
    # A
    pos = 0
    setNewCell(pos, calcA())
    pos = pos+1
    # Top row
    while (pos < width-1):
        setNewCell(pos, calcTopRowCell(pos))
        pos = pos+1
#    print ("Next is B at ", pos)
    # B
    setNewCell(pos, calcB())
    pos = pos+1
#    print ("Top row done ", pos)
    # Middle cells
    while(pos < width * (height-1)-1):
        end = pos + width - 1
        setNewCell(pos,calcLCell(pos))
        pos = pos + 1
        while (pos < end):#-1
            setNewCell(pos,calcMiddleCell(pos))
            pos = pos + 1
        setNewCell(pos,calcRCell(pos))
        pos = pos + 1
#        print ("X ", pos)
    # C
#    print ("Now do C at ", pos)
    setNewCell(pos, calcC())
    pos = pos + 1
    # Bottom row
    end = pos + width-2
#    print ("Bottom row starts at ", pos)
#    print ("Bottom row ends at ", end)
    while (pos < end):
        setNewCell(pos, calcBottomRowCell(pos))
        pos = pos + 1
    # D
#    print ("Do D at ", pos)
    setNewCell(pos, calcD())

def simulate():
    printGrid()
    time.sleep(1)
    while True:
        calcCells()
        swapGrid()
        printGrid()
        time.sleep(0.2)

simulate()
