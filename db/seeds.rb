User.create!(name:  "Example User",
             email: "honehonehero@gmail.com",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true)

# 追加のユーザーをまとめて生成する
12.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@test.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

Tag.create([
  { name: 'スライダー' },
  { name: '森林を学ぶ価値' },
  { name: '森林科学領域' },
  { name: '先生の紹介' },
  { name: '授業の紹介' },
  { name: '卒業生の声' },
  { name: '資格' },
  { name: '先生の紹介動画' }
])

users = User.order(:created_at).take(6)
filenames = Dir.open("app/assets/images/samples/",&:to_a)
10.times do
  users.each do |user|
    name  = Faker::Name.name
    birthplace = Faker::Address.city
    job = Faker::Company.name
    sentence1 = Faker::Lorem.sentence(word_count: 2)
    sentence2 = Faker::Lorem.sentence(word_count: 3)
    sentence3 = Faker::Lorem.sentence(word_count: 8)
    sentence4 = Faker::Lorem.sentence(word_count: 100)
    sentence5 = Faker::Lorem.sentence(word_count: 100)
    sentence6 = Faker::Lorem.sentence(word_count: 100)
    sentence7 = Faker::Lorem.sentence(word_count: 100)
    sentence8 = Faker::Lorem.sentence(word_count: 100)
    filename = filenames[3..22].shuffle.first
 file_path = "app/assets/images/samples/#{filename}"
    
    user.posts.create!(tag_ids: '6',
      name:name, birthplace: birthplace, job:job, research_field:sentence1, research_office:sentence2,
      reason:sentence4, learning:sentence5, job_description: sentence6, memories:sentence7, original_title:sentence3, original_content:sentence8
    ).images.attach(io: File.open("#{file_path}"),
    filename: "samples/#{filename}")
end
end
# user.posts.create!(tag_ids: '2',
#   title:"テスト"
# ).images.attach(io: File.open("app/assets/images/samples/sample1.jpg"),
# filename: "samples/sample1.jpg")
