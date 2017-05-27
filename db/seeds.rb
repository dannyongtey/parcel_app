# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
100.times do |f|
  Parcel.create!(name: Faker::Name.name,
                 quantity: 1,
                 phone: "012345678#{f}",
                 courier: "RandomCourier-#{f}")
end

User.create!(name: "admin",
             password_digest: User.digest("testing123"),
             username: "admin")