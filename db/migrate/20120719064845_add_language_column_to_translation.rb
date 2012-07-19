class AddLanguageColumnToTranslation < ActiveRecord::Migration
  def self.up
    add_column :translations, :language, :string, :default => "English"
  end

  def self.down
    remove_column :translations, :language
  end
end
