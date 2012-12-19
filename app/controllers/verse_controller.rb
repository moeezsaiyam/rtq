class VerseController < ApplicationController

  def single_verse

    question_id = params[:prev].split("/").last
    @question = Question.find(:first, :conditions => ['id = ? OR quest_slug = ?', question_id, question_id])
    @verse = Verse.find(params[:id])
    @prev_verses = @verse.previous_verses(3).reverse!
    @next_verses = @verse.next_verses(3)
    @translation = Translation.get_translation(cookies, params)
    cookies['translation_name'] = @translation.table_nam
    return if @translation.blank?

    @trans_verses = Hash.new
    @trans_verses[@verse.id] = {:name => @translation.language, :translation => @verse.translate_to_by(@translation.table_nam)[0].text, :author => @translation.name }

    @prev_verses.each do|v|
      @trans_verses[v.id] = {:name => @translation.language, :translation => v.translate_to_by(@translation.table_nam)[0].text, :author => @translation.name }
    end

    @next_verses.each do|v|
      @trans_verses[v.id] = {:name => @translation.language, :translation => v.translate_to_by(@translation.table_nam)[0].text, :author => @translation.name }
    end
  end

  def show
    question_id = params[:prev].split("/").last
    @question = Question.find(:first, :conditions => ['id = ? OR quest_slug = ?', question_id, question_id])
    @verse = Verse.find(params[:range])
    @translation = Translation.find_by_default(1)
    return head(404) unless @verse
    @verses_range = Verse.from_to_verses(params[:id],params[:range])
    @translation=Translation.get_translation(cookies, params)
    puts @translation.inspect
    cookies['translation_name'] = @translation.table_nam

    @trans_verses = Hash.new
    @verses_range.each do|v|
      @trans_verses[v.id] = {:name => @translation.language, :translation => v.translate_to_by(@translation.table_nam)[0].text, :author => @translation.name }
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
