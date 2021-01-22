User.create!(name:  "Example User",
             email: "honehonehero@gmail.com",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true)

# 追加のユーザーをまとめて生成する
99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

users = User.order(:created_at).take(6)
50.times do
  title = Faker::Lorem.sentence(word_count: 2)
  users.each { |user| user.posts.create!(title: title) }
end

Tag.create([
  { name: 'スライダー' },
  { name: '森林を学ぶ価値' },
  { name: '森林科学領域' },
  { name: '先生の紹介' },
  { name: '授業の紹介' },
  { name: '卒業生の声' },
  { name: '資格' }
])