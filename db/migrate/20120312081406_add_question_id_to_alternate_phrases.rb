class AddQuestionIdToAlternatePhrases < ActiveRecord::Migration
  def self.up
  add_column :alternate_phrases, :question_id, :integer
  end

  def self.down
  remove_column :alternate_phrases, :question_id, :integer
  end
end
