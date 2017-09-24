require "faker"

puts "Cleaning DB..."
Hiring.destroy_all
Internship.destroy_all
Job.destroy_all
User.destroy_all

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
