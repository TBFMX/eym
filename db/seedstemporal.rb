#!/bin/env ruby
# ruby encoding: utf-8

# ############### PARAMETROS ###############
# name
# etiquetas
# description
# category_id
# subcategory_id
# brand_id
# modelo
# year
# color
# country_id
# state_id
# ciudad
# publication_type
# precio
# currency_id
# package_id
# user_id
# status
# ##############################

# ############## NECESITAN BUSQUEDAS #################
# category_id
# subcategory_id
# brand_id
# country_id
# state_id
# currency_id
# package_id
# user_id
# ################################


################ BUSQUEDAS ###############
@cat1 = Category.find_by(title: 'Camiones')
@cat7 = Category.find_by(title: 'Maquinaria para Mineria')

@subcat37 = Subcategory.find_by(title: 'Montacargas')
@subcat3 = Subcategory.find_by(title: 'Plataformas')
@subcat63 = Subcategory.find_by(title: 'Pipa de Agua')

@brand28 = Brand.find_by(name: 'Hyster')
@brand12 = Brand.find_by(name: 'JLG')
@brand29 = Brand.find_by(name: 'Sterling')

@country = Country.find_by(name: 'Mexico')

@state = State.find_by(name: 'Tamaulipas')

@currency = Currency.find_by(name: 'M.N.')

@package = Package.find_by(name: 'Basico')

@user = User.find_by(username: 'admin@admin.com')
################################


###############################
@equip1 = Equipment.new(name:'MONTACARGAS HYSTER H80XL CAP. 8000LBS', etiquetas:'montacargas, montacargas gas', description:'
MONTACARGAS  TIPO GAS
MARCA: HYSTER
MODELO: H80XL
CAPACIDAD 8000 LBS
AÑO: 1998
SERIE: G005D11714V
ELEVACION DE CUCHILLAS 190"
TIPO DE LLANTAS NEUNMATICAS(AIRE)
MEDIDA DE LLANTAS DELANTERAS : 29X8-15"
MEDIDA DE LLANTAS TRASERAS: 7.00-12-12"
TAMAÑO DE CUCHILLAS
20" ALTURA
44" LONGITUD',
category_id: @cat1.id, subcategory_id: @subcat37.id, brand_id: @brand28.id, modelo: 'H80XL', year: '1998', color: 'amarillo', country_id: @country.id, state_id: @state.id, ciudad: 'Reynosa', publication_type: '1', precio: '1', currency_id: @currency.id, package_id: @package.id, user_id: @user.id, status: '2')

@equip1.save

@galeria1 = Gallery.new(title: 'principal', equipment_id: @equip1.id)
@galeria1.save

@equip2 = Equipment.create(name:'BOOM LIFT E300AJP', description:'
Alcance Altura de la plataforma 9.14m
Alcance horizontal 6.10m
Altura global 3.99m
Rotación 360º Non-Continuous
Capacidad de la plataforma 230kg
Giro de plataforma 180º
Hydraulic Brazo 1.24m
Mayor versatilidad con la posibilidad de elegir entre dos modelos con alturas de trabajo hasta los 11,00 m 
Aumento de la accesibilidad gracias al plumín JibPLUS opcional con movimiento de lado a lado y funcionamiento del plumín casi vertical
Control automático de la tracción de serie que ofrece un mejor rendimiento sobre el terreno y mayor capacidad de maniobra 
Tracción eléctrica directa sumamente eficiente con ciclos de trabajo más largos, que aumenta la productividad 
Emisión de gases cero, que hace que los equipos sean ecológicos',
category_id: @cat7.id, subcategory_id: @subcat3.id, brand_id: @brand12.id, modelo: 'E300AJP', year: '2001', color: 'naranja', country_id: @country.id, state_id: @state.id, ciudad: 'Reynosa', publication_type: '1', precio: '1', currency_id: @currency.id, package_id: @package.id, user_id: @user.id, status: '2')

@equip2.save

@galeria2 = Gallery.new(title: 'principal', equipment_id: @equip2.id)
@galeria2.save

@equip3 = Equipment.create(name:'PLATAFORMA JLG 3394RT', etiquetas:'plataformas, boom lift', description:
'33\' Max Lift Height
2,250 lb. MaxWeight Capacity
4x4
Platform Extension
Dual Fuel
Ford Engine
89" Wide x 153" Long Platform
Lectura métrica: 2,396 Horas',
category_id: @cat7.id, subcategory_id: @subcat3.id, brand_id: @brand12.id, modelo: '3394RT', color: 'naranja', country_id: @country.id, state_id: @state.id, ciudad: 'Reynosa', publication_type: '1', precio: '1', currency_id: @currency.id, package_id: @package.id, user_id: @user.id, status: '2')

@equip3.save

@galeria3 = Gallery.new(title: 'principal', equipment_id: @equip3.id)
@galeria3.save

@equip4 = Equipment.create(name:'Pipa de Agua para Riego 2013', etiquetas:'pipa de agua, pipa para riego, camion de riego', description:' Especificaciones:
Largo exterior 4 mts.
Ancho exterior:1.93 mts
Alto interior: 1.22 mts
Capacidad 2,500 Galones
Tractocamion Sterling 2007
 
Motobomba incluida
marca Champion semitrash
Potencia 5.5Conexiones de entrada 2"
Flujo 158 G.p.m
Conexión rápida de aluminio
manguera de succion de 12\'
manguera de descarga 20\'',
category_id: @cat1.id, subcategory_id: @subcat63.id, brand_id: @brand29.id, modelo: 'Sterling', year: '2013', color: 'blanco', country_id: @country.id, state_id: @state.id, ciudad: 'Reynosa', publication_type: '1', precio: '1', currency_id: @currency.id, package_id: @package.id, user_id: @user.id, status: '2')

@equip4.save

@galeria4 = Gallery.new(title: 'principal', equipment_id: @equip4.id)
@galeria4.save

################################