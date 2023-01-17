class AddAvatarPathToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :avatar_path, :string
  end
end
