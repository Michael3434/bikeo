class AddFieldsToBikes < ActiveRecord::Migration
  def change
    add_column :bikes, :is_lock, :boolean
    add_column :bikes, :is_helmet, :boolean
    add_column :bikes, :is_lights, :boolean
    add_column :bikes, :is_bell, :boolean
    add_column :bikes, :is_reflectors, :boolean
    add_column :bikes, :is_baskets, :boolean
    add_column :bikes, :is_trailers, :boolean
  end
end
