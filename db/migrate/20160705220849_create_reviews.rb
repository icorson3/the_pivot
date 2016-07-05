class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :author_name
      t.text :body
      t.references :vendor, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
