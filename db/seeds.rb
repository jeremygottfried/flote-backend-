# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@user1 = User.create(username: 'jeremy', name: 'jeremy', password: 'password')
@channel1 = Channel.create(title: Faker::Hipster.sentence)
@note1 = Note.create(body: Faker::Hipster.paragraph, user_id: @user1.id, channel: @channel1)
@user1.notes << @note1
@channel1.notes << @note1
@user2 = User.create(username: 'eric', name: 'eric', password: 'password')
@channel2 = Channel.create(title: Faker::Hipster.sentence)
@note2 = Note.create(body: Faker::Hipster.paragraph, user_id: @user2.id, channel: @channel2)
@user2.notes << @note2
@channel2.notes << @note2
@user3 = User.create(username: 'grayson', name: 'grayson', password: 'password')
@channel3 = Channel.create(title: Faker::Hipster.sentence)
@note3 = Note.create(body: Faker::Hipster.paragraph, user_id: @user3.id, channel: @channel3)
@user3.notes << @note3
@channel3.notes << @note3


50.times do
  @user = User.create(username: Faker::Internet.user_name, name: Faker::Name.name, password: 'password')
  if @user.save
  @channel = Channel.create(title: Faker::Hipster.sentence)
  @note = Note.create(body: Faker::Hipster.paragraph, user_id: @user.id, channel: @channel)
  @user.notes << @note
  @channel.notes << @note
end
end
