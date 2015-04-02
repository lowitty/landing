class CreateMailinfos < ActiveRecord::Migration
  def change
    create_table :mailinfos do |t|
      t.string :email

      t.timestamps null: false
    end
  end
end
