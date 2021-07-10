# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
15.times do
	user = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email,  about: Faker::Lorem.paragraphs, password: "123456")
	article = Article.create(title: Faker::Lorem.sentence, content: Faker::Lorem.paragraphs,user: user)
	tag = Tag.create(name: Faker::Lorem.sentence(word_count: 3))
	article_tag = ArticleTag.create(tag: tag,article: article)
	comment = Comment.create(fullname: Faker::Name.name,email: Faker::Internet.email,message: Faker::Lorem.paragraphs,article: article)
	message = Message.create(fullname: Faker::Name.name,email: Faker::Internet.email,content: Faker::Lorem.paragraphs)
  setting = Setting.create(blog_name: Faker::Artist.name,post_per_page: Faker::Number.number(digits: 2),if_maintance: [true,false].sample)
  #notification = Notification.create(notifiable: [message,comment].sample,notifiable_type: )
end	
