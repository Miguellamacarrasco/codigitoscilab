clc
clear
n_crit = input("Numero de criterios: ")
nombres_criterios = list(n_crit)
matriz_de_criterios = eye(n_crit,n_crit)
for i=1:n_crit
    nombres_criterios(i) = input("Nombre de criterio " + string(i) + ": ")
end


for i=1:n_crit
    for l=1+i:n_crit
        matriz_de_criterios(i,l)=input("Que tan mas importante es " + nombres_criterios(i) + " que " + nombres_criterios(l) + " en escala de (1/10-10): ")
        matriz_de_criterios(l,i)=1/matriz_de_criterios(i,l)
    end
end

disp(matriz_de_criterios)

matriz_ajustada = zeros(n_crit,n_crit)

vector_de_sumatoria = zeros(n_crit)


for l=1:n_crit
    suma_de_columna = sum(matriz_de_criterios(:,l))
    vector_de_sumatoria(l) = sum(matriz_de_criterios(:,l))
    for i=1:n_crit
        matriz_ajustada(i,l)=matriz_de_criterios(i,l)/suma_de_columna
    end
end

disp(matriz_ajustada)

pesos = list(n_crit)

for i=1:n_crit
    pesos(i) = sum(matriz_ajustada(i,:))/n_crit
end

disp(pesos)

n_opciones = input("Cuantas opciones hay a elegir: ")
nombres_opciones = list(n_opciones)
for i=1:n_opciones
    nombres_opciones(i) = input("Nombre de opcion " + string(i) + ": ")
end

opciones = zeros(n_opciones,n_crit)
peso_opciones = zeros(n_opciones)
for i=1:n_opciones
    for l=1:n_crit
        opciones(i,l) = input("Que tanto cumple " + nombres_opciones(i) + " en " +  nombres_criterios(l) + " (1-10): ")
        opciones(i,l) = opciones(i,l)*pesos(l)
    end
    peso_opciones(i) = sum(opciones(i,:))
end

disp(opciones)

disp(peso_opciones)




