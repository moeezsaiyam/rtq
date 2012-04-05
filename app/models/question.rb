class Question < ActiveRecord::Base

  belongs_to :sub_topic

  after_create :quest_to_slug
  
  has_many :alternate_phrases
  
  has_many :references

  define_index do
    indexes quest
    indexes answer
  end

  named_scope :popular, :order => 'view_count DESC'
  named_scope :limited, :limit => 6

  validates_presence_of :quest

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

  def self.perform_search(search, search_terms)
    
  end

  def alternate_phrase_attributes=(new_phrase_attributes)
    new_phrase_attributes.each do |new_phrase_attribute|
      self.alternate_phrases.build(new_phrase_attribute)
    end
  end
  
  def reference_attributes=(new_reference_attributes)
    new_reference_attributes.each do |new_reference_attribute|
      self.references.build(new_reference_attribute)
    end
  end

end
