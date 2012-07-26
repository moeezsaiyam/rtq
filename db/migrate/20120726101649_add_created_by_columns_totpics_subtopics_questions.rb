class AddCreatedByColumnsTotpicsSubtopicsQuestions < ActiveRecord::Migration
  def self.up
    add_column :topics, :created_by, :string
    add_column :sub_topics, :created_by, :string
    add_column :questions, :created_by, :string
  end

  def self.down
    remove_column :topics, :created_by
    remove_column :sub_topics, :created_by
    remove_column :questions, :created_by
  end
end
