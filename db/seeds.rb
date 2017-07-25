Game.create(name: "Asphalt 8", store: "Google Play")
Game.create(name: "Snake", store: "App Store")
Game.create(name: "Hungry shark", store: "Windows Store")
Game.create(name: "Fruit ninja", store: "Google Play")
Game.create(name: "Angry Birds", store: "App Store")

3.times do |n|
    name = Faker::Name.name
    speciality = "Designer"
    Employee.create(name: name, speciality: speciality)
end

3.times do |n|
    name = Faker::Name.name
    speciality = "Illustrator"
    Employee.create(name: name, speciality: speciality)
end

3.times do |n|
    name = Faker::Name.name
    speciality = "Writer"
    Employee.create(name: name, speciality: speciality)
end

3.times do |n|
    name = Faker::Name.name
    speciality = "Composer"
    Employee.create(name: name, speciality: speciality)
end

3.times do |n|
    name = Faker::Name.name
    speciality = "Developer"
    Employee.create(name: name, speciality: speciality)
end
