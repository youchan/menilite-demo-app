unless RUBY_ENGINE == 'opal'
  require 'bcrypt'
end

class User < Menilite::Model
  field :name
  field :password

  validation :name, presence: true

  action :signup, on_create: true do |password|
    self.password = BCrypt::Password.create(password)
    self.save
  end

  if_server do
    def auth(password)
      BCrypt::Password.new(self.password) == password
    end
  end
end
