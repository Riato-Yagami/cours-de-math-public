from math import sqrt
from random import random

def aire_dique(rayon,nb_points):
    n = 0
    for i in range(nb_points):
        x = rayon*random()
        y = rayon*random()
        if sqrt(x**2+y**2) < rayon :
            n += 1
    return n / nb_points * rayon**2 * 4