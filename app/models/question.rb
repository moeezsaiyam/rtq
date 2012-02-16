class Question < ActiveRecord::Base

  belongs_to :sub_topic

  after_create :quest_to_slug

  define_index do
    indexes quest
    indexes answer
  end

  def validate
    unless self.tags.blank?
      record_tags = Array.new
      tags = self.tags.split(",")
      tags.each do |tag|
        sura=tag.split(":")[0]
        aya=tag.split(":")[1]
        verse = Verse.find_by_sura_and_aya(sura,aya)
        return errors.add(:tags,"No Such reference exist") if verse.blank?
        record_tags.push(verse.id)
      end
      self.verse_ids = record_tags.join(",")
    end
  end

  def quest_to_slug
    self.update_attributes(:quest_slug => [self.quest[0..50].to_slug,self.id].join("-"))
  end

end
