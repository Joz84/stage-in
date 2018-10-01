require "faker"

puts "Cleaning DB..."

HiringCheckpoint.destroy_all
StudentHiring.destroy_all
Hiring.destroy_all
Internship.destroy_all
User.where(role: :student).destroy_all
User.where(role: :college).destroy_all
StudentSkill.destroy_all
Skill.destroy_all
Checkpoint.destroy_all


c1 = User.create(college_name: "Collège Arnault Daniel", city: "Ribérac", email:"arnault.daniel@averifier.com", password: "123456",latitude:"45.243756", longitude: "0.335228", role: 'college')
c2 = User.create(college_name: "Collège Michel Debet", city: "Tocane-Saint-Apre", email: "ce.0240073z@ac-bordeaux.fr", password: "123456", latitude:"45.250822", longitude: "0.496137", role: 'college')
c3 = User.create(college_name: "MFR du Ribéracois", city: "Vanxains", email: "mfr.vanxains@mfr.asso.fr", password: "123456", latitude:"45.217030", longitude: "0.286809", role: 'college')

User.create(email: "jules@gmail.com", birthday: Date.new(2000, 01, 14),first_name: 'Jules', last_name: 'Maregiano', role: 'student', password: '123soleil', level: '3ème', phone: '0123456789', latitude: "45.2463940", longitude: "0.3376510", college: c1, college_acceptation: true)
User.create(email: "company@gmail.com", first_name: 'Max', last_name: 'Boue', role: 'company', password: '123456', company: "Super Company of Death", level: nil, phone: '0123456789', latitude: "45.2463940", longitude: "0.3376510", description: "Extencia, experts en accompagnement C’est cette idée qui dirige notre cabinet d’experts-comptables : accompagner nos clients au quotidien et réserver notre énergie à votre réussite. Cet état d’esprit se résume ainsi : « c’est en faisant particulièrement bien notre métier que vous pourrez vous consacrer pleinement au vôtre ! »")


# SKILLS = SECTEUR D'ACTIVITE

url = "http://res.cloudinary.com/stage-in/image/upload/v1519578053/SA_artisanat_mvmrvr.jpg"
Skill.create(name: "Artisanat, Métiers du Batiment")
Skill.last.photo_url = url
puts "Création de la Skill #{Skill.last.name}"

url = "http://res.cloudinary.com/stage-in/image/upload/v1519578054/SA_agriculture_b8up9i.jpg"
Skill.create(name: "Agriculture, Agroalimentaire")
Skill.last.photo_url = url
puts "Création de la Skill #{Skill.last.name}"

url = "http://res.cloudinary.com/stage-in/image/upload/v1519578053/SA_assurance_ouojh5.jpg"
Skill.create(name: "Secrétariat, Comptabilité, Commerce")
Skill.last.photo_url = url
puts "Création de la Skill #{Skill.last.name}"

url = "http://res.cloudinary.com/stage-in/image/upload/v1519578054/SA_commerce_s67fbz.jpg"
Skill.create(name: "Métiers de bouche, Hôtellerie, Restauration")
Skill.last.photo_url = url
puts "Création de la Skill #{Skill.last.name}"

url = "http://res.cloudinary.com/stage-in/image/upload/v1519578053/SA_industry_abd7bg.jpg"
Skill.create(name: "Métiers de l’industrie et de la maintenance")
Skill.last.photo_url = url
puts "Création de la Skill #{Skill.last.name}"

url = "http://res.cloudinary.com/stage-in/image/upload/v1519578053/SA_internet_ojzgiw.jpg"
Skill.create(name: "Métiers du numérique")
Skill.last.photo_url = url
puts "Création de la Skill #{Skill.last.name}"

url = "http://res.cloudinary.com/stage-in/image/upload/v1519578053/SA_research_cns4mx.jpg"
Skill.create(name: "Métiers du Social, de la Santé, Service à la personne")
Skill.last.photo_url = url
puts "Création de la Skill #{Skill.last.name}"

url = "http://res.cloudinary.com/stage-in/image/upload/v1519578054/SAtourisme_d6qtkw.jpg"
Skill.create(name: "Tourisme, Culture, Sport")
Skill.last.photo_url = url
puts "Création de la Skill #{Skill.last.name}"

url = "https://images.pexels.com/photos/1267338/pexels-photo-1267338.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"
Skill.create(name: "Transport, logistique")
Skill.last.photo_url = url
puts "Création de la Skill #{Skill.last.name}"
puts "Seeding internship..."

is = Internship.new(
  starts_at: Date.new(2018, 12, 3),
  ends_at: Date.new(2018, 12, 7),
  comment: "Stage de 3ème 2018-2019",
  college: c1
  )
is.save
is = Internship.new(
  starts_at: Date.new(2018, 12, 17),
  ends_at: Date.new(2018, 12, 21),
  comment: "Stage de 3ème 2018-2019",
  college: c2
  )
is.save
is = Internship.new(
  starts_at: Date.new(2019, 01, 14),
  ends_at: Date.new(2019, 01, 25),
  comment: "Stage de 3ème 2018-2019",
  college: c3
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
  description = Faker::Company.catch_phrase
  c = User.new
  c.role = 0
  c.company = company
  c.description = description
  c.skill = Skill.all.sample
  c.email = email
  c.password = "123456"
  c.address = towns.sample
  c.phone = "0" + rand(100_000_000..999_999_999).to_s
  puts c.errors.messages unless c.valid?
  c.save
  # create one hiring per company :
  h = Hiring.new(
    internship: Internship.all.sample,
    company: c,
    visible: true
    )
  h.save!
end

puts "Seeding objectives"
checkpoints = [ "Je me renseigne sur l'entreprise.",
                "J'informe l'entreprise que je suis intéressé.",
                "Je prend rendez-vous avec l'entreprise."
              ]
checkpoints.each_with_index do |title, i|
  Checkpoint.create(title: title, order: i)
end




