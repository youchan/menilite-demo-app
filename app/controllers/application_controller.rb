class ApplicationController < Menilite::Controller
  before_action(exclude: ['ApplicationController#login', 'User#auth']) do
    user = User[session[:user_id]]
    if user
      Menilite::PrivilegeService.current.privileges << UserPrivilege.new(user)
    else
      raise 'auth error'
    end
  end

  action :login do |username, password|
    user = User.find(name: username)
    if user && user.auth(password)
      session[:user_id] = user.id
    else
      raise 'auth error'
    end
  end
end
