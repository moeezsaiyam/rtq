class Reference < ActiveRecord::Base
belongs_to :question

validates_presence_of:issue,:from,:to

  def validate
    
    unless self.from.blank?
      record_tags = Array.new
      tags = self.from.split(",")
      tags.each do |tag|
      sura=tag.split(":")[0]
      aya=tag.split(":")[1]
      verse = Verse.find_by_sura_and_aya(sura,aya)
      return errors.add(:tags,"No Such reference exist") if verse.blank?
      record_tags.push(verse.id)
      end
      self.verse_ids = record_tags.join(",")
    end
    unless self.to.blank?
      record_tags = Array.new
      tags = self.to.split(",")
      tags.each do |tag|
      sura=tag.split(":")[0]
      aya=tag.split(":")[1]
      verse = Verse.find_by_sura_and_aya(sura,aya)
      return errors.add(:tags,"No Such reference exist") if verse.blank?
      record_tags.push(verse.id)
      end
      self.verse_ids_to = record_tags.join(",")
    end
  end
end
