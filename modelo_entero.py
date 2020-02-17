from docplex.mp.model import Model

vino=[(i,j) for i in range(3) for j in range(3)]

modelo=Model(name='Programacion_Entera')

x=modelo.integer_var_dict(vino)

for i in range(3):
    modelo.add_constraint(modelo.sum(x[j,i] for j in range(3))== 7)

for i in range(3):
    modelo.add_constraint(modelo.sum(x[i,j] for j in range(3) )== 7)

for j in range(3):
    modelo.add_constraint(modelo.sum((x[i,j]/(i+1)) for i in range(2) )==3.5)

modelo.maximize(1)
resultado=modelo.solve()
resultado.display()

modelo.print_information()
