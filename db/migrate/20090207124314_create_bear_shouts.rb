class CreateBearShouts < ActiveRecord::Migration
  def self.up
    create_table :bear_shouts do |t|
      t.string :name
      t.text :content
      t.date :date_added
      t.integer :rating

      t.timestamps
    end
  end

  def self.down
    drop_table :bear_shouts
  end
end
