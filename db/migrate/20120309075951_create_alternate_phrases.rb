class CreateAlternatePhrases < ActiveRecord::Migration
  def self.up
    create_table :alternate_phrases do |t|
      t.string :content
      t.timestamps
    end
  end

  def self.down
    drop_table :alternate_phrases
  end
end
