class AddPosition < ActiveRecord::Migration
  def self.up
    add_column :sub_topics, :position, :integer, :default => 0
  end

  def self.down
    remove_column :sub_topics, :position
  end
end
