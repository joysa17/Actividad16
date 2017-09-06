=begin
Opción 1: Debe generar un archivo con el nombre de cada alumno y el
promedio de sus notas.
Se puede leer el archivo completo o ir leyendo y procesando
por línea, ambas opciones son válidas.
Opción 2: Debe contar la cantidad de inasistencias totales y mostrarlas en
pantalla.
Opción 3: Debe mostrar los nombres de los alumnos aprobados. Para eso
se debe crear un método que reciba -como argumento- la nota necesaria para
aprobar, por defecto esa nota debe ser 5.
Opción 4: Debe terminar el programa.	
=end

#promedio
def promedio
file = File.open('alumnos.csv','r')
data = file.readlines
notas = []
data.each {|line| notas.push(line.split(', ').map(&:chomp))}
notas.each do |student_info| 
	#queremos obtener el nombre del alumno en una variable
	#en otra variable quiero el promedio y al finalizar generar el archivo con el nombre
	#del alumno y el promedio
	name = student_info.shift
	puts name
	prom = get_promedio(student_info)
	puts "Promedio de notas del alumno: #{name} es #{prom}"
	File.open('promedio.txt','w+')
end 
end 

def get_promedio(promedio)
	sum = 0
	promedio.each do |ele|
    unless ele =="A"
      sum += ele.to_i 
       end 
    end
    return sum / promedio.length	
end



#notas = data.delete_if {|score| score == "A" } 
#suma = notas.inject(0) { |acc, notas| acc + notas.split(', ')[1].to_i}
#print notas 
#puts suma / data.length

#File.open('alumnos.txt','a+')


 

opcion = 0

while opcion 
  puts 'Ingresa 1 para crear un archivo con los alumnos y sus promedios.'
  puts 'Ingresa 2 para mostrar las inasistencias totales.'
  puts 'Ingresa 3 para mostrar los alumnos aprobados.'
  puts 'Ingresa 4 para salir.'

  opcion = gets.chomp.to_i

   case opcion
       when 1
           promedio
         
       when 2
       	 puts "Inasistencia de los alumnos #{name}"
         inasistencia()
         
       when 3
         puts
         
       when 4
         puts '¡Adios!'
         exit
       else
         puts 'La opción no es válida. Vuelve a ingresar una opción.'
       end
end