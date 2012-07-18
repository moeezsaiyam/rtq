class AddPositionColumnToTopicsTables < ActiveRecord::Migration
  def self.up
    add_column :topics, :position, :integer, :default => 0
  end

  def self.down
    remove_column :topics, :position
  end
end
