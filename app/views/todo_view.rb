require_relative '../models/todo'

class TodoView
  include Hyalite::Component
  include Hyalite::Component::ShortHand

  def initial_state
    { todo_list: [] }
  end

  def handle_key_press(evt)
    if evt.code == 13
      @state[:todo_list] << Todo.new(description: @refs[:description].value)
      @refs[:description].value = ''
      force_update
    end
  end

  def render
    div({class: 'todo-view'},
      input({type: 'text', ref: 'description', onKeyPress: self.method(:handle_key_press) }),
      ul({class: 'todo-list'},
        @state[:todo_list].map {|todo| li(nil, todo.description) }
      )
    )
  end
end
