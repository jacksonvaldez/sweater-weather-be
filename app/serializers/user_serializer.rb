class UserSerializer

  def self.user_created(user, api_key)
    {
      data: {
        type: 'users',
        id: user.id,
        attributes: {
          email: user.email,
          api_key: api_key
        }
      }
    }
  end

end
