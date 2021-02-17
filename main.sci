clc
clear
n_crit = input("Numero de criterios: ")
nombres_criterios = list(n_crit)
matriz_de_criterios = eye(n_crit,n_crit)
for i=1:n_crit
    nombres_criterios(i) = input("Nombre de criterio " + string(i) + ": ")
end
disp(matriz_de_criterios)
