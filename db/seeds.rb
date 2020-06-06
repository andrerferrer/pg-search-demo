User.destroy_all
Offer.destroy_all
Booking.destroy_all

# Create one user
User.create! first_name: 'Luke', last_name: 'Skywalker', address: 'Tatooine', phone_number: '123456789'

# Create one offer
Offer.create! name: 'Jedi training', description: Faker::Movies::StarWars.wookiee_sentence, owner: User.first

# Create another user
User.create! first_name: 'Leia', last_name: 'Organa', address: 'Alderaan', phone_number: '123456789'

# Create a booking
Booking.create! start_on: '2020-05-23', end_on: '2020-05-30', customer: User.last, offer: Offer.first


Offer.create! name: "A trip to #{Faker::Movies::StarWars.planet}", description: Faker::Movies::StarWars.wookiee_sentence, owner: User.first
Offer.create! name: "A trip to #{Faker::Movies::StarWars.planet}", description: Faker::Movies::StarWars.wookiee_sentence, owner: User.first
Offer.create! name: "A trip to #{Faker::Movies::StarWars.planet}", description: Faker::Movies::StarWars.wookiee_sentence, owner: User.first
Offer.create! name: "A trip to #{Faker::Movies::StarWars.planet}", description: Faker::Movies::StarWars.wookiee_sentence, owner: User.first
Offer.create! name: "A trip to #{Faker::Movies::StarWars.planet}", description: Faker::Movies::StarWars.wookiee_sentence, owner: User.first
Offer.create! name: "A trip to #{Faker::Movies::StarWars.planet}", description: Faker::Movies::StarWars.wookiee_sentence, owner: User.first
Offer.create! name: "A trip to #{Faker::Movies::StarWars.planet}", description: Faker::Movies::StarWars.wookiee_sentence, owner: User.first
Offer.create! name: "A trip to #{Faker::Movies::StarWars.planet}", description: Faker::Movies::StarWars.wookiee_sentence, owner: User.first
Offer.create! name: "A trip to #{Faker::Movies::StarWars.planet}", description: Faker::Movies::StarWars.wookiee_sentence, owner: User.first
Offer.create! name: "A trip to #{Faker::Movies::StarWars.planet}", description: Faker::Movies::StarWars.wookiee_sentence, owner: User.first
Offer.create! name: "A trip to #{Faker::Movies::StarWars.planet}", description: Faker::Movies::StarWars.wookiee_sentence, owner: User.first
Offer.create! name: "A trip to #{Faker::Movies::StarWars.planet}", description: Faker::Movies::StarWars.wookiee_sentence, owner: User.first
Offer.create! name: "A trip to #{Faker::Movies::StarWars.planet}", description: Faker::Movies::StarWars.wookiee_sentence, owner: User.first
Offer.create! name: "A trip to #{Faker::Movies::StarWars.planet}", description: Faker::Movies::StarWars.wookiee_sentence, owner: User.first
Offer.create! name: "A trip to #{Faker::Movies::StarWars.planet}", description: Faker::Movies::StarWars.wookiee_sentence, owner: User.first
