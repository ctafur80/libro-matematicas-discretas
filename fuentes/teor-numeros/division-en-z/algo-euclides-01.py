

# Da el máximo común divisor de dos números enteros a y b y un par de coeficientes de Bézout
# de una ecuación diofántica lineal.

a = 12384
b = 4720



# Hallar cuál es el mayor de a y b y asignarlo a dividendo; el menor, a divisor.

dividendo = a
divisor = b


coef_x = 0
coef_y = 0


resto = 0



def div_entera(dividendo, divisor):

    cociente = dividendo // divisor
    resto = dividendo % divisor
    print(f"{dividendo} = {divisor} x {cociente} + {resto}")

    if resto == 0:
        # print(f"{divisor=}")
        return divisor

    mcd = div_entera(divisor, resto)

    return mcd



mcd = div_entera(dividendo, divisor)




print()
print(f"mcd({a}, {b}) = {mcd}")


