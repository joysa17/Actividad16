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

#opción 1: promedio
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
	prom = get_promedio(student_info)
	
	puts "Promedio de notas del alumno: #{name} es #{prom}"
	
	file = File.open('promedio.txt','a')
	
	file.puts "Promedio de notas del alumno: #{name} es #{prom}"
	file.close	
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

#Opción 2: Inasistencias
def inasistencia
	file = File.open('alumnos.csv','r')
	data = file.readlines
#obtener las inasistencias y mostrarlas en pantalla
inas = []
data.each {|line|inas.push(line.split(', ').map(&:chomp))}
	
inas.each do |inasis|
	name = inasis.shift
	n_inasistencia = get_inasistencias(inasis)

	puts "Las inasistencias son del Alumno: #{name} son #{n_inasistencia}"
	
end
end

def get_inasistencias(asistencia)
	 
	asistencia.count('A')
	
end

#OPCIÓN 3: APROBADOS

def aprobados
	file = File.open('alumnos.csv','r')
	data = file.readlines
	#Debe mostrar los nombres de los alumnos aprobados. Para eso se debe crear 
	#un método que reciba -como argumento- la nota necesaria para aprobar, 
	#por defecto esa nota debe ser 5.
	aprob = []
    data.each {|line|aprob.push(line.split(', ').map(&:chomp))}
		
	aprob.each do |aprobados|
	name = aprobados.shift
	aprobado = get_promedio(aprobados)
	if aprobado > 5
	puts "El alumno #{name} fue aprobado con nota: #{aprobado}"
	else
		puts "El alumno #{name} fue reprobado con nota: #{aprobado}"
	end
end
	
end


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

		inasistencia

	when 3
		aprobados

	when 4
		puts '¡Adios!'
		exit
	else
		puts 'La opción no es válida. Vuelve a ingresar una opción.'
	end
end