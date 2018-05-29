require 'byebug'
class Note < ApplicationRecord
  belongs_to :user, touch: true
  belongs_to :channel, touch: true
  validates_presence_of :body
  # after_save :create_json_cache


  # def self.cache_key(notes)
  #     {
  #       serializer: 'notes',
  #       stat_record: notes.maximum(:updated_at)
  #     }
  #     end
  #


      # def create_json_cache
      #   CreateUserNotesJsonCacheJob.perform_now
      # end

end
