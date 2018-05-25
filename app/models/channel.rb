class Channel < ApplicationRecord
  has_many :viewable_notes, foreign_key: "channel_id", class_name: "Note"
  has_many :memberships 
  has_many :users, through: :memberships
  accepts_nested_attributes_for :viewable_notes, :users, :memberships
end
