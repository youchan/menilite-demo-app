require 'hyalite'
require 'menilite'
require_relative 'views/todo_view'
require_relative 'models/user'

class LoginView
  include Hyalite::Component
  include Hyalite::Component::ShortHand

  def render
    div({class: 'login-view'},
      p(nil, input({type: 'text', ref: 'name'})),
      p(nil, input({type: 'text', ref: 'password'})),
      p(nil, button({}, 'Login'))
    )
  end
end
Hyalite.render(Hyalite.create_element(LoginView), $document['.content'])
