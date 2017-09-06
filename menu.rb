=begin
Opción 1: Debe generar un archivo con el nombre de cada alumno y el
promedio de sus notas.
Se puede leer el archivo completo o ir leyendo y procesando
por línea, ambas opciones son válidas.
Opción 2: Debe contar la cantidad de inasistencias totales y mostrarlas en
pantalla.
Opción 3: Debe mostrar los nombres de los alumnos aprobados. Para eso
se debe crear un método que reciba -como argumento- la nota necesaria pa
aprobar, por defecto esa nota debe ser 5.
Opción 4: Debe terminar el programa.	
=end

 


 #promedio
file = File.open('alumnos.csv','r')
data = file.readlines
file.close
notas = data.delete_if == 'A'
suma = notas.inject(0) { |acc, notas| acc + notas.split(', ')[1..5].to_i}
 
puts suma / data.length
