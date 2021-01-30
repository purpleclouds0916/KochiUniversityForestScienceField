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
# 10.times do
#   content = Faker::Lorem.sentence(word_count: 20)
#   aa = Faker::Address.city
#   job = Faker::Job
#   users.each { |user| user.posts.create!(content: content, birthplace: aa, job:aa, job_description: aa,learning:aa,memories:aa,name:aa,original_content:aa,original_title:aa,reason:aa,research_field:aa,research_office:aa) }
# end
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
    
    user.posts.create!(tag_ids: '6',
      name:name, birthplace: birthplace, job:job, research_field:sentence1, research_office:sentence2,
      reason:sentence4, learning:sentence5, job_description: sentence6, memories:sentence7, original_title:sentence3, original_content:sentence8
    )
    # post.tags << Tag.find_by({name:"卒業生の声"})
    # filename = filenames[3..22].shuffle.first
    #  file_path = "app/assets/images/samples/#{filename}"
    #   post.images.attach(io: File.open("#{file_path}"),
    # filename: "samples/#{filename}")
  end
end



# > user.posts.first.tags.first
posts = Post.all
filenames = Dir.open("app/assets/images/samples/",&:to_a)

posts.each do |post|
  # post.tags << Tag.find_by({name:"卒業生の声"})
filename = filenames[3..22].shuffle.first
 file_path = "app/assets/images/samples/#{filename}"
  post.images.attach(io: File.open("#{file_path}"),
filename: "samples/#{filename}")
end  







