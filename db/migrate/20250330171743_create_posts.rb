class CreatePosts < ActiveRecord::Migration[8.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.string :client
      t.string :release_year
      t.string :status
      t.boolean :private_post, default: false
      t.integer :display_order

      t.timestamps
    end
  end
end
