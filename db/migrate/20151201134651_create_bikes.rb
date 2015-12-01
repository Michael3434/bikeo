class CreateBikes < ActiveRecord::Migration
  def change
    create_table :bikes do |t|
      t.references :user, index: true, foreign_key: true
      t.string :type
      t.string :size
      t.string :accessories
      t.string :title
      t.text :description
      t.integer :price_hour
      t.integer :price_day
      t.integer :price_week
      t.integer :price_month
      t.integer :price_year
      t.string :country
      t.string :city
      t.string :address
      t.string :zipcode
      t.string :state

      t.timestamps null: false
    end
  end
end
