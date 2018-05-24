class Note < ApplicationRecord
  belongs_to :user
  belongs_to :channel
  validates_presence_of :body
end
