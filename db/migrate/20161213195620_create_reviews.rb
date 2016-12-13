class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.float :rating
      t.text  :text
      t.belongs_to :book, index: true
      t.timestamps null: false
    end
  end
end
