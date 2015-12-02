class RemoveAccessoriesToBikes < ActiveRecord::Migration
  def change
     remove_column :bikes, :accessories
  end
end

