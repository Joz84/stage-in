require "faker"

puts "Cleaning DB..."
HiringCheckpoint.destroy_all
StudentHiring.destroy_all
Hiring.destroy_all
Internship.destroy_all
User.destroy_all
StudentSkill.destroy_all
Skill.destroy_all
Checkpoint.destroy_all

User.create(email: "jules@gmail.com", first_name: 'Jules', last_name: 'Maregiano', role: 'student', password: '123soleil', level: '3ème', phone: '0123456789', latitude: "45.2463940", longitude: "0.3376510")
User.create(email: "company@gmail.com", first_name: 'Max', last_name: 'Boue', role: 'company', password: '123456', company: "Super Company of Death", level: nil, phone: '0123456789', latitude: "45.2463940", longitude: "0.3376510")

# SKILLS = SECTEUR D'ACTIVITE

url = "http://res.cloudinary.com/stage-in/image/upload/v1519578053/SA_artisanat_mvmrvr.jpg"
Skill.create(name: "L'artisanat")
Skill.last.photo_url = url
puts "Création de la Skill #{Skill.last.name}"

url = "http://res.cloudinary.com/stage-in/image/upload/v1519578054/SA_agriculture_b8up9i.jpg"
Skill.create(name: "L'agriculture")
Skill.last.photo_url = url
puts "Création de la Skill #{Skill.last.name}"

url = "http://res.cloudinary.com/stage-in/image/upload/v1519578053/SA_assurance_ouojh5.jpg"
Skill.create(name: "L'assurance")
Skill.last.photo_url = url
puts "Création de la Skill #{Skill.last.name}"

url = "http://res.cloudinary.com/stage-in/image/upload/v1519578054/SA_commerce_s67fbz.jpg"
Skill.create(name: "Le commerce")
Skill.last.photo_url = url
puts "Création de la Skill #{Skill.last.name}"

url = "http://res.cloudinary.com/stage-in/image/upload/v1519578053/SA_industry_abd7bg.jpg"
Skill.create(name: "L'industrie")
Skill.last.photo_url = url
puts "Création de la Skill #{Skill.last.name}"

url = "http://res.cloudinary.com/stage-in/image/upload/v1519578053/SA_internet_ojzgiw.jpg"
Skill.create(name: "Les télécoms et internet")
Skill.last.photo_url = url
puts "Création de la Skill #{Skill.last.name}"

url = "http://res.cloudinary.com/stage-in/image/upload/v1519578053/SA_research_cns4mx.jpg"
Skill.create(name: "La recherche")
Skill.last.photo_url = url
puts "Création de la Skill #{Skill.last.name}"

url = "http://res.cloudinary.com/stage-in/image/upload/v1519578054/SAtourisme_d6qtkw.jpg"
Skill.create(name: "Le tourisme")
Skill.last.photo_url = url
puts "Création de la Skill #{Skill.last.name}"


puts "Seeding internship..."
is = Internship.new(
  starts_at: Date.new(2018, 12, 4),
  ends_at: Date.new(2018, 12, 8),
  comment: "Stage de 3ème 2018-2019",
  name: "Collège Arnaud Daniel - du 16 au 21 juin 2018"
  )
is.save
is = Internship.new(
  starts_at: Date.new(2018, 12, 4),
  ends_at: Date.new(2018, 12, 8),
  comment: "Stage de 3ème 2017-2018",
  name: "Collège Notre Dame  - du 24 au 29 juin 2018"
  )
is.save
towns = [
  '24600 Allemans',
  '24600 Celles',
  '24350 Douchapt',
  '24600 Segonzac',
  '24320 Verteillac',
  '24320 Vendoire',
  '24350 Lisle',
  '24350 Tocane Saint Apre',
  '24320 Gouts-Rossignol',
  '24600 Ribérac',
  '24600 Ribérac',
  '24600 Ribérac',
  '24600 Ribérac',
]

puts "Seeding companies and hirings"
30.times do
  company = Faker::Company.name
  email = company.parameterize + "@gmail.com"
  c = User.new
  c.role = 0
  c.company = company
  c.email = email
  c.password = "123456"
  c.address = towns.sample
  c.phone = "0" + rand(100_000_000..999_999_999).to_s
  c.skill_id = Skill.all.sample.id
  puts c.errors.messages unless c.valid?
  c.save
  # create one hiring per company :
  h = Hiring.new(
    internship: Internship.all.first,
    company: c,
    )
  h.save!
end

puts "Seeding objectives"
checkpoints = [ "Tu t'es renseigné sur l'entreprise.",
                "Tu as postulé par le site.",
                "Tu as obtenu un rendez-vous téléphonique ou sur place.",
                "Tu as une confirmation de l’entreprise au téléphone par mail."
              ]
checkpoints.each_with_index do |title, i|
  Checkpoint.create(title: title, order: i)
end




