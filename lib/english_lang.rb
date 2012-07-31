class English

  def self.extract_keywords(text)
    `python #{Rails.root}/lib/term_extraction/extract_keywords.py #{text.inspect}`.to_s.split(',').collect(&:strip)
  end

end

