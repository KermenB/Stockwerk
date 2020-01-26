class AddContentTypeToImages < ActiveRecord::Migration[5.0]
  def change
    add_column :images, :content_type, :string
  end
end
