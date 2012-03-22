class Verse < ActiveRecord::Base
  has_many:translations

  set_table_name "quran_text"
   def translate_to(lang)
    translation = Verse.find_by_sql("Select text from #{lang}1_quran where sura = #{self.sura} AND aya = #{self.aya}")
    return translation unless translation.blank?
  end
  
  def translate_to_by(lang)
    translation = Verse.find_by_sql("Select text from #{lang} where sura = #{self.sura} AND aya = #{self.aya}")
    return translation unless translation.blank?
  end

  def context
    id = self.id
    ids = Array.new
    i = 3
    until i == 0
      ids.push(self.id-i) if self.id-i > 0
      i -= 1
    end
    ids.push(self.id)
    i = 1
    until i == 4
      ids.push(self.id+i) if self.id+i < 6237
      i += 1
    end
    return ids
  end

  def previous_verses(limit)
    Verse.find :all, :conditions => ["sura = ? AND aya < ?", self.sura, self.aya], :order => 'aya DESC', :limit => limit 
  end

  def next_verses(limit)
     Verse.find :all, :conditions => ["sura = ? AND aya > ?", self.sura, self.aya], :order => 'aya ASC', :limit => limit 
  end
  
  def self.from_to_verses(from,to)
    Verse.find :all, :conditions => ["id >= ? AND id <= ?", from.to_i, to.to_i]
  end
end
