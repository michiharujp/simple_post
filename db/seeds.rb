50.times do
  title = Faker::Lorem.sentence(10)
  content = Faker::Lorem.sentence(200)
  Micropost.create!(title: title,
                    content: content)
end
