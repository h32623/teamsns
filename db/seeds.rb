# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


post = Post.new
post.email = Faker::Internet.email
post.title = "제목입니다"
post.content = "내용입니다"
post.save

Post.create!(email: Faker::Internet.email, title: "제목2",content: "내용2")