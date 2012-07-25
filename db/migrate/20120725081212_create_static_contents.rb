class CreateStaticContents < ActiveRecord::Migration
  def self.up
    create_table :static_contents do |t|
      t.text :about
      t.text :duas
      t.text :faqs
      t.text :credits
      t.text :contact

      t.timestamps
    end
  end

  def self.down
    drop_table :static_contents
  end
end
