import matplotlib.pyplot as plt
from math import sqrt
from random import random

def aire_dique(rayon, nb_points):
    inside_x = []
    inside_y = []
    outside_x = []
    outside_y = []
    n = 0
    for i in range(nb_points):
        x = rayon * random()
        y = rayon * random()
        if sqrt(x**2 + y**2) < rayon:
            n += 1
            inside_x.append(x)
            inside_y.append(y)
        else:
            outside_x.append(x)
            outside_y.append(y)
    
    area_estimate = n / nb_points * rayon**2 * 4
    
    # Plotting
    fig, ax = plt.subplots()
    ax.scatter(inside_x, inside_y, color='green')
    ax.scatter(outside_x, outside_y, color='red')
    circle = plt.Circle((0, 0), rayon, color='blue', fill=False, linewidth=2)
    ax.add_artist(circle)
    plt.axis('equal')  # Ensure the x and y axes have the same scale for proper circle display
    ax.legend()
    plt.title(f"Aire estimé: {area_estimate:.2f}")
    plt.show()

    return area_estimate