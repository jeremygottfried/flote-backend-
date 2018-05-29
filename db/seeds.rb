# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@user1 = User.create(username: 'jeremy', name: 'jeremy', password: 'password')
@channel1 = Channel.create(title: Faker::Hipster.sentence)
@membership1 = Membership.create(channel: @channel1, user: @user1)
1000.times do
  @note1 = Note.create(body: Faker::Hipster.paragraph, user_id: @user1.id, channel: @channel1)
  @user1.notes << @note1
  @channel1.viewable_notes << @note1
end
@user1.channels << @channel1



@user2 = User.create(username: 'eric', name: 'eric', password: 'password')
@channel2 = Channel.create(title: Faker::Hipster.sentence)
@membership2 = Membership.create(channel: @channel2, user: @user2)
1000.times do
  @note2 = Note.create(body: Faker::Hipster.paragraph, user_id: @user1.id, channel: @channel1)
  @user2.notes << @note2
  @channel2.viewable_notes << @note2
end
@user2.channels << @channel2



@user3 = User.create(username: 'grayson', name: 'grayson', password: 'password')
@channel3 = Channel.create(title: Faker::Hipster.sentence)
@membership3 = Membership.create(channel: @channel3, user: @user3)
1000.times do
  @note3 = Note.create(body: Faker::Hipster.paragraph, user_id: @user1.id, channel: @channel1)
  @user3.notes << @note3
  @channel3.viewable_notes << @note3
end
@user3.channels << @channel3

#
#
50.times do
    @user = User.create(username: Faker::Internet.user_name, name: Faker::Name.name, password: 'password')
  if @user.save
    @channel = Channel.create(title: Faker::Hipster.sentence)
    @membership = Membership.create(channel: @channel, user: @user)
    1000.times do
      @note = Note.create(body: Faker::Hipster.paragraph, user_id: @user.id, channel: @channel)
      @user.notes << @note
      @channel.viewable_notes << @note
    end
  end
end
