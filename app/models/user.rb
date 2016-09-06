unless RUBY_ENGINE == 'opal'
  require 'bcrypt'
end

class User < Menilite::Model
  field :name
  field :password

  action :signup, on_create: true do |password|
    self.password = BCrypt::Password.create(password)
    self.save
  end
end
