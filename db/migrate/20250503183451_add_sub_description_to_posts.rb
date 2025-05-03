class AddSubDescriptionToPosts < ActiveRecord::Migration[8.0]
  def change
    add_column :posts, :sub_title, :text
  end
end
