class AddColumnUserOnTodos < ActiveRecord::Migration
  def change
    add_column :todos, :user_guid, :string, index: true
  end
end
