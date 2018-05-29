class Membership < ApplicationRecord
  belongs_to :user, touch: true
  belongs_to :channel, touch: true
  # after_save :create_json_cache

  #
  # def self.cache_key(memberships)
  #     {
  #       serializer: 'memberships',
  #       stat_record: memberships.maximum(:updated_at)
  #     }
  #     end
  #
  #     private

      # def create_json_cache
      #   CreateMembershipsJsonCacheJob.perform_later
      # end

end
