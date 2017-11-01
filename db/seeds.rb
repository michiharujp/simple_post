50.times do
  content = Faker::Lorem.sentence(10)
  Micropost.create!(content: content)
end
