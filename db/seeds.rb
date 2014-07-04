#!/bin/env ruby
# encoding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#if User.count > 0
#    User.delete_all
#end

#######################ROLES######################################
unless Rol.count > 0
	#Rol.create(rol_name: 'rol_admin', admin: true, module_1: true, module_2: true, module_3: true, module_4: true, module_5: true)
	@rol1 = Rol.new(rol_name: 'rol_admin', admin: true, module_1: true, module_2: true, module_3: true, module_4: true, module_5: true)
	@rol1.save
	#Rol.create(rol_name: 'tecnico', admin: false, module_1: true, module_2: true, module_3: true, module_4: true, module_5: true)
	@rol2 = Rol.new(rol_name: 'tecnico', admin: false, module_1: true, module_2: true, module_3: true, module_4: true, module_5: true)
	@rol2.save
end
###################################################################

######################USUARIOS#####################################
unless User.count > 0
	#User.create(username: 'admin', password: 'k4st3lJY!', email: 'admin@admin.com', rol_id: 1)
	@usuario1 = User.new(username: 'admin', name: 'Admin', lastname: 'EYM', password: 'k4st3lJY!', email: 'admin@admin.com', rol_id: @rol1.id)
	@usuario1.save
	#User.create(username: 'demo', password: 'demo' ,  email: 'sebastian@tbf.mx', rol_id: 2)
	@usuario2 = User.new(username: 'demo', name: 'demo', lastname: 'demo', password: 'demo12' ,  email: 'sebastian@tbf.mx', rol_id: @rol2.id)
	@usuario2.save
end
###################################################################

######################Paquetes#####################################
@plan1 = Package.new(name:'platino', price: '250.00', description: 'servicio mas cañon')
@plan2 = Package.new(name:'oro', price: '150.00', description: 'servicio mas semi-cañon' )
@plan3 = Package.new(name:'plata', price: '100.00', description: 'servicio algo cañon' )
@plan4 = Package.new(name:'bronce', price: '50.00', description: 'servicio casi nada cañon' )
@plan5 = Package.new(name:'blanco', price: '0.00', description: 'servicio normal' )

@plan1.save
@plan2.save
@plan3.save
@plan4.save
@plan5.save
###################################################################

unless Country.count > 0
	Image.create(title: 'dommy', image_url: '/data/dommy.jpg')
end

########################Paises####################################
unless Country.count > 0
	Country.create(name: 'Mexico')
	Country.create(name: 'Estados Unidos')
end
##################################################################

########################Moneda####################################
unless Currency.count > 0
    Currency.create(name: 'Pesos Mexicanos (MXN)')
	Currency.create(name: 'Dollares EstadoUnidences (USDll)')
end
##################################################################

########################Estados###################################
unless State.count > 0 
############################Mexico####################################
	State.create(name: 'Aguascalientes', country: 1)
	State.create(name: 'Baja California', country: 1)
	State.create(name: 'Baja California Sur', country: 1)
	State.create(name: 'Campeche', country: 1)
	State.create(name: 'Chiapas', country: 1)
	State.create(name: 'Chihuahua', country: 1)
	State.create(name: 'Coahuila de Zaragoza', country: 1)
	State.create(name: 'Colima', country: 1)
	State.create(name: 'Durango', country: 1)
	State.create(name: 'Estado de Mexico', country: 1)
	State.create(name: 'Guanajuato', country: 1)
	State.create(name: 'Guerrero', country: 1)
	State.create(name: 'Hidalgo', country: 1)
	State.create(name: 'Jalisco', country: 1)
	State.create(name: 'Michoacan de Ocampo', country: 1)
	State.create(name: 'Morelos', country: 1)
	State.create(name: 'Nayarit', country: 1)
	State.create(name: 'Nuevo Leon', country: 1)
	State.create(name: 'Oaxaca', country: 1)
	State.create(name: 'Puebla', country: 1)
	State.create(name: 'Queretaro', country: 1)
	State.create(name: 'Quintana Roo', country: 1)
	State.create(name: 'San Luis Potosi', country: 1)
	State.create(name: 'Sinaloa', country: 1)
	State.create(name: 'Sonora', country: 1)
	State.create(name: 'Tabasco', country: 1)
	State.create(name: 'Tamaulipas', country: 1)
	State.create(name: 'Tlaxcala', country: 1)
	State.create(name: 'Veracruz', country: 1)
	State.create(name: 'Yucatan', country: 1)
	State.create(name: 'Zacatecas', country: 1)
########estados unidos #########################
	State.create(name: 'Alabama', country: 2)
	State.create(name: 'Hawaii', country: 2)
	State.create(name: 'Massachusetts', country: 2)
	State.create(name: 'New Mexico', country: 2)
	State.create(name: 'South Dakota', country: 2)
	State.create(name: 'Alaska', country: 2)
	State.create(name: 'Idaho', country: 2)
	State.create(name: 'Michigan', country: 2)
	State.create(name: 'New York', country: 2)
	State.create(name: 'Tennessee', country: 2)
	State.create(name: 'Arizona', country: 2)
	State.create(name: 'Illinois', country: 2)
	State.create(name: 'Minnesota', country: 2)
	State.create(name: 'North Carolina', country: 2)
	State.create(name: 'Texas', country: 2)
	State.create(name: 'Arkansas', country: 2)
	State.create(name: 'Indiana', country: 2)
	State.create(name: 'Mississippi', country: 2)
	State.create(name: 'Dakota', country: 2)
	State.create(name: 'Utah', country: 2)
	State.create(name: 'California', country: 2)
	State.create(name: 'Iowa', country: 2)
	State.create(name: 'Missouri', country: 2)
	State.create(name: 'Ohio', country: 2)
	State.create(name: 'Vermont', country: 2)
	State.create(name: 'Colorado', country: 2)
	State.create(name: 'Kansas', country: 2)
	State.create(name: 'Montana', country: 2)
	State.create(name: 'Oklahoma', country: 2)
	State.create(name: 'Virginia', country: 2)
	State.create(name: 'Connecticut', country: 2)
	State.create(name: 'Kentucky', country: 2)
	State.create(name: 'Nebraska', country: 2)
	State.create(name: 'Oregon', country: 2)
	State.create(name: 'Washington', country: 2)
	State.create(name: 'Delaware', country: 2)
	State.create(name: 'Louisiana', country: 2)
	State.create(name: 'Nevada', country: 2)
	State.create(name: 'Pennsylvania', country: 2)
	State.create(name: 'West Virginia', country: 2)
	State.create(name: 'Florida', country: 2)
	State.create(name: 'Maine', country: 2)
	State.create(name: 'New Hampshire', country: 2)
	State.create(name: 'Rhode Island', country: 2)
	State.create(name: 'Wisconsin', country: 2)
	State.create(name: 'Georgia', country: 2)
	State.create(name: 'Maryland', country: 2)
	State.create(name: 'New Jersey', country: 2)
	State.create(name: 'South Carolina', country: 2)
	State.create(name: 'Wyoming', country: 2)
end
##################################################################

########################Marcas####################################
unless Brand.count > 0
	Brand.create(name: 'Bobcat')
	Brand.create(name: 'Case')
	Brand.create(name: 'Caterpillar')
	Brand.create(name: 'Chevrolet')
	Brand.create(name: 'Dorsey')
	Brand.create(name: 'Ford')
	Brand.create(name: 'Freightliner')
	Brand.create(name: 'Fruehauf')
	Brand.create(name: 'GMC')
	Brand.create(name: 'Grove')
	Brand.create(name: 'International')
	Brand.create(name: 'JLG')
	Brand.create(name: 'John Deere')
	Brand.create(name: 'Johnston')
	Brand.create(name: 'Kenworth')
	Brand.create(name: 'Komatsu')
	Brand.create(name: 'Massey Ferguson')
	Brand.create(name: 'New Holland')
	Brand.create(name: 'Peterblit')
	Brand.create(name: 'Terex')
	Brand.create(name: 'Trackmobile')
	Brand.create(name: 'Trail King')
	Brand.create(name: 'Trailmobile')
	Brand.create(name: 'Transcraft')
	Brand.create(name: 'Utility')
	Brand.create(name: 'Volvo')
	Brand.create(name: 'Wacker Neuson')
end
##################################################################