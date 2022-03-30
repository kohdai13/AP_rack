# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create!(
  id: 1,
  name: "テスト",
  nickname: "テスト",
  introduction: "よろしくお願いします",
  email: "test@test.com",
  password: "123456",
  password_confirmation: "123456"
  )
  user.profile_image.attach(io: File.open(Rails.root.join('app/assets/images/user1.png')),
                  filename: 'user1.png')

user2 = User.create!(
  id: 2,
  name: "令和智子",
  nickname: "ともちん",
  introduction: "服が大好きです！",
  email: "tomoko@tomoko.com",
  password: "123456",
  password_confirmation: "123456"
  )
  user2.profile_image.attach(io: File.open(Rails.root.join('app/assets/images/user2.png')),
                  filename: 'user2.png')

user3 = User.create!(
  id: 3,
  name: "山田太郎",
  nickname: "ヤマ",
  introduction: "古着が好きです！",
  email: "tarou@tarou.com",
  password: "123456",
  password_confirmation: "123456"
  )
  user3.profile_image.attach(io: File.open(Rails.root.join('app/assets/images/user3.png')),
                  filename: 'user3.png')

user4 = User.create!(
  id: 4,
  name: "鈴木一郎",
  nickname: "キイチ",
  introduction: "セレショによく行きます！",
  email: "ichirou@ichirou.com",
  password: "123456",
  password_confirmation: "123456"
  )
  user4.profile_image.attach(io: File.open(Rails.root.join('app/assets/images/user4.png')),
                  filename: 'user4.png')


user5 = User.create!(
  id: 5,
  name: "テストテスト",
  nickname: "テストテスト",
  introduction: "よろしくお願いします",
  email: "testtest@test.com",
  password: "123456",
  password_confirmation: "123456"
  )
  user.profile_image.attach(io: File.open(Rails.root.join('app/assets/images/user5.png')),
                  filename: 'user5.png')