class AddFieldToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :opened, :boolean, :default => false
  end
end

