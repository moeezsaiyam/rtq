class AddVerseIdInQuestions < ActiveRecord::Migration
  def self.up
    add_column :questions, :verse_ids, :string
  end

  def self.down
    remove_column :questions, :verse_ids
  end
end
