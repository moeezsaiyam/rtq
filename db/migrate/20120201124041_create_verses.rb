class CreateVerses < ActiveRecord::Migration
  def self.up
    create_table :verses do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :verses
  end
end
