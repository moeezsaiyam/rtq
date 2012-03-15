class AddVerseIdToInReferences < ActiveRecord::Migration
  def self.up
  add_column :references, :verse_ids_to, :string
  end

  def self.down
  remove_column :references, :verse_ids_to, :string
  end
end
