class AddMainImgContentTypeToProject < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :main_img_cont_type, :string
  end
end
