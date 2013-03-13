class AddUrlToImages < ActiveRecord::Migration
  def self.up
    add_column :images, :url, :text
  end

  def self.down
    remove_column :images, :url
  end
end
