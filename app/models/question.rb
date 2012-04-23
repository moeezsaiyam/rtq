class Question < ActiveRecord::Base

  belongs_to :sub_topic
  
  after_save :save_tasks

  after_create :quest_to_slug
  
  has_many :alternate_phrases
  
  has_many :references

  define_index do
    indexes quest
    indexes answer
  end

  named_scope :popular, :order => 'view_count DESC'
  named_scope :limited, :limit => 6

  validates_presence_of :quest,:answer

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
    self.update_attributes(:quest_slug => [self.quest[0..50].to_slug.downcase,self.id].join("-"))
  end

  def self.perform_search(search, search_terms)
    
  end

  def alternate_phrase_attributes=(new_phrase_attributes)
    new_phrase_attributes.each do |new_phrase_attribute|
     if new_phrase_attribute[:id].blank?
      self.alternate_phrases.build(new_phrase_attribute)
     else
       alternate = self.alternate_phrases.detect{ |t| t.id.to_s == new_phrase_attribute['id']}
       alternate.attributes = new_phrase_attribute
     end
    end
  end
  
  def reference_attributes=(new_reference_attributes)
    new_reference_attributes.each do |new_reference_attribute|
     if new_reference_attribute[:id].blank?
      self.references.build(new_reference_attribute)
     else
       reference = self.references.detect{ |t| t.id.to_s == new_reference_attribute['id']}
       reference.attributes = new_reference_attribute
     end
    end
  end
  
  def save_tasks
   alternate_phrases.each do|phrase|
   phrase.save(false)
   end
   references.each do|reference|
   reference.save(false)
   end
 end
end
