# Crear usuarios para presentación de app
User.create(id: 2000, email: 'seed2@gmail.com', password: '12345678',name: "seed2", last_name: 'familia_seed', drivers_name: 'seed2')
User.create(id: 3000, email: 'seed3@gmail.com', password: '12345678',name: "seed3", last_name: 'familia_seed', drivers_name: 'seed3')
User.create(id: 4000, email: 'seed4@gmail.com', password: '12345678',name: "seed4", last_name: 'familia_seed', drivers_name: 'seed4')
User.create(id: 5000, email: 'seed5@gmail.com', password: '12345678',name: "seed5", last_name: 'familia_seed', drivers_name: 'seed5')
User.create(id: 6000, email: 'seed6@gmail.com', password: '12345678',name: "seed6", last_name: 'familia_seed', drivers_name: 'seed6')
User.create(id: 7000, email: 'seed7@gmail.com', password: '12345678',name: "seed7", last_name: 'familia_seed', drivers_name: 'seed7')
User.create(id: 8000, email: 'seed8@gmail.com', password: '12345678',name: "seed8", last_name: 'familia_seed', drivers_name: 'seed8')

# Asignamos Roles normales a los usuarios creados
User.all.each do |user|
  user.roles << Role.last
end