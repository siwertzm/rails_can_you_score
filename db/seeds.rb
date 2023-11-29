puts 'Créé les 11 zones, 10 users avec 5 sessions chacuns...'

zones = ["P", "FT", "TF", "RZ", "TRZ", "RE", "TRE", "LZ", "TLZ", "LE", "TLE"]
compteur = 0
11.times do
  zone = Zone.create(
    name: zones[compteur]
  )
  zone.save!
  compteur += 1
end

usertest = User.create(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  username: Faker::Internet.username,
  email: "test@test.fr",
  password: "azerty"
)
usertest.save!

5.times do
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
