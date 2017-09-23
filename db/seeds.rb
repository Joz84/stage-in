# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(email: "jules.maregiano@gmail.com", first_name: 'Jules', last_name: 'Maregiano', role: 'student', password: '123soleil', level: '3eme', phone: '0123456789')


urls = ["http://res.cloudinary.com/zanzibar/image/upload/v1506202395/danka-peter-148724_ywiman.jpg","http://res.cloudinary.com/zanzibar/image/upload/v1506202400/climate-kic-350836_lefhcp.jpg"]
Skill.create(name: "TimideSociable")
Skill.last.photo_urls = urls
puts "Création de la Skill #{Skill.last.name}"
urls = ["http://res.cloudinary.com/zanzibar/image/upload/v1506202395/danka-peter-148724_ywiman.jpg","http://res.cloudinary.com/zanzibar/image/upload/v1506202400/climate-kic-350836_lefhcp.jpg"]
Skill.create(name: "OrganiseCreatif")
Skill.last.photo_urls = urls
puts "Création de la Skill #{Skill.last.name}"
urls = ["http://res.cloudinary.com/zanzibar/image/upload/v1506202395/danka-peter-148724_ywiman.jpg","http://res.cloudinary.com/zanzibar/image/upload/v1506202400/climate-kic-350836_lefhcp.jpg"]
Skill.create(name: "CommercialCulturel")
Skill.last.photo_urls = urls
puts "Création de la Skill #{Skill.last.name}"
urls = ["http://res.cloudinary.com/zanzibar/image/upload/v1506202395/danka-peter-148724_ywiman.jpg","http://res.cloudinary.com/zanzibar/image/upload/v1506202400/climate-kic-350836_lefhcp.jpg"]
Skill.create(name: "PrivePublic")
Skill.last.photo_urls = urls
puts "Création de la Skill #{Skill.last.name}"
urls = ["http://res.cloudinary.com/zanzibar/image/upload/v1506202395/danka-peter-148724_ywiman.jpg","http://res.cloudinary.com/zanzibar/image/upload/v1506202400/climate-kic-350836_lefhcp.jpg"]
Skill.create(name: "ManuelInformatique")
Skill.last.photo_urls = urls
puts "Création de la Skill #{Skill.last.name}"
