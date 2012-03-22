class VerseController < ApplicationController

  def show
    @verse = Verse.find(params[:range])
    @translation = Translation.find_by_default(1)
    return head(404) unless @verse
     @verses_range = Verse.from_to_verses(params[:id],params[:range])
     if params[:trans]
     trans = params[:trans]
     end
     if trans.blank?
      trans = [@translation.table_nam]
     end
     @trans_verses = Hash.new
      trans.each do|t|
        @verses_range.each do|v|
          if @trans_verses.has_key?(v.id)
            @trans_verses[v.id] = [ @trans_verses[v.id],t.gsub("trans_","") +'<br>', v.translate_to_by(t)[0].text + '<br>']
          end
          @trans_verses[v.id] = [t.gsub("trans_","") +'<br>',v.translate_to_by(t)[0].text + '<br>'] unless @trans_verses.has_key?(v.id)
        end
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
  
  def get_trans_setting
  @translation = Translation.all
  end
  
end
