class ChannelSerializer < ActiveModel::Serializer
  attributes :id, :title
  has_many :viewable_notes
  has_many :users, through: :memberships 
end
