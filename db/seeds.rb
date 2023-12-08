puts 'Créé les 11 zones'
userwagon = ["Adrien", "Agathe", "Alban", "Alexandru", "Alexis", "Alizée", "Anahita", "Anne-Charlotte", "Anne-Perrine", "Baptiste", "Bastien", "Cecile", "Cydney", "Diane", "Elena", "Emmanuel", "Erwan", "Gautier", "Guilhem", "Henri", "Jeremy", "Jérémy", "Jerome", "Jules", "Julie", "Lina", "Lisa", "Louise", "Lucas", "Macoura", "Mael", "Margarita", "Mathieu", "Maxence", "Nathan", "Nicolas", "Noélie", "Pierre", "Pierre-François", "Pierre-Yves", "Romain", "Samuel", "Séverine", "Soledad", "Sophia", "Thomas", "Tudal", "Ursula", "Victor", "Yassin"]

# zones = ["P", "FT", "TF", "RZ", "TRZ", "RE", "TRE", "LZ", "TLZ", "LE", "TLE"]

# Seeding des zones

zone = Zone.create(
  name: "P",
  orientation: "Face",
  position: "Raquette",
  point: 2,
  description: "Raquette"
)
zone.save!

zone = Zone.create(
  name: "FT",
  orientation: "Face",
  position: "Lancer Franc",
  point: 1,
  description: "Lancer franc"
)
zone.save!

zone = Zone.create(
  name: "TF",
  orientation: "Face",
  position: "Face",
  point: 3,
  description: "3 points de face"
)
zone.save!

zone = Zone.create(
  name: "RZ",
  orientation: "Droite",
  position: "Ligne de fond",
  point: 2,
  description: "2 points fond droite"
)
zone.save!

zone = Zone.create(
  name: "TRZ",
  orientation: "Droite",
  position: "Ligne de fond",
  point: 3,
  description: "3 points fond droite"
)
zone.save!

zone = Zone.create(
  name: "RE",
  orientation: "Droite",
  position: "Coude",
  point: 2,
  description: "2 points angle droite"
)
zone.save!

zone = Zone.create(
  name: "TRE",
  orientation: "Droite",
  position: "Coude",
  point: 3,
  description: "3 points angle droite"
)
zone.save!

zone = Zone.create(
  name: "LZ",
  orientation: "Gauche",
  position: "Ligne de fond",
  point: 2,
  description: "2 points fond gauche"
)
zone.save!

zone = Zone.create(
  name: "TLZ",
  orientation: "Gauche",
  position: "Ligne de fond",
  point: 3,
  description: "3 points fond gauche"
)
zone.save!

zone = Zone.create(
  name: "LE",
  orientation: "Gauche",
  position: "Coude",
  point: 2,
  description: "2 points angle gauche"
)
zone.save!

zone = Zone.create(
  name: "TLE",
  orientation: "Gauche",
  position: "Coude",
  point: 3,
  description: "3 points angle gauche"
)
zone.save!

# Seeding des playgrounds

playground = Playground.create(
  name: "Playground Charles-Moureu",
  short_name: "Charles-Moureu",
  address: "34 rue Baudricourt, 75013 Paris",
  court: "https://media.timeout.com/images/106037645/1372/1029/image.webp"
)
playground.save!

playground = Playground.create(
  name: "Playground Duperré",
  short_name: "Duperré",
  address: "22 rue Duperré, 75009 Paris",
  court: "https://media.timeout.com/images/106037656/1372/1029/image.webp"
)
playground.save!

playground = Playground.create(
  name: "Playground du Champ-de-Mars",
  short_name: "Champ-de-Mars",
  address: "2 allée Adrienne-Lecouvreur, 75017 Paris",
  court: "https://media.timeout.com/images/106037640/1372/1029/image.webp"
)
playground.save!

playground = Playground.create(
  name: "Playground Sérurier",
  short_name: "Sérurier",
  address: "29 boulevard Sérurier, 75019 Paris",
  court: "https://media.timeout.com/images/106037650/1372/1029/image.webp"
)
playground.save!

playground = Playground.create(
  name: "Playground Jemmapes",
  short_name: "Jemmapes",
  address: "142 quai de Jemmapes, 75010 Paris",
  court: "https://media.timeout.com/images/106037644/1372/1029/image.webp"
)
playground.save!

playground = Playground.create(
  name: "Playground Paturle",
  short_name: "Paturle",
  address: "14 rue Paturle, 75014 Paris",
  court: "https://media.timeout.com/images/105417459/1372/1029/image.webp"
)
playground.save!

playground = Playground.create(
  name: "Playground Bir-Hakeim",
  short_name: "Bir-Hakeim",
  address: "77 quai Branly, 75015 Paris",
  court: "https://media.timeout.com/images/105268984/1372/1029/image.webp"
)
playground.save!

playground = Playground.create(
  name: "Playground Charenton",
  short_name: "Charenton",
  address: "68 boulevard Poniatowski, 75012 Paris",
  court: "https://media.timeout.com/images/106037651/1372/1029/image.webp"
)
playground.save!

playground = Playground.create(
  name: "Playground Vincent-Auriol",
  short_name: "Vincent-Auriol",
  address: "61 boulevard Vincent-Auriol, 75013 Paris",
  court: "https://media.timeout.com/images/106037646/1372/1029/image.webp"
)
playground.save!

playground = Playground.create(
  name: "Playground Stalingrad",
  short_name: "Stalingrad",
  address: "234 boulevard de la Villette, 75019 Paris",
  court: "https://media.timeout.com/images/106037641/1372/1029/image.webp"
)
playground.save!

playground = Playground.create(
  name: "Playground Luquet",
  short_name: "Luquet",
  address: "4 rue du Transvaal, 75020 Paris",
  court: "https://media.timeout.com/images/106037649/1372/1029/image.webp"
)
playground.save!

playground = Playground.create(
  name: "Terrain Saint-Paul",
  short_name: "Saint-Paul",
  address: "9 rue Charlemagne, 75004 Paris",
  court: "https://media.timeout.com/images/106037643/1372/1029/image.webp"
)
playground.save!

# Seeding des main users

usertest = User.create(
  first_name: "Greg",
  last_name: "Jordan",
  username: "Greg",
  email: "greg@test.fr",
  password: "azerty"
)
usertest.photo.attach(io: URI.open("https://ca.slack-edge.com/T02NE0241-U060B0PEXFV-9c38947096ac-512"), filename: "file#{usertest.username}")

usertest.save!

5.times do
  training = Training.create(
    shot_total: 20,
    shot_made: rand(6..7),
    user_id: usertest.id,
    zone_id: Zone.find(rand(1..11)).id,
    playground_id: Playground.find(rand(1..12)).id
  )
  training.save!
end
5.times do
  training = Training.create(
    shot_total: 20,
    shot_made: rand(8..9),
    user_id: usertest.id,
    zone_id: Zone.find(rand(1..11)).id,
    playground_id: Playground.find(rand(1..12)).id
  )
  training.save!
end
5.times do
  training = Training.create(
    shot_total: 20,
    shot_made: rand(10..11),
    user_id: usertest.id,
    zone_id: Zone.find(rand(1..11)).id,
    playground_id: Playground.find(rand(1..12)).id
  )
  training.save!
end
5.times do
  training = Training.create(
    shot_total: 20,
    shot_made: rand(12..13),
    user_id: usertest.id,
    zone_id: Zone.find(rand(1..11)).id,
    playground_id: Playground.find(rand(1..12)).id
  )
  training.save!
end

usertest = User.create(
  first_name: "Marius",
  last_name: "Jordan",
  username: "Marius",
  email: "marius@test.fr",
  password: "azerty"
)
usertest.save!
usertest.photo.attach(io: URI.open("https://ca.slack-edge.com/T02NE0241-U060CSG0CPN-c8b17f95a54a-512"), filename: "file#{usertest.username}")
usertest.banner.attach(io: URI.open("https://www.shutterstock.com/image-vector/vector-illustration-basketball-on-fire-600nw-1932908948.jpg"), filename: "file#{usertest.username}2")

5.times do
  training = Training.create(
    shot_total: 20,
    shot_made: rand(6..7),
    user_id: usertest.id,
    zone_id: Zone.find(rand(1..11)).id,
    playground_id: Playground.find(rand(1..12)).id
  )
  training.save!
end
5.times do
  training = Training.create(
    shot_total: 20,
    shot_made: rand(8..9),
    user_id: usertest.id,
    zone_id: Zone.find(rand(1..11)).id,
    playground_id: Playground.find(rand(1..12)).id
  )
  training.save!
end
5.times do
  training = Training.create(
    shot_total: 20,
    shot_made: rand(10..11),
    user_id: usertest.id,
    zone_id: Zone.find(rand(1..11)).id,
    playground_id: Playground.find(rand(1..12)).id
  )
  training.save!
end
5.times do
  training = Training.create(
    shot_total: 20,
    shot_made: rand(12..13),
    user_id: usertest.id,
    zone_id: Zone.find(rand(1..11)).id,
    playground_id: Playground.find(rand(1..12)).id
  )
  training.save!
end

usertest = User.create(
  first_name: "Johan",
  last_name: "Jordan",
  username: "Johan",
  email: "Johan@test.fr",
  password: "azerty"
)
usertest.save!
usertest.photo.attach(io: URI.open("https://ca.slack-edge.com/T02NE0241-U060KKV7T6V-2dc8612c00de-512"), filename: "file#{usertest.username}")
usertest.banner.attach(io: URI.open("https://as2.ftcdn.net/v2/jpg/04/19/63/99/1000_F_419639952_Z6UkJq0GvyoxN0nL83sQZvbwxhrBKXKk.jpg"), filename: "file#{usertest.username}2")

5.times do
  training = Training.create(
    shot_total: 20,
    shot_made: rand(6..7),
    user_id: usertest.id,
    zone_id: Zone.find(rand(1..11)).id,
    playground_id: Playground.find(rand(1..12)).id
  )
  training.save!
end
5.times do
  training = Training.create(
    shot_total: 20,
    shot_made: rand(8..9),
    user_id: usertest.id,
    zone_id: Zone.find(rand(1..11)).id,
    playground_id: Playground.find(rand(1..12)).id
  )
  training.save!
end
5.times do
  training = Training.create(
    shot_total: 20,
    shot_made: rand(10..11),
    user_id: usertest.id,
    zone_id: Zone.find(rand(1..11)).id,
    playground_id: Playground.find(rand(1..12)).id
  )
  training.save!
end
5.times do
  training = Training.create(
    shot_total: 20,
    shot_made: rand(12..13),
    user_id: usertest.id,
    zone_id: Zone.find(rand(1..11)).id,
    playground_id: Playground.find(rand(1..12)).id
  )
  training.save!
end

usertest = User.create(
  first_name: "Raph",
  last_name: "Jordan",
  username: "Raph",
  email: "raph@test.fr",
  password: "azerty"
)
usertest.save!
usertest.photo.attach(io: URI.open("https://ca.slack-edge.com/T02NE0241-U060NKA1WMP-a65364e0f59b-512"), filename: "file#{usertest.username}")
usertest.banner.attach(io: URI.open("https://www.goodnewsnetwork.org/wp-content/uploads/2016/08/Eddie-the-Otter-Youtube.jpg"), filename: "file#{usertest.username}2")

5.times do
  training = Training.create(
    shot_total: 20,
    shot_made: rand(6..7),
    user_id: usertest.id,
    zone_id: Zone.find(rand(1..11)).id,
    playground_id: Playground.find(rand(1..12)).id
  )
  training.save!
end
5.times do
  training = Training.create(
    shot_total: 20,
    shot_made: rand(8..9),
    user_id: usertest.id,
    zone_id: Zone.find(rand(1..11)).id,
    playground_id: Playground.find(rand(1..12)).id
  )
  training.save!
end
5.times do
  training = Training.create(
    shot_total: 20,
    shot_made: rand(10..11),
    user_id: usertest.id,
    zone_id: Zone.find(rand(1..11)).id,
    playground_id: Playground.find(rand(1..12)).id
  )
  training.save!
end
5.times do
  training = Training.create(
    shot_total: 20,
    shot_made: rand(12..13),
    user_id: usertest.id,
    zone_id: Zone.find(rand(1..11)).id,
    playground_id: Playground.find(rand(1..12)).id
  )
  training.save!
end

# Seeding des users bonus

compteur = 0

50.times do
  user = User.create(
    first_name: userwagon[compteur],
    last_name: Faker::Name.last_name,
    username: userwagon[compteur],
    email: "#{userwagon[compteur]}@test.fr",
    password: "azerty"
  )
  user.photo.attach(io: URI.open("https://libreemploi.qc.ca/wp-content/uploads/2020/02/blank-profile-picture-973460_1280.png"), filename: "file#{user.username}")
  user.save!
  compteur += 1
  5.times do
    training = Training.create(
      shot_total: 20,
      shot_made: rand(2..4),
      user_id: user.id,
      zone_id: Zone.find(rand(1..11)).id,
      playground_id: Playground.find(rand(1..12)).id,
      created_at: 3.days.ago
    )
    training.save!
  end
  5.times do
    training = Training.create(
      shot_total: 20,
      shot_made: rand(5..6),
      user_id: user.id,
      zone_id: Zone.find(rand(1..11)).id,
      playground_id: Playground.find(rand(1..12)).id,
      created_at: 4.days.ago
    )
    training.save!
  end
  5.times do
    training = Training.create(
      shot_total: 20,
      shot_made: rand(7..8),
      user_id: user.id,
      zone_id: Zone.find(rand(1..11)).id,
      playground_id: Playground.find(rand(1..12)).id,
      created_at: 5.days.ago
    )
    training.save!
  end
  10.times do
    training = Training.create(
      shot_total: 20,
      shot_made: rand(9..10),
      user_id: user.id,
      zone_id: Zone.find(rand(1..11)).id,
      playground_id: Playground.find(rand(1..12)).id,
      created_at: 6.days.ago
    )
    training.save!
  end
end

# usertest = User.create(
#   first_name: "Lebron",
#   last_name: "James",
#   username: "Lebron James",
#   email: "lebron@test.fr",
#   password: "azerty"
# )
# usertest.save!
# usertest.photo.attach(io: URI.open("https://toppng.com/uploads/preview/mj-crying-face-png-black-and-white-download-lebron-crying-face-funny-humor-meme-basketball-cavs-11562892795iafxsdm5j8.png"), filename: "file#{usertest.username}")


# 15.times do
#   training = Training.create(
#     shot_total: 20,
#     shot_made: rand(19),
#     user_id: usertest.id,
#     zone_id: Zone.find(rand(1..11)).id
#   )
#   training.save!
# end

# 150.times do
#   training = Training.create(
#     shot_total: 20,
#     shot_made: rand(19),
#     user_id: usertest.id,
#     zone_id: Zone.find(rand(1..11)).id
#   )
#   training.save!
# end

# 10.times do
#   user = User.create(
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     username: Faker::Internet.username,
#     email: Faker::Internet.email,
#     password: "azerty"
#   )
#   user.save!

#   5.times do
#     training = Training.create(
#       shot_total: 20,
#       shot_made: rand(19),
#       user_id: User.find_by(username: user.username).id,
#       zone_id: Zone.find(rand(1..11)).id
#     )
#     training.save!
#   end
# end
puts 'Finished!'
