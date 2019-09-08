class Mascotas
	attr_accessor :nombre, :edad, :color, :codigo
	def initialize(nombre, edad, color, codigo)
	  @nombre, @edad, @color, @codigo = nombre, edad, color, codigo
	end
end

class Personas
	attr_accessor :nombre, :apellido, :dni
	def initialize(nombre, apellido, dni)
	  @nombre, @apellido, @dni = nombre, apellido, dni
	end
end

class Concurso
	attr_accessor :tipoConcurso, :fechaConcurso, :ubicacion
	def initialize(tipoConcurso, fechaConcurso, ubicacion)
	  @tipoConcurso, @fechaConcurso, @ubicacion = tipoConcurso, fechaConcurso, ubicacion
	end

	
end

class Asociacion 
	attr_accessor 
	def initialize()
		@Personas = []
		@Mascotas = []
	end

	def registrarPersona(item)
  		items.push(item)
    end

    def registrarMascota(item)
  		items.push(item)
  	end

end