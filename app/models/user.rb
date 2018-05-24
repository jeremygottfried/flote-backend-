class User < ApplicationRecord
  has_secure_password
  has_many :notes
  has_many :channels, through: :notes
  validates_presence_of :username, :name, :password
  validates_uniqueness_of :username
  validates :username, format: { with: /\A[a-zA-Z0-9]+\Z/ }
end
