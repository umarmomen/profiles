class RemoveYearFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :year, :string
  end
end
