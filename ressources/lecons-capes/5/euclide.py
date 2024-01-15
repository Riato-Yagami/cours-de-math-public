def euclide(a, b): #pgcd(a,b)
    while b:
        (a, b) = (b, a % b)
    return a