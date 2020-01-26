class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.integer :project_id
      t.string :title
      t.text :base64
      t.integer :order

      t.timestamps
    end
  end
end
