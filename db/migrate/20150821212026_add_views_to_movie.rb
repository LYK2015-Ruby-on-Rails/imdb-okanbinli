class AddViewsToMovie < ActiveRecord::Migration
  def change
    add_column :movies, :views, :integer, default: 0
  end
end
