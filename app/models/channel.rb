class Channel < ApplicationRecord
  has_many :viewable_notes, foreign_key: "channel_id", class_name: "Note"
  has_many :memberships
  has_many :users, through: :memberships
  accepts_nested_attributes_for :viewable_notes, :users, :memberships
  # after_save :create_json_cache


  # def self.cache_key(channels)
  #     {
  #       serializer: 'channels',
  #       stat_record: channels.maximum(:updated_at)
  #     }
  #     end
  #
  #     private

      # def create_json_cache
      #   CreateChannelsJsonCacheJob.perform_later
      # end

end
