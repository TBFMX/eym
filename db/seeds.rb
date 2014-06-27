# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
if User.count > 0
    User.delete_all
end
if Rol.count > 0
    Rol.delete_all
end
#######################ROLES######################################
#Rol.create(rol_name: 'rol_admin', admin: true, module_1: true, module_2: true, module_3: true, module_4: true, module_5: true)
@rol1 = Rol.new(rol_name: 'rol_admin', admin: true, module_1: true, module_2: true, module_3: true, module_4: true, module_5: true)
@rol1.save
#Rol.create(rol_name: 'tecnico', admin: false, module_1: true, module_2: true, module_3: true, module_4: true, module_5: true)
@rol2 = Rol.new(rol_name: 'tecnico', admin: false, module_1: true, module_2: true, module_3: true, module_4: true, module_5: true)
@rol2.save
###################################################################

######################USUARIOS#####################################
#User.create(username: 'admin', password: 'k4st3lJY!', email: 'admin@admin.com', rol_id: 1)
@usuario1 = User.new(username: 'admin', name: 'Admin', lastname: 'EYM', password: 'k4st3lJY!', email: 'admin@admin.com', rol_id: @rol1.id)
@usuario1.save
#User.create(username: 'demo', password: 'demo' ,  email: 'sebastian@tbf.mx', rol_id: 2)
@usuario2 = User.new(username: 'demo', name: 'demo', lastname: 'demo', password: 'demo12' ,  email: 'sebastian@tbf.mx', rol_id: @rol2.id)
@usuario2.save
###################################################################
=begin
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
=end