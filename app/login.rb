require 'hyalite'
require 'menilite'
require_relative 'views/todo_view'
require_relative 'controllers/application_controller'

class LoginView
  include Hyalite::Component
  include Hyalite::Component::ShortHand

  def login
    ApplicationController.login(@refs[:name].value, @refs[:password].value) do
      `window.location = '/'`
    end
  end

  def render
    div({class: 'login-view'},
      p(nil, input({type: 'text', ref: 'name'})),
      p(nil, input({type: 'text', ref: 'password'})),
      p(nil, button({onClick: self.method(:login)}, 'Login'))
    )
  end
end
Hyalite.render(Hyalite.create_element(LoginView), $document['.content'])
