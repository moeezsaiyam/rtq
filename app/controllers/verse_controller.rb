class VerseController < ApplicationController

  def show
   @verse = Verse.find(params[:range])
    #return head(404) unless @verse
    unless params[:language].blank?
      ##@translation = @verse.translate_to(params[:language][:name])
    end
     @verses_range = Verse.from_to_verses(params[:id],params[:range])
     #@prev_verses = @verse.previous_verses(3).reverse!
     #@next_verses = @verse.next_verses(3)
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
