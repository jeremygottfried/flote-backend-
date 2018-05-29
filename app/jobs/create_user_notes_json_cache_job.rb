
class CreateUserNotesJsonCacheJob < ApplicationJob
    queue_as :default

def perform(*_args)
  puts "hello world"
  @user = _args[0]
 Rails.cache.fetch(@user.cache_key_with_version) do
    User.where(id: @user.id).includes(:notes).to_json(include: :notes)
  end
end

end
