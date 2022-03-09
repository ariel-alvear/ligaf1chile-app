# Roles

Role.find_or_create_by(id: 1, name: "superadmin")
Role.find_or_create_by(id: 2, name: "admin")
Role.find_or_create_by(id: 3, name: "participant_admin")
Role.find_or_create_by(id: 4, name: "participant")
Role.find_or_create_by(id: 5, name: "normal")

# Asignamos Roles normales a los usuarios creados

User.all.each do |user|
  user.roles << Role.last
end

# Asignamos superadmin
User.last.roles << Role.first