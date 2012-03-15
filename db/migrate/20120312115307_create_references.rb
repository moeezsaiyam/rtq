class CreateReferences < ActiveRecord::Migration
  def self.up
    create_table :references do |t|
    t.integer :question_id
    t.string :issue
    t.string :from
    t.string :to
    t.timestamps
    end
  end

  def self.down
    drop_table :references
  end
end
