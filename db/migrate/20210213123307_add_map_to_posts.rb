class AddMapToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :lutitude, :float
    add_column :posts, :longitude, :float
  end
end
