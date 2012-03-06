class VerseController < ApplicationController

  def show
    @verse = Verse.find_by_id(params[:id]) if (!params[:id].blank?)
    return head(404) unless @verse
    unless params[:language].blank?
      ##@translation = @verse.translate_to(params[:language][:name])
    end

  end

  def get_context
    verse = Verse.find_by_id params[:verse_id]
    verse_ids = verse.context
       @verses = Array.new
      verse_ids.each do |id|
       @verses.push(Verse.find id)
    end
  end

end
