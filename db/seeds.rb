# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(email: "jules.maregiano@gmail.com", first_name: 'Jules', last_name: 'Maregiano', role: 'student', password: '123soleil', level: '3eme', phone: '0123456789')


urls = ["http://res.cloudinary.com/zanzibar/image/upload/v1506205262/zachary-staines-198292_ocdotq.jpg",
        "http://res.cloudinary.com/zanzibar/image/upload/v1506246682/climate-kic-350836_c6mpwb.jpg"]
Skill.create(name: "SolitaireSociable")
Skill.last.photo_urls = urls
puts "Création de la Skill #{Skill.last.name}"
urls = ["http://res.cloudinary.com/zanzibar/image/upload/v1506202402/jazmin-quaynor-36221_tbs6la.jpg",
        "http://res.cloudinary.com/zanzibar/image/upload/v1506202386/chris-brignola-7766_lfuwbf.jpg"]
Skill.create(name: "OrganiseCreatif")
Skill.last.photo_urls = urls
puts "Création de la Skill #{Skill.last.name}"
urls = ["http://res.cloudinary.com/zanzibar/image/upload/v1506202341/gez-xavier-mansfield-284653_f6k4hy.jpg",
        "http://res.cloudinary.com/zanzibar/image/upload/v1506205266/jon-tyson-228521_otgd6f.jpg"]
Skill.create(name: "CommercialCulturel")
Skill.last.photo_urls = urls
puts "Création de la Skill #{Skill.last.name}"
urls = ["http://res.cloudinary.com/zanzibar/image/upload/v1506244870/Google-Logo-Batiment_gefj6t.jpg",
        "http://res.cloudinary.com/zanzibar/image/upload/v1506244981/Assembl%C3%A9e_nationale_02_j3tlpb.jpg"]
Skill.create(name: "PrivePublic")
Skill.last.photo_urls = urls
puts "Création de la Skill #{Skill.last.name}"
urls = ["http://res.cloudinary.com/zanzibar/image/upload/v1506246219/swapnil-dwivedi-246205_jcxabx.jpg",
        "http://res.cloudinary.com/zanzibar/image/upload/v1506246212/glenn-carstens-peters-203007_uo6655.jpg"]
Skill.create(name: "ManuelInformatique")
Skill.last.photo_urls = urls
puts "Création de la Skill #{Skill.last.name}"
