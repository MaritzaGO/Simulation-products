class CreateBuyers < ActiveRecord::Migration
  def change
    create_table :buyers do |t|
      t.string :name
      t.string :lastname
      t.string :identification
      t.integer :edad
      t.string :profesion

      t.timestamps null: false
    end
  end
end
