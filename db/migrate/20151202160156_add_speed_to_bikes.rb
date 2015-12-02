class AddSpeedToBikes < ActiveRecord::Migration
  def change
    add_column :bikes, :speed, :integer
  end
end
