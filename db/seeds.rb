puts "destroying all users"
puts "destoying all dogs"

User.destroy_all
# Dog.destroy_all
puts "creating user..."
puts "creating dogs..."

user1 = User.create(name: "Rui", email: "rui@gmail.com", password: "portugal")
dog1 = Dog.create(name: "snoopy", breed: "terrier", description: "test 3", user_id: user1.id)

user2 = User.create(name: "Joe", email: "Joe@gmail.com", password: "england")
dog2 = Dog.create(name: "Lucy", breed: "german Shepard", description: " Beautiful dog, really well taught", user_id: user1.id)

user3 = User.create(name: "Rita", email: "Rita@gmail.com", password: "portugal")
dog3 = Dog.create(name: "Momo", breed: "beagle", description: "Lazy little dog but with lots of love to give", user_id: user1.id)

