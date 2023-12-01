puts 'Créé les 11 zones, 10 users avec 5 sessions chacuns...'

# zones = ["P", "FT", "TF", "RZ", "TRZ", "RE", "TRE", "LZ", "TLZ", "LE", "TLE"]

zone = Zone.create(
  name: "P",
  orientation: "Face",
  position: "Raquette",
  point: 2
)
zone.save!

zone = Zone.create(
  name: "FT",
  orientation: "",
  position: "Lancer Franc",
  point: 1
)
zone.save!

zone = Zone.create(
  name: "TF",
  orientation: "",
  position: "Face",
  point: 3
)
zone.save!

zone = Zone.create(
  name: "RZ",
  orientation: "Droite",
  position: "Ligne de fond",
  point: 2
)
zone.save!

zone = Zone.create(
  name: "TRZ",
  orientation: "Droite",
  position: "Ligne de fond",
  point: 3
)
zone.save!

zone = Zone.create(
  name: "RE",
  orientation: "Droite",
  position: "Coude",
  point: 2
)
zone.save!

zone = Zone.create(
  name: "TRE",
  orientation: "Droite",
  position: "Coude",
  point: 3
)
zone.save!

zone = Zone.create(
  name: "LZ",
  orientation: "Gauche",
  position: "Ligne de fond",
  point: 2
)
zone.save!

zone = Zone.create(
  name: "TLZ",
  orientation: "Gauche",
  position: "Ligne de fond",
  point: 3
)
zone.save!

zone = Zone.create(
  name: "LE",
  orientation: "Gauche",
  position: "Coude",
  point: 2
)
zone.save!

zone = Zone.create(
  name: "TLE",
  orientation: "Gauche",
  position: "Coude",
  point: 3
)
zone.save!

usertest = User.create(
  first_name: "Mariuel",
  last_name: "Johardan",
  username: "gregbgdu77",
  email: "test@test.fr",
  password: "azerty"
)
usertest.save!

150.times do
  training = Training.create(
    shot_total: 20,
    shot_made: rand(19),
    user_id: usertest.id,
    zone_id: Zone.find(rand(1..11)).id
  )
  training.save!
end

10.times do
  user = User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    username: Faker::Internet.username,
    email: Faker::Internet.email,
    password: "azerty"
  )
  user.save!

  5.times do
    training = Training.create(
      shot_total: 20,
      shot_made: rand(19),
      user_id: User.find_by(username: user.username).id,
      zone_id: Zone.find(rand(1..11)).id
    )
    training.save!
  end
end
puts 'Finished!'
