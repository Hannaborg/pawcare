puts "destroying all users"
puts "destoying all dogs"

User.destroy_all
# Dog.destroy_all
puts "creating user..."
puts "creating dogs..."

user1 = User.create!(name: "Rui", email: "rui@gmail.com", password: "portugal")
dog1 = Dog.create!(name: "Snoopy", breed: "Beagle", description: "Snoopy, comic-strip character, a spotted white beagle with a rich fantasy life. The pet dog of the hapless Peanuts character Charlie Brown, Snoopy became one of the most iconic and beloved characters in the history of comics.", address: "Marquês de Pombal, Lisbon, Portugal", user_id: user1.id)

user2 = User.create!(name: "Joe", email: "joe@gmail.com", password: "england")
dog2 = Dog.create!(name: "Lassie", breed: "Rough Collie", description: "When most people think of a Collie, the dog that probably comes to mind is the legendary Lassie. Star of film, television, novels, cartoons, and comic strips, Lassie has become a household name and an important icon in American pop culture. These pups are very intelligent and sensitive to their owners' mood, and are great herders. ", address: "Rossio, Lisbon, Portugal", user_id: user1.id)

user3 = User.create!(name: "Rita", email: "Rita@gmail.com", password: "portugal")
dog3 = Dog.create!(name: "Lady", breed: "Cocker Spaniel", description: "Lady is rather demure and naive but makes a good friend to those who know her and is very faithful to her family. She is not completely helpless it is shown that she can be brave and protective. She was not afraid of the rat and would chase it away from her home and she took on the responsibility to protect Jim Jr.", address: "Rua de Santa Marta, Lisbon, Portugal", user_id: user1.id)

user4 = User.create!(name: "Rico", email: "Rico@gmail.com", password: "portugal")
dog4 = Dog.create!(name: "Dylan", breed: "Cocker Spaniel", description: "Lady is rather demure and naive but makes a good friend to those who know her and is very faithful to her family. She is not completely helpless it is shown that she can be brave and protective. She was not afraid of the rat and would chase it away from her home and she took on the responsibility to protect Jim Jr.", address: "Terreiro do Paço, Lisbon, Portugal", user_id: user1.id)
