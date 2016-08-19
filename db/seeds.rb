require 'random_data'
# Create posts
50.times do
  Post.create!(
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph
  )
end
posts = Post.all

# Create Comments
100.times do
  Comment.create!(
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"


# Create Questions
10.times do
  Question.create!(
  title: "???Question Title???"
  body: "???Question Body???"
  resolved: true
  )
end
