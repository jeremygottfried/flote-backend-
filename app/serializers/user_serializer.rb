class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :name
  has_many :memberships 
  has_many :channels, through: :memberships
  has_many :viewable_notes, through: :channels
  has_many :notes
end
