class TodoView
  include Hyalite::Component
  include Hyalite::Component::ShortHand

  def initial_state
    { todo_list: [] }
  end

  def render
    div({class: 'todo-view'},
      input({type: 'text', ref: 'description'}),
      ul({class: 'todo-list'},
        @state[:todo_list].map {|todo| li(nil, todo.description) }
      )
    )
  end
end
