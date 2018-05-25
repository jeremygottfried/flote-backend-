
class AuthenticateUser
  prepend SimpleCommand

  def initialize(username, password)
    @username = username
    @password = password
  end

  def call
    JWT.encode({user_id: user.id}, jwt_password, 'HS256') if user
  end

  private


  attr_accessor :username, :password

  def jwt_password
    ENV["JWT_SECRET_KEY"]
  end

  def user
    user = User.find_by(username: @username)
    return user if user && user.authenticate(password)
    # byebug
    errors.add :user_authentication, 'invalid credentials'
    nil
  end
end
