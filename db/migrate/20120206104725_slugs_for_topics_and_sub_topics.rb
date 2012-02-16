class SlugsForTopicsAndSubTopics < ActiveRecord::Migration
  def self.up
    add_column :topics, :name_slug, :string
    add_column :sub_topics, :name_slug, :string
  end

  def self.down
    remove_column :topics, :name_slug
    remove_column :sub_topics, :name_slug
  end
end
