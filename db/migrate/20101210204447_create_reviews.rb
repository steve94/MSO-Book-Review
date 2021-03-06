class CreateReviews < ActiveRecord::Migration
  def self.up
    create_table :reviews do |t|
      t.string :user
      t.string :title
      t.text :body
      t.integer :rating
      t.integer :book_id

      t.timestamps
    end
  end

  def self.down
    drop_table :reviews
  end
end
