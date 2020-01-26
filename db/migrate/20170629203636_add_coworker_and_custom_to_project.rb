class AddCoworkerAndCustomToProject < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :coworker, :string
    add_column :projects, :custom1, :string
    add_column :projects, :custom2, :string
    add_column :projects, :custom3, :string
    add_column :projects, :custom4, :string
  end
end
