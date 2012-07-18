class VerseController < ApplicationController

  def single_verse
   question_id = params[:prev].split("/").last
   @question = Question.find(:first, :conditions => ['id = ? OR quest_slug = ?', question_id, question_id])
   @verse = Verse.find(params[:id])
   @prev_verses = @verse.previous_verses(3).reverse!
   @next_verses = @verse.next_verses(3)
   @translation = Translation.find_by_default(1) unless request.referrer.split("/").include?("verse_context")
    unless @translation.blank? && params[:trans].blank?
     trans = Translation.all.collect(&:table_nam).select {|t| cookies[t] == 'true'}
     trans = [@translation.table_nam] if trans.blank?
     @trans_verses = Hash.new
       trans.each do|t|
       @trans_name = Translation.find_by_table_nam(t)
       name = @trans_name.name
        if @trans_verses.has_key?(@verse.id)
          @trans_verses[@verse.id] = [ @trans_verses[@verse.id],'<h4>'+name + '<br>'+"</h4><div class='#{name}'>", @verse.translate_to_by(t)[0].text+'</div><br><br>']
        end
        @trans_verses[@verse.id] = ['<h4>'+name + '<br>'+'</h4><div class="#{name}">',@verse.translate_to_by(t)[0].text+'</div><br><br>'] unless @trans_verses.has_key?(@verse.id)
          @prev_verses.each do|v|
            if @trans_verses.has_key?(v.id)
            @trans_verses[v.id] = [ @trans_verses[v.id],'<h4>'+name + '<br>'+"</h4><div class='#{name}'>", v.translate_to_by(t)[0].text + '</div><br><br>']
            end
          @trans_verses[v.id] = ['<h4>'+name + '<br>'+"</h4><div class='#{name}'>",v.translate_to_by(t)[0].text+ '</div><br><br>'] unless @trans_verses.has_key?(v.id)
          end
          @next_verses.each do|v|
            if @trans_verses.has_key?(v.id)
              @trans_verses[v.id] = [ @trans_verses[v.id],'<h4>'+ name + '<br>'+"</h4><div class='#{name}'>", v.translate_to_by(t)[0].text + '</div><br><br>']
            end
            @trans_verses[v.id] = ['<h4>'+ name + '<br>'+"</h4><div class='#{name}'>",v.translate_to_by(t)[0].text+'</div><br><br>'] unless @trans_verses.has_key?(v.id)
          end
      end
   end    
 end

  def show
   question_id = params[:prev].split("/").last
    @question = Question.find(:first, :conditions => ['id = ? OR quest_slug = ?', question_id, question_id])
    @verse = Verse.find(params[:range])
    @translation = Translation.find_by_default(1)
    return head(404) unless @verse
    @verses_range = Verse.from_to_verses(params[:id],params[:range])
    unless @translation.blank? && params[:translation_name].blank?

      Translation.all.each{|tr| cookies[tr.table_nam] = nil}
      cookies[params[:translation_name]] = 1
      trans = params[:translation_name]
      trans = @translation.table_nam if params[:translation_name].blank?
      @trans_verses = Hash.new
      @trans_name = Translation.find_by_table_nam(trans)
      name = @trans_name.name

      @verses_range.each do|v|
        @trans_verses[v.id] = [ @trans_verses[v.id],'<h4>'+name + '<br>'+"</h4><div class='#{name}'>", v.translate_to_by(trans)[0].text + '</div><br><br>'] if @trans_verses.has_key?(v.id)
        @trans_verses[v.id] = ['<h4>'+name + '<br>'+"</h4><div class='#{name}'>",v.translate_to_by(trans)[0].text + '</div><br><br>'] unless @trans_verses.has_key?(v.id)
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
