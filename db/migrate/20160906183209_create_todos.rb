class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :guid, index: true
      t.string :description
      t.boolean :done
    end
  end
end
