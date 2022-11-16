class CreateDogs < ActiveRecord::Migration[5.2]
  def change
    create_table :dogs do |t|
      t.string :name
      t.string :breeds
      t.string :sex
      t.integer :weight
      t.date :birthday

      t.timestamps
    end
  end
end
