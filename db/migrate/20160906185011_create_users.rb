class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :guid, index: true, unique: true
      t.string :name, index: true, unique: true
      t.string :password
    end
  end
end
