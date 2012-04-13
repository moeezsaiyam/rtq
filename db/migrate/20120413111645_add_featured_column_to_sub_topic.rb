class AddFeaturedColumnToSubTopic < ActiveRecord::Migration
  def self.up
  add_column :sub_topics, :featured, :boolean
  end

  def self.down
   remove_column :sub_topics, :featured, :boolean
  end
end
