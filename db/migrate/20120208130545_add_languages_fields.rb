class AddLanguagesFields < ActiveRecord::Migration
  def self.up
    add_column :languages, :lang, :string
    add_column :languages, :name, :string
  end

  def self.down
    remove_column :languages, :name
    remove_column :languages, :lang
  end
end
