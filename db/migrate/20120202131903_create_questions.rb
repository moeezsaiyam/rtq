class CreateQuestions < ActiveRecord::Migration
  def self.up
    create_table :questions do |t|
      t.string :quest
      t.string :answer
      t.string :tags
      t.integer :sub_topic_id

      t.timestamps
    end
  end

  def self.down
    drop_table :questions
  end
end
