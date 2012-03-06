class Verse < ActiveRecord::Base

  set_table_name "quran_text"

  def translate_to(lang)
    translation = Verse.find_by_sql("Select text from #{lang}1_quran where sura = #{self.sura} AND aya = #{self.aya}")
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

  def previous_verse
    Verse.first :conditions => ["sura = ? AND aya = ?", self.sura, self.aya - 1]
  end

  def next_verse
    Verse.first :conditions => ["sura = ? AND aya = ?", self.sura, self.aya + 1]
  end
  
   def pre_previous_verse
    Verse.first :conditions => ["sura = ? AND aya = ?", self.sura, self.aya - 2]
  end
  
   def nex_next_verse
    Verse.first :conditions => ["sura = ? AND aya = ?", self.sura, self.aya + 2]
  end
end
