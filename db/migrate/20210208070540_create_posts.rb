class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :user_id, null: false
      t.string :title, null: false
      t.integer :prefecture, null: false
      t.string :address, null: false
      t.text :description, null: false

      t.timestamps
    end
  end
end
