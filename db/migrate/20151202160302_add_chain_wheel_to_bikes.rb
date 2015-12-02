class AddChainWheelToBikes < ActiveRecord::Migration
  def change
    add_column :bikes, :chain_wheel, :integer
  end
end
