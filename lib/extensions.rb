class String
  def words
    self.split(/\s+/)
  end

  def urlize
    self.strip.downcase.gsub(/[^a-z]+/, '_')
  end

  def shortize
    self.words.first.downcase
  end

  def to_slug
    ret = self.strip
    ret.gsub! /['`]/,""
    ret.gsub! /\s*@\s*/, " at "
    ret.gsub! /\s*&\s*/, " and "
    ret.gsub! /\s*\.\s*/, " dot "
    ret.gsub! /\s*\#\s*/, " hash "
    ret.gsub! /\s*\+\s*/, " plus "
    ret.gsub! /\s*[^A-Za-z0-9\.\-]\s*/, '-'
    ret.gsub! /-+/,"-"
    ret.gsub! /\A[-\.]+|[-\.]+\z/,""

    {'c-hash' => 'c-sharp',
     '802-dot-11' => '802-point-11',
    }[ret] || ret
  end
end
