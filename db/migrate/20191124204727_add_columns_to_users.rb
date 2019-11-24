class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :major, :string
    add_column :users, :year, :string
    add_column :users, :image, :string
    add_column :users, :philosophy, :text
    add_column :users, :courses, :text
    add_column :users, :about, :text
  end
end
