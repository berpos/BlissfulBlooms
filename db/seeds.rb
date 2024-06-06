puts "Destroying DataBase"

Log.destroy_all
Plant.destroy_all
Location.destroy_all

puts "Creating new seeds"

10.times do
  Location.create!(
    user_id: User.last.id,
    name: Faker::Name.first_name
  )
end

10.times do
  Plant.create!(
    location_id: Location.last.id,
    name: Faker::Name.first_name,
    state: %i[Very bad bad good very good].sample,
    updated_at: "today",
    age: rand(0...3),
    level: rand(0...4),
    categories: %i[person moment].sample
  )
end

10.times do
  Log.create!(
    plant_id: Plant.last.id,
    categories: %i[water trim soil],
    content: "This is purely a test, don't mind this"
  )
end

puts 'New databse created'
