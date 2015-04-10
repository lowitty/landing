class AddColumnsToMailinfos < ActiveRecord::Migration
  def change
    add_column :mailinfos, :question, :string
    add_column :mailinfos, :company, :string
    add_column :mailinfos, :role, :string
  end
end
