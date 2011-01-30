class CreateBooks < ActiveRecord::Migration
  def self.up
    create_table :books do |t|
      t.string :title
      t.text :description
      t.date :published
      t.integer :author_id
      t.integer :publisher_id
      t.integer :genre_id
      t.integer :location_id

      t.timestamps
    end
  end

  def self.down
    drop_table :books
  end
end
