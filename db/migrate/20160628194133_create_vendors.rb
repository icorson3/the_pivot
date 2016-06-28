  class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.string :name
      t.text :description
      t.string :city
      t.string :state
      t.string :status
      t.string :slug

      t.timestamps null: false
    end
  end
end
