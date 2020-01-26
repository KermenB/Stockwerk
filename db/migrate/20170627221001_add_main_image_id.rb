class AddMainImageId < ActiveRecord::Migration[5.0]
  def change
     add_column :projects, :main_image_id, :integer
  end
end
