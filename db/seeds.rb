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

users = User.order(:created_at).take(6)
# 10.times do
#   content = Faker::Lorem.sentence(word_count: 20)
#   aa = Faker::Address.city
#   job = Faker::Job
#   users.each { |user| user.posts.create!(content: content, birthplace: aa, job:aa, job_description: aa,learning:aa,memories:aa,name:aa,original_content:aa,original_title:aa,reason:aa,research_field:aa,research_office:aa) }
# end
10.times do
  users.each do |user|
    name  = Faker::Name.name
    sentence1 = Faker::Lorem.sentence(word_count: 2)
    sentence2 = Faker::Lorem.sentence(word_count: 3)
    sentence3 = Faker::Lorem.sentence(word_count: 8)
    sentence4 = Faker::Lorem.sentence(word_count: 100)
    sentence5 = Faker::Lorem.sentence(word_count: 100)

    birthplace = Faker::Address.city
    job = Faker::Job
    
    user.posts.create!(
      content: sentence1, 
      birthplace: birthplace, 
      job:sentence1,
      job_description: sentence5,
      learning:sentence5,memories:sentence5,name:name,original_content:sentence5,original_title:sentence3,
      reason:sentence5,research_field:sentence1,research_office:sentence1
    )
  end
end




# , job:sentence, job_description: aa,learning:aa,memories:aa,name:aa,original_content:aa,original_title:aa,reason:aa,research_field:aa,research_office:aa 
# 追加
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

# > user.posts.first.tags.first
posts = Post.all
filenames = Dir.open("app/assets/images/samples/",&:to_a)

posts.each do |post|
  post.tags << Tag.find_by({name:"卒業生の声"})
filename = filenames[3..22].shuffle.first
 file_path = "app/assets/images/samples/#{filename}"
  post.images.attach(io: File.open("#{file_path}"),
filename: "samples/#{filename}")
end  







