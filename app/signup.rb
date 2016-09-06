require 'hyalite'
require 'menilite'
require_relative 'views/todo_view'
require_relative 'models/user'

class AppView
  include Hyalite::Component
  include Hyalite::Component::ShortHand

  def signup
    user = User.new(name: @refs[:name].value)
    user.signup(@refs[:password].value) do
      `window.location = '/'`
    end
  end

  def render
    div({class: 'signup-view'},
      p(nil, input({type: 'text', ref: 'name'})),
      p(nil, input({type: 'text', ref: 'password'})),
      p(nil, button({onClick: self.method(:signup)}, 'Signup'))
    )
  end
end
Hyalite.render(Hyalite.create_element(AppView), $document['.content'])
