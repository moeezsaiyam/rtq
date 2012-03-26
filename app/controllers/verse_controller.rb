class VerseController < ApplicationController

  def single_verse
   @verse = Verse.find(params[:id])
   @prev_verses = @verse.previous_verses(3).reverse!
   @next_verses = @verse.next_verses(3)
   @translation = Translation.find_by_default(1)
   if params[:trans]
     trans = params[:trans]
   end
   if trans.blank?
     trans = [@translation.table_nam]
   end
     @trans_verses = Hash.new
     trans.each do|t|
     @trans_name = Translation.find_by_table_nam(t)
     name = @trans_name.name
   if @trans_verses.has_key?(@verse.id)
     @trans_verses[@verse.id] = [ @trans_verses[@verse.id],name + '<br>', @verse.translate_to_by(t)[0].text + '<br>']
   end
     @trans_verses[@verse.id] = [name + '<br>',@verse.translate_to_by(t)[0].text + '<br>'] unless @trans_verses.has_key?(@verse.id)
     @prev_verses.each do|v|
      if @trans_verses.has_key?(v.id)
     @trans_verses[v.id] = [ @trans_verses[v.id],name + '<br>', v.translate_to_by(t)[0].text + '<br>']
      end
     @trans_verses[v.id] = [name + '<br>',v.translate_to_by(t)[0].text + '<br>'] unless @trans_verses.has_key?(v.id)
     end
     @next_verses.each do|v|
      if @trans_verses.has_key?(v.id)
        @trans_verses[v.id] = [ @trans_verses[v.id],name + '<br>', v.translate_to_by(t)[0].text + '<br>']
      end
          @trans_verses[v.id] = [name + '<br>',v.translate_to_by(t)[0].text + '<br>'] unless @trans_verses.has_key?(v.id)
        end
      end 
      
   
  end
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
      @trans_name = Translation.find_by_table_nam(t)
      name = @trans_name.name
        @verses_range.each do|v|
          if @trans_verses.has_key?(v.id)
            @trans_verses[v.id] = [ @trans_verses[v.id],name + '<br>', v.translate_to_by(t)[0].text + '<br>']
          end
          @trans_verses[v.id] = [name + '<br>',v.translate_to_by(t)[0].text + '<br>'] unless @trans_verses.has_key?(v.id)
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
  end
