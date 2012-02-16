class QuestionSlug < ActiveRecord::Migration
  def self.up
    remove_column :questions, :answer
    add_column :questions, :answer, :text
    add_column :questions, :quest_slug, :string
  end

  def self.down
    remove_column :questions, :quest_slug
    remove_column :questions, :answer
    add_column :questions, :answer, :string
  end
end
