50.times do
  title = Faker::Lorem.sentence(10)
  content = Faker::Lorem.sentence(200)
  Micropost.create!(title: title, content: content)
end

microposts = Micropost.order(:created_at).take(10)
50.times do
  content = Faker::Lorem.sentence(10)
  microposts.each { |micropost| micropost.comments.create!(content: content) }
end
