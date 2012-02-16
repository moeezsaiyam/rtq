class AddDescriptions < ActiveRecord::Migration
  def self.up
    add_column :topics, :description, :text
    add_column :sub_topics, :description, :text
  end

  def self.down
    remove_column :topics, :description
    remove_column :sub_topics, :description
  end
end
