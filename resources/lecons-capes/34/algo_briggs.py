from math import sqrt

def Briggs(a,n): #Return ln(a) with approximation 10^(-n)
    i=0
    while abs(a-1)>=10**(-n):
        i+=1
        a=sqrt(a)
    return 2**i*(a-1)