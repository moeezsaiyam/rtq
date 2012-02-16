class MeaningOfTopic < ActiveRecord::Migration
  def self.up
    add_column :topics, :meaning, :string
  end

  def self.down
    remove_column :topics, :meaning
  end
end
