class UserSerializer

  def self.show(user)
    {
      data: {
        type: 'users',
        id: user.id,
        attributes: {
          email: user.email,
          api_key: user.api_key
        }
      }
    }
  end

end
