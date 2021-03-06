require 'byebug'
class User < ApplicationRecord
  has_secure_password
  has_many :notes
  has_many :memberships
  has_many :channels, through: :memberships
  has_many :viewable_notes, through: :channels, foreign_key: "channel_id", class_name: "Note"
  validates_presence_of :username, :name, :password
  validates_uniqueness_of :username
  validates :username, format: { with: /\A[a-zA-Z0-9]+\Z/ }
  accepts_nested_attributes_for :memberships, :channels, :viewable_notes, :notes
  after_touch :create_json_cache




      def create_json_cache

        CreateUserNotesJsonCacheJob.perform_later(self)
      end



end
