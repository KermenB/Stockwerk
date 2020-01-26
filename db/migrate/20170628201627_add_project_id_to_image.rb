class AddProjectIdToImage < ActiveRecord::Migration[5.0]
  def change
    add_column :images, :main_project_id, :integer
  end
end
