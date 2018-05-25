class Channel < ApplicationRecord
  has_many :viewable_notes, foreign_key: "channel_id", class_name: "Note"
  has_many :users, through: :memberships
end
