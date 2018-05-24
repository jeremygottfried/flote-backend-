class Channel < ApplicationRecord
  has_many :notes
  has_many :users, through: :notes
  validates_presence_of :title
end
