class AddColumnsToProject < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :place, :string
    add_column :projects, :realization, :string
    add_column :projects, :investor, :string
    add_column :projects, :main_img_base64, :text
  end
end
