# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
User.create!(
    email: "kristina@kristina.com",
    password: "kristina",
    password_confirmation: "kristina",
    name: "Kristina",
    roles: "site_admin"
)

puts "1 admin user created"

User.create!(
    email: "joey@joey.com",
    password: "joeyjoey",
    password_confirmation: "joeyjoey",
    name: "Joey Hendricks"
)

puts "1 regular user created"

3.times do |topic|
    Topic.create!(
        title: "Topic #{topic}"
    )
end

puts "3 Topics created"

10.times do |blog|
    Blog.create!(
        title: "My blog post #{blog}",
        body: "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
        topic_id: Topic.last.id
    )
end

puts "10 blog posts created"

5.times do |skill|
    Skill.create!(
    title: "Rails #{skill}",
    percent: 20
    )
end

puts "5 skills created"

8.times do |portfolio_item|
    Portfolio.create!(
        title: "Portfolio title: #{portfolio_item}",
        subtitle: "Ruby on Rails",
        body: "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
        main_image: "https://placehold.it/600x400",
        thumb_image: "https://placehold.it/350x200"
    )
end

1.times do |portfolio_item|
    Portfolio.create!(
        title: "Portfolio title: #{portfolio_item}",
        subtitle: "Angular",
        body: "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
        main_image: "https://placehold.it/600x400",
        thumb_image: "https://placehold.it/350x200"
    )
end

puts "9 portfolio items created"

3.times do |technology|
    Portfolio.last.technologies.create!(
        name: "Technology #{technology}",
        portfolio_id: Portfolio.last.id
    )
end

puts "3 technologies created"