class ChangeDuasToQuranicsResourcesStaticContentTable < ActiveRecord::Migration
  def self.up
    rename_column :static_contents, :duas, :quranic_resources
  end

  def self.down
    rename_column :static_contents, :quranic_resources, :duas
  end
end
