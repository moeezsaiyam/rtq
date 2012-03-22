class CreateTranslations < ActiveRecord::Migration
  def self.up
    create_table :translations do |t|
    t.integer :id 
    t.string :name
    t.string :table_nam
    t.boolean :default, :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :translations
  end
end
