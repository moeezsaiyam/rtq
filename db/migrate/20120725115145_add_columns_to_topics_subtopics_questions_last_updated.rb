class AddColumnsToTopicsSubtopicsQuestionsLastUpdated < ActiveRecord::Migration
  def self.up
    add_column :topics, :last_updated_by, :string
    add_column :sub_topics, :last_updated_by, :string
    add_column :questions, :last_updated_by, :string
  end

  def self.down
    remove_column :topics, :last_updated_by
    remove_column :sub_topics, :last_updated_by
    remove_column :questions, :last_updated_by
  end
end
