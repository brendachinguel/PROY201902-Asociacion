
class Dueno 
  attr_accessor :nombreD, :apellido, :dni
  def initialize(nombreD, apellido, dni)
    @nombreD, @apellido, @dni = nombreD, apellido, dni
  end
end
class Mascota 
  attr_accessor :nombre, :edad, :color, :puntaje_postura, :dueno
  def initialize( nombre, edad, color, puntaje_postura, dueno)   
    @nombre, @edad, @color, @puntaje_postura, @dueno = 
      nombre, edad, color, puntaje_postura, dueno
  end
  def calcular_bono
  end
  def calcular_prom_evaluacion
  end
  def tipo_mascota
  end
  def mostrar_dni
    dueno.dni
  end
end
class Comun < Mascota
  attr_accessor :raza, :habilidad
  def initialize(nombre, edad, color, puntaje_postura, dueno, raza, habilidad)
    super(nombre, edad, color, puntaje_postura, dueno)
    @raza, @habilidad = raza, habilidad
  end

  def calcular_bono
    prom = (raza + habilidad)/ 2
    if prom > 7
      return 2
    else
      return 0
    end
  end
  def calcular_prom_evaluacion
    pro = calcular_bono
    return ((raza + habilidad)/ 2) + pro
  end

  def tipo_mascota
    "Comun"
  end

  def mostrar_dni
    super
  end

end

class Guardian < Mascota
  attr_accessor :razaa, :pelaje
  def initialize(nombre, edad, color, puntaje_postura, dueno, razaa,pelaje)
    super(nombre, edad, color, puntaje_postura, dueno)
    @razaa, @pelaje = razaa,pelaje
  end

 def calcular_bono
    prom = (razaa + pelaje)/ 2

    if prom > 7
      return 2
    else
      return 0
    end
  end

  def calcular_prom_evaluacion
    pro = calcular_bono

    return ((razaa + pelaje)/ 2) + pro
  end
  def tipo_mascota
    "Guardian"
  end

  def mostrar_dni
    super
  end

end

class Compania < Mascota
  attr_accessor :aceptacion, :disciplina
  def initialize(nombre, edad, color, puntaje_postura, dueno, aceptacion, disciplina)
    super(nombre, edad, color, puntaje_postura, dueno)          
    @aceptacion, @disciplina = aceptacion, disciplina
  end

  def calcular_bono
    prom = (aceptacion + disciplina)/ 2

    if prom > 7
      return 2
    else
      return 0
    end
  end

  def calcular_prom_evaluacion
    pro = calcular_bono

    return ((aceptacion + disciplina)/ 2) + pro
  end

  def tipo_mascota
    "Compania"
  end
end

def mostrar_dni
  super
end

class Asociacion
  attr_accessor :arreglo_mascota, :arreglo_dueno
  def initialize
    @arreglo_mascota = []
    @arreglo_dueno = []
  end
 
  def registrarMascota(mascota)
    if verificar_existencia(mascota.dueno)
        if verificar_existenciaDNI(mascota.mostrar_dni)
          return "Error - DNI ya existe"
        end
        arreglo_mascota.push(mascota)
        arreglo_dueno.push(mascota.dueno)
      return "registrado ok"
    else
        return "Error - Dueño ya registro una mascota"
    end       
  end

  def obtener_listado_mascota
    arreglo_mascota
  end

  def buscar_mascota(dni)
    obj=nil
    for p in arreglo_mascota
      if p.mostrar_dni==dni
      obj=p
      end
    end
    return obj
  end

  def verificar_existencia(duenoo)
    for p in arreglo_mascota
      if p.dueno == duenoo
      return false
      end
    end
    return true
  end

  def verificar_existenciaDNI(dni)
    for p in arreglo_mascota
      if p.mostrar_dni == dni
      return true
      end
    end
    return false
  end


  def obtener_ganador_general
      max = 0
      obj = nil
      for p in arreglo_mascota
        if p.calcular_prom_evaluacion>max 
          max = p.calcular_prom_evaluacion
          obj = p
        end
      end
    return obj
  end

  def obtener_ganadorCategoria(categoria)
     max = 0
     obj = nil
      
      for p in arreglo_mascota
        if p.tipo_mascota == categoria
          if p.calcular_prom_evaluacion>max 
            max = p.calcular_prom_evaluacion
            obj = p
          end
        end
      end
    return obj
  end


  def obtener_listadoxCategoria(categoria)
      obj = []
      for p in arreglo_mascota
        if p.tipo_mascota.upcase == categoria.upcase
            obj.push(p)
        end
      end
    return obj
  end

  def obtener_cantidad_macota_x_categoria(categoria)
    cont = 0      
      for p in arreglo_mascota
        if p.tipo_mascota.upcase == categoria.upcase
          cont = cont + 1
        end
      end
    return cont 
  end

end

class Factoria
  def self.obtener_instancia(tipo, *arg)
    case tipo.upcase
      when "COMUN"
         Comun.new(arg[0], arg[1], arg[2], arg[3], arg[4], arg[5], arg[6])
      when "GUARDIAN"
         Guardian.new(arg[0], arg[1], arg[2], arg[3], arg[4], arg[5], arg[6])  
      when "COMPANIA"
         Compania.new(arg[0], arg[1], arg[2], arg[3], arg[4], arg[5], arg[6])       
    end
  end
end

class Vista
  def mostrar_mensaje(m)
    puts(m)
  end

  def mostrar_listado_mascota(arreglo)
    puts
    puts "**************MASCOTAS INSCRITAS**********"
    for p in arreglo
      puts "Tipo de mascota: #{p.tipo_mascota}  Nombre: #{p.nombre}  Edad: #{p.edad}  Color: #{p.color}  Puntaje postura: #{p.puntaje_postura}  Promedio Evaluacion: #{p.calcular_prom_evaluacion.round(2)}"
       puts " - - - - - - - - - - - - - - - - - - "     
    end
    puts
  end

  def mostrar_ganadorCategoria(ganador)
    puts "***********MASCOTA GANADORA EN SU CATEGORIA (#{ganador.tipo_mascota})************"
    puts "La mascota ganadora de la categoria #{ganador.tipo_mascota} es: #{ganador.nombre}, su edad es #{ganador.edad} años, su color es #{ganador.color}.   puntaje de postura: #{ganador.puntaje_postura}  puntaje final: #{ganador.calcular_prom_evaluacion.round(2)}"
    puts
  end

  def mostrar_listadoxCategoria(categoria, ganador)
    puts 
    puts "*************** LISTA DE MASCOTA POR CATEGORIA (#{categoria})**************"
    puts
    for p in ganador
      puts "Nombre: #{p.nombre}  Edad: #{p.edad}  Color: #{p.color}  Puntaje postura: #{p.puntaje_postura}  puntaje final: #{p.calcular_prom_evaluacion.round(2)}"
      puts " - - - - - - - - - - - - - - - - - - "     
    end
    puts
  end

  def mostrar_ganadorGeneral(ganador)
    puts "**************MASCOTA GANADORA DE LA COMPETENCIA**********"
    puts "El ganador de la competencia es #{ganador.nombre} con un puntaje de: #{ganador.calcular_prom_evaluacion} "
    puts"------------------"
    puts
    
  end

  def mostrar_cantidad_mascotas(categoria,cantidad)
    puts "************CANTIDAD DE MASCOTAS POR CATEGORIA*************"
    puts "En la categoria #{categoria} participan #{cantidad} mascotas"
    puts "*********************************************************"
    puts
  end

  def mostrar_buscar_mascota(dni,mascota)
    puts "**************MASCOTA ENCONTRADA CON DNI***************"
    puts "Nombre: #{mascota.nombre}   categoria: #{mascota.tipo_mascota}   puntaje: #{mascota.calcular_prom_evaluacion}"
  end
end

class Controlador
  attr_accessor :modelo, :vista
  def initialize(modelo, vista)
    @modelo=modelo
    @vista=vista
  end
  def registrarMascota(tipo,*arg )
      part = Factoria.obtener_instancia(tipo, *arg)
      mensaje = modelo.registrarMascota(part)
      vista.mostrar_mensaje(mensaje)
  end

  def mostrar_listado_mascota
    arreglo = modelo.obtener_listado_mascota
    vista.mostrar_listado_mascota(arreglo)
  end

  def mostrar_ganadorCategoria(categoria)
    ganador = modelo.obtener_ganadorCategoria(categoria)
    vista.mostrar_ganadorCategoria(ganador)
  end

  def mostrar_listadoxCategoria(categoria)
    ganador = modelo.obtener_listadoxCategoria(categoria)
    vista.mostrar_listadoxCategoria(categoria, ganador)
  end

  def mostrar_ganadorGeneral
     ganador = modelo.obtener_ganador_general
     vista.mostrar_ganadorGeneral(ganador)
  end

  def mostrar_cantidad_mascotas(categoria)
    cantidad = modelo.obtener_cantidad_macota_x_categoria(categoria)
    vista.mostrar_cantidad_mascotas(categoria,cantidad)
  end

  def mostrar_buscar_mascota(dni)
    mascota=modelo.buscar_mascota(dni)
    vista.mostrar_buscar_mascota(dni,mascota)
  end
  
end


class TestMascotas < Test::Unit::TestCase

def test_pruebas
  
  adm = Asociacion.new
  vista = Vista.new
  controlador = Controlador.new(adm, vista)

  dueno1=Dueno.new("Javier","Alvarez", 74632167)
  controlador.registrarMascota("CoMuN","Drako",3,"rojo",5,dueno1,6,3)

  dueno2=Dueno.new("Jorge","Mendoza",98636167)
  controlador.registrarMascota("CoMuN","Pepe",5,"marron",6,dueno2,7 ,4)

  controlador.registrarMascota("Guardian","Chato",4,"negro",6,dueno2,3,4)

  dueno4=Dueno.new("Manuel","Retamozo",84637965)
  controlador.registrarMascota("Compania","Lobo",5,"blanco",7,dueno4,4,8)

  dueno5=Dueno.new("Julio","Maldonado",94632167)
  controlador.registrarMascota("Compania","Firulais",6,"marron",5,dueno5,8,7)

  dueno6=Dueno.new("Jose","Quispe",47524754)
  controlador.registrarMascota("Guardian","Dago",7,"marron",8,dueno6,9,8)

  dueno7=Dueno.new("Jhon","Rojas",58640765)
  controlador.registrarMascota("Compania","Rita",4,"blanco",6,dueno7,5,6)

  dueno8=Dueno.new("Ivan","Maldonado",98636167)
  controlador.registrarMascota("Guardian","Brandom",5,"marron",6,dueno8,5,4)

  dueno9=Dueno.new("Alex","Rodriguez",67345234)
  controlador.registrarMascota("Guardian","Layka",5,"marron",6,dueno9,6,7)
  arreglo=adm.arreglo_mascota
  assert_equal(7, arreglo.size)

  controlador.mostrar_listado_mascota
  listado=adm.obtener_listado_mascota
  assert_equal(7, listado.size)

  controlador.mostrar_listadoxCategoria("Comun")
  listado_cat=adm.obtener_listadoxCategoria("Comun")
  assert_equal(2,listado_cat.size)

  controlador.mostrar_ganadorGeneral
  gan_gen=adm.obtener_ganador_general
  assert_not_nil(gan_gen)

  controlador.mostrar_cantidad_mascotas("Comun")
  controlador.mostrar_cantidad_mascotas("Compania")
  controlador.mostrar_cantidad_mascotas("Guardian")
  cant_masc=adm.obtener_cantidad_macota_x_categoria("Guardian")

  controlador.mostrar_ganadorCategoria("Comun")     #agregado
  gan_cat=adm.obtener_listadoxCategoria("Comun")      
  assert_not_nil(gan_cat)

  controlador.mostrar_buscar_mascota(98636167)      #agregado
  busq_masc=adm.buscar_mascota(98636167)
  assert_not_nil(busq_masc)
  end

end
