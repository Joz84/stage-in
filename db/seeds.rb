require "faker"

puts "Cleaning DB..."
Hiring.destroy_all
Internship.destroy_all
Job.destroy_all
User.destroy_all
Skill.destroy_all
StudentSkill.destroy_all

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

puts "Seeding jobs..."
jobs = [
  'Coiffure - Beauté',
  'Boulangerie - Pâtisserie',
  'Mécanique et entretien auto',
  'Restauration',
  'Agriculture - Elevage',
  'Auto Ecole',
  'Transport',
  'Bâtiment - Construction bois',
  'Plomberie Chauffage',
  'Comptabilité',
  'Machines agricoles',
  'Tourisme'
]
jobs.each do |job|
  j = Job.new(name: job)
  j.save
end

puts "Seeding internship..."
is = Internship.new(
  starts_at: Date.new(2017, 12, 4),
  ends_at: Date.new(2017, 12, 8),
  comment: "Stage de 3ème 2017-2018",
  name: "3eme"
  )
is.save
is = Internship.new(
  starts_at: Date.new(2017, 12, 4),
  ends_at: Date.new(2017, 12, 8),
  comment: "Stage de 3ème 2017-2018",
  name: "2eme"
  )
is.save
is = Internship.new(
  starts_at: Date.new(2017, 12, 4),
  ends_at: Date.new(2017, 12, 8),
  comment: "Stage de 3ème 2017-2018",
  name: "Bac Pro"
  )
is.save

puts "Seeding companies and hirings"
60.times do
  company = Faker::Company.name
  email = company.parameterize + "@gmail.com"
  c = User.new
  c.role = 0
  c.company = company
  c.email = email
  c.password = "toto33"
  c.address = towns.sample
  c.phone = "0" + rand(100_000_000..999_999_999).to_s
  puts c.errors.messages unless c.valid?
  c.save
  # create one hiring per company :
  h = Hiring.new(
    internship: Internship.all.first,
    company: c,
    job: Job.select('RANDOM()').first
    )
  h.save
end
