from threading import Thread
from random import randint


maxx = 3

def rand_matrix():
    m = [[0 for i in range(maxx)] for j in range(maxx)]
    for i in range(maxx):
        for j in range(maxx):
            m[i][j] = randint(1, 5)
    return m

mat1 = rand_matrix()
mat2 = rand_matrix()
mat3 = [[0 for i in range(maxx)] for j in range(maxx)]

step = 0

def multiply():
    global step
    i = step
    for j in range(maxx):
        for k in range(maxx):
            mat3[i][j] += mat1[i][k] * mat2[k][j]
    step += 1

threads = []

for i in range(maxx):
    t = Thread(target = multiply)
    threads.append(t)
    t.start()

for t in threads:
    t.join()

print("\nMATRIX 1")
print(mat1)
print("\nMATRIX 2")
print(mat2)
print("\nMATRIX 3")
print(mat3)