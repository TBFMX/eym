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

	@rol3 = Rol.new(rol_name: 'usuario', admin: false, module_1: true, module_2: true, module_3: true, module_4: true, module_5: true)
	@rol3.save
end
###################################################################

######################USUARIOS#####################################
unless User.count > 0
	#User.create(username: 'admin', password: 'k4st3lJY!', email: 'admin@admin.com', rol_id: 1)
	@usuario1 = User.new(username: 'admin@admin.com', name: 'Admin', lastname: 'EYM', password: 'k4st3lJY!', email: 'admin@admin.com', rol_id: @rol1.id)
	@usuario1.save
	#User.create(username: 'demo', password: 'demo' ,  email: 'sebastian@tbf.mx', rol_id: 2)
	@usuario2 = User.new(username: 'demo@demo.com', name: 'demo', lastname: 'demo', password: 'demo12' ,  email: 'sebastian@tbf.mx', rol_id: @rol2.id)
	@usuario2.save
end
###################################################################

######################Paquetes#####################################
unless Package.count > 0
	#@plan1 = Package.new(name:'Basico', price: '0.00', description: 'primeros 2 anuncios gratuitos')
	@plan2 = Package.new(name:'Basico', price: '500.00', description: 'hasta 20 anuncios simultaneos', botton_one: '<form action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post" target="_top"><input type="hidden"name="cmd" value="_s-xclick"><input type="hidden" name="hosted_button_id" value="ML5XDPX3H5WE6"><input type="image" src="https://www.sandbox.paypal.com/es_XC/MX/i/btn/btn_buynowCC_LG.gif" border="0" name="submit" alt="PayPal, la forma más segura y rápida de pagar en línea."><img alt="" border="0" src="https://www.sandbox.paypal.com/es_XC/i/scr/pixel.gif" width="1" height="1"></form>', botton_suscription: '<form action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post" target="_top"><input type="hidden"name="cmd" value="_s-xclick"><input type="hidden" name="hosted_button_id" value="HMNLZDMBLKQBY"><input type="image" src="https://www.sandbox.paypal.com/es_XC/MX/i/btn/btn_subscribeCC_LG.gif" border="0" name="submit" alt="PayPal, la forma más segura y rápida de pagar en línea."><img alt="" border="0" src="https://www.sandbox.paypal.com/es_XC/i/scr/pixel.gif" width="1" height="1"></form>' )
	@plan3 = Package.new(name:'Business', price: '700.00', description: 'hasta 200 anuncios simultaneos', botton_one: '<form action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post" target="_top"><input type="hidden" name="cmd" value="_s-xclick"><input type="hidden" name="hosted_button_id" value="7M8LJJ6NJ5BS8"><input type="image" src="https://www.sandbox.paypal.com/es_XC/MX/i/btn/btn_buynowCC_LG.gif" border="0" name="submit" alt="PayPal, la forma más segura y rápida de pagar en línea."><img alt="" border="0" src="https://www.sandbox.paypal.com/es_XC/i/scr/pixel.gif" width="1" height="1"></form>', botton_suscription: '<form action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post" target="_top"><input type="hidden" name="cmd" value="_s-xclick"><input type="hidden" name="hosted_button_id" value="SERWHP8SW3AQS"><input type="image" src="https://www.sandbox.paypal.com/es_XC/MX/i/btn/btn_subscribeCC_LG.gif" border="0" name="submit" alt="PayPal, la forma más segura y rápida de pagar en línea."><img alt="" border="0" src="https://www.sandbox.paypal.com/es_XC/i/scr/pixel.gif" width="1" height="1"></form>')
	@plan4 = Package.new(name:'Ilimitado', price: '900.00', description: 'anuncios ilimitados', botton_one: '<form action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post" target="_top"><input type="hidden" name="cmd" value="_s-xclick"><input type="hidden" name="hosted_button_id" value="QMY8KL37C9DBE"><input type="image" src="https://www.sandbox.paypal.com/es_XC/MX/i/btn/btn_buynowCC_LG.gif" border="0" name="submit" alt="PayPal, la forma más segura y rápida de pagar en línea."><img alt="" border="0" src="https://www.sandbox.paypal.com/es_XC/i/scr/pixel.gif" width="1" height="1"></form>', botton_suscription: '<form action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post" target="_top"><input type="hidden" name="cmd" value="_s-xclick"><input type="hidden" name="hosted_button_id" value="7Z75VDRKQMSUL"><input type="image" src="https://www.sandbox.paypal.com/es_XC/MX/i/btn/btn_subscribeCC_LG.gif" border="0" name="submit" alt="PayPal, la forma más segura y rápida de pagar en línea."><img alt="" border="0" src="https://www.sandbox.paypal.com/es_XC/i/scr/pixel.gif" width="1" height="1"></form>' )

	#@plan1.save
	@plan2.save
	@plan3.save
	@plan4.save
end	
##################################################################

########################Imagenes##################################
unless Image.count > 0
	Image.create(title: 'dummy', image_url: '/data/dummy.png')
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
########################Mexico####################################
	State.create(name: 'Aguascalientes', country_id: 1)
	State.create(name: 'Baja California', country_id: 1)
	State.create(name: 'Baja California Sur', country_id: 1)
	State.create(name: 'Campeche', country_id: 1)
	State.create(name: 'Chiapas', country_id: 1)
	State.create(name: 'Chihuahua', country_id: 1)
	State.create(name: 'Coahuila de Zaragoza', country_id: 1)
	State.create(name: 'Colima', country_id: 1)
	State.create(name: 'Durango', country_id: 1)
	State.create(name: 'Estado de Mexico', country_id: 1)
	State.create(name: 'Guanajuato', country_id: 1)
	State.create(name: 'Guerrero', country_id: 1)
	State.create(name: 'Hidalgo', country_id: 1)
	State.create(name: 'Jalisco', country_id: 1)
	State.create(name: 'Michoacan de Ocampo', country_id: 1)
	State.create(name: 'Morelos', country_id: 1)
	State.create(name: 'Nayarit', country_id: 1)
	State.create(name: 'Nuevo Leon', country_id: 1)
	State.create(name: 'Oaxaca', country_id: 1)
	State.create(name: 'Puebla', country_id: 1)
	State.create(name: 'Queretaro', country_id: 1)
	State.create(name: 'Quintana Roo', country_id: 1)
	State.create(name: 'San Luis Potosi', country_id: 1)
	State.create(name: 'Sinaloa', country_id: 1)
	State.create(name: 'Sonora', country_id: 1)
	State.create(name: 'Tabasco', country_id: 1)
	State.create(name: 'Tamaulipas', country_id: 1)
	State.create(name: 'Tlaxcala', country_id: 1)
	State.create(name: 'Veracruz', country_id: 1)
	State.create(name: 'Yucatan', country_id: 1)
	State.create(name: 'Zacatecas', country_id: 1)
######################Estados Unidos #########################
	State.create(name: 'Alabama', country_id: 2)
	State.create(name: 'Hawaii', country_id: 2)
	State.create(name: 'Massachusetts', country_id: 2)
	State.create(name: 'New Mexico', country_id: 2)
	State.create(name: 'South Dakota', country_id: 2)
	State.create(name: 'Alaska', country_id: 2)
	State.create(name: 'Idaho', country_id: 2)
	State.create(name: 'Michigan', country_id: 2)
	State.create(name: 'New York', country_id: 2)
	State.create(name: 'Tennessee', country_id: 2)
	State.create(name: 'Arizona', country_id: 2)
	State.create(name: 'Illinois', country_id: 2)
	State.create(name: 'Minnesota', country_id: 2)
	State.create(name: 'North Carolina', country_id: 2)
	State.create(name: 'Texas', country_id: 2)
	State.create(name: 'Arkansas', country_id: 2)
	State.create(name: 'Indiana', country_id: 2)
	State.create(name: 'Mississippi', country_id: 2)
	State.create(name: 'Dakota', country_id: 2)
	State.create(name: 'Utah', country_id: 2)
	State.create(name: 'California', country_id: 2)
	State.create(name: 'Iowa', country_id: 2)
	State.create(name: 'Missouri', country_id: 2)
	State.create(name: 'Ohio', country_id: 2)
	State.create(name: 'Vermont', country_id: 2)
	State.create(name: 'Colorado', country_id: 2)
	State.create(name: 'Kansas', country_id: 2)
	State.create(name: 'Montana', country_id: 2)
	State.create(name: 'Oklahoma', country_id: 2)
	State.create(name: 'Virginia', country_id: 2)
	State.create(name: 'Connecticut', country_id: 2)
	State.create(name: 'Kentucky', country_id: 2)
	State.create(name: 'Nebraska', country_id: 2)
	State.create(name: 'Oregon', country_id: 2)
	State.create(name: 'Washington', country_id: 2)
	State.create(name: 'Delaware', country_id: 2)
	State.create(name: 'Louisiana', country_id: 2)
	State.create(name: 'Nevada', country_id: 2)
	State.create(name: 'Pennsylvania', country_id: 2)
	State.create(name: 'West Virginia', country_id: 2)
	State.create(name: 'Florida', country_id: 2)
	State.create(name: 'Maine', country_id: 2)
	State.create(name: 'New Hampshire', country_id: 2)
	State.create(name: 'Rhode Island', country_id: 2)
	State.create(name: 'Wisconsin', country_id: 2)
	State.create(name: 'Georgia', country_id: 2)
	State.create(name: 'Maryland', country_id: 2)
	State.create(name: 'New Jersey', country_id: 2)
	State.create(name: 'South Carolina', country_id: 2)
	State.create(name: 'Wyoming', country_id: 2)
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

########################Marcas####################################
unless Category.count > 0
	@cat1 = Category.new(title: 'Camiones', father_id: '0')		
	@cat2 = Category.new(title: 'Contenedores', father_id: '0')		
	@cat3 = Category.new(title: 'Equipos de Energía', father_id: '0')	
	@cat4 = Category.new(title: 'Maquinaria para Construcción', father_id: '0')
	@cat5 = Category.new(title: 'Maquinaria Agrícola', father_id: '0')
	@cat6 = Category.new(title: 'Maquinaria Compacta', father_id: '0')
	@cat7 = Category.new(title: 'Maquinaria para Mineria', father_id: '0')
	@cat8 = Category.new(title: 'Maquinaria Ligera', father_id: '0')
	@cat9 = Category.new(title: 'Remolques', father_id: '0')		
	@cat10 = Category.new(title: 'Reciclaje', father_id: '0')	
	@cat11 = Category.new(title: 'Otros', father_id: '0')			
	@cat1.save	
	@cat2.save
	@cat3.save
	@cat4.save
	@cat5.save
	@cat6.save
	@cat7.save
	@cat8.save
	@cat9.save	
	@cat10.save	
	@cat11.save		

	Subcategory.create(title: 'Camion de volteo', category_id: @cat1.id)
	Subcategory.create(title: 'Gondolas', category_id: @cat1.id)
	Subcategory.create(title: 'Plataformas', category_id: @cat1.id)
	Subcategory.create(title: 'Camion de Basura', category_id: @cat1.id)
	Subcategory.create(title: 'Retroexcavadoras', category_id: @cat1.id)
	Subcategory.create(title: 'Compactadoras', category_id: @cat2.id)
	Subcategory.create(title: 'Vibradores', category_id: @cat2.id)
	Subcategory.create(title: 'Pavimentadoras', category_id: @cat2.id)
	Subcategory.create(title: 'Motoconformadoras', category_id: @cat2.id)
	Subcategory.create(title: 'Zanjadoras', category_id: @cat2.id)
	Subcategory.create(title: 'Demolición y derribo', category_id: @cat2.id)
	Subcategory.create(title: 'Grúas', category_id: @cat2.id)
	Subcategory.create(title: 'Grúas articuladas', category_id: @cat2.id)
	Subcategory.create(title: 'Grúas chatarreras', category_id: @cat2.id)
	Subcategory.create(title: 'Excavadoras', category_id: @cat2.id)
	Subcategory.create(title: 'Revolvedoras', category_id: @cat2.id)
	Subcategory.create(title: 'Maquinaria pesada', category_id: @cat2.id)
	Subcategory.create(title: 'Montacargas telescopico', category_id: @cat2.id)
	Subcategory.create(title: 'Minicargadores', category_id: @cat2.id)
	Subcategory.create(title: 'Cargadores frontales', category_id: @cat2.id)
	Subcategory.create(title: 'Perforación', category_id: @cat2.id)
	Subcategory.create(title: 'Cargadores sobre oruga', category_id: @cat2.id)
	Subcategory.create(title: 'Cargadores sobre ruedas', category_id: @cat2.id)
	Subcategory.create(title: 'Tractores', category_id: @cat3.id)
	Subcategory.create(title: 'Equipo para agricultura', category_id: @cat3.id)
	Subcategory.create(title: 'Bailarinas', category_id: @cat4.id)
	Subcategory.create(title: 'Minicargadores', category_id: @cat4.id)
	Subcategory.create(title: 'Dumpers', category_id: @cat5.id)
	Subcategory.create(title: 'Track drill', category_id: @cat5.id)
	Subcategory.create(title: 'Bulldozer', category_id: @cat5.id)
	Subcategory.create(title: 'Maquinaria pesada', category_id: @cat5.id)
	Subcategory.create(title: 'Cargadores frontales', category_id: @cat5.id)
	Subcategory.create(title: 'Perforación', category_id: @cat5.id)
	Subcategory.create(title: 'Cargadores sobre oruga', category_id: @cat5.id)
	Subcategory.create(title: 'Cargadores sobre ruedas', category_id: @cat5.id)
	Subcategory.create(title: 'Compresores', category_id: @cat6.id)
	Subcategory.create(title: 'Montacargas', category_id: @cat7.id)
	Subcategory.create(title: 'Brazo articulado', category_id: @cat7.id)
	Subcategory.create(title: 'Montacargas telescopico', category_id: @cat7.id)
	Subcategory.create(title: 'Minicargadores', category_id: @cat7.id)
	Subcategory.create(title: 'Cargadores frontales', category_id: @cat7.id)
	Subcategory.create(title: 'Recicladoras', category_id: @cat10.id)
	Subcategory.create(title: 'Manejo de chatarra', category_id: @cat10.id)
	Subcategory.create(title: 'Telescópicos', category_id: @cat11.id)
	Subcategory.create(title: 'Barredoras', category_id: @cat11.id)
	Subcategory.create(title: 'Equipo industrial', category_id: @cat11.id)
	Subcategory.create(title: 'Transporte de tierra', category_id: @cat11.id)
	Subcategory.create(title: 'Transporte de materiales', category_id: @cat11.id)
	Subcategory.create(title: 'Tratamiento de agua', category_id: @cat11.id)
	Subcategory.create(title: 'Trascabo', category_id: @cat11.id)
	Subcategory.create(title: 'Todo terreno', category_id: @cat11.id)
	Subcategory.create(title: 'Manejo de materiales', category_id: @cat11.id)
	Subcategory.create(title: 'Vehiculos pesados', category_id: @cat11.id)
	Subcategory.create(title: 'Manejo de materiales', category_id: @cat11.id)
	Subcategory.create(title: 'Máquinas para extender', category_id: @cat11.id)
	Subcategory.create(title: 'Maquinas para compactar', category_id: @cat11.id)
	Subcategory.create(title: 'Plumas', category_id: @cat11.id)
	Subcategory.create(title: 'Equipos de cargas', category_id: @cat11.id)
	Subcategory.create(title: 'Equipos de elevación', category_id: @cat11.id)
	Subcategory.create(title: 'Escrepas', category_id: @cat11.id)
	Subcategory.create(title: 'Trascabo', category_id: @cat11.id)
	Subcategory.create(title: 'Carretera', category_id: @cat11.id)		
end
##################################################################

########################INDUSTRIAS################################
unless Industry.count > 0
	Industry.create(title: 'Agricultura')
	Industry.create(title: 'Construcción compacta')
	Industry.create(title: 'Minería')
	Industry.create(title: 'Construcción Pesada')
	Industry.create(title: 'Energía')
	Industry.create(title: 'Camiones')
	Industry.create(title: 'Ligeros')
end
##################################################################

###########################Cpanel#################################
unless ControlPanel.count > 0
	ControlPanel.create(admin: 'admin@admin.com', system: 'EYM' , newadv: '20')	
end
##################################################################