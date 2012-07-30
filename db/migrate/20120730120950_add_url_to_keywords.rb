class AddUrlToKeywords < ActiveRecord::Migration
  def self.up
    add_column :keywords, :url, :string
  end

  def self.down
    remove_column :keywords, :url,:string
  end
end
