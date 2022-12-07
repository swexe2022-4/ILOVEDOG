class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.string :country_of_origin
      t.string :target_age
      t.integer :grams
      t.integer :price
      t.string :category
      t.string :img

      t.timestamps
    end
  end
end
