class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.text :bio
      t.integer :age

      t.timestamps null: false
    end
  end
end
