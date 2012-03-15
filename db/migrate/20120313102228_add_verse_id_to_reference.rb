class AddVerseIdToReference < ActiveRecord::Migration
  def self.up
   add_column :references, :verse_ids, :string
  end

  def self.down
   remove_column :references, :verse_ids, :string
  end
end
