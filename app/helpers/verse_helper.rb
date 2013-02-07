module VerseHelper

 def bread_crumb_verse(question)
     html = "<div class='bread-crumb'> <a href='/'> Home </a> <span> >> </span>  <a href='/#{question.sub_topic.topic.name_slug}'> #{question.sub_topic.topic.name} </a> <span> >> </span>  <a href='/#{question.sub_topic.topic.name_slug}/#{question.sub_topic.name_slug}'> #{question.sub_topic.name} </a></div>"
  end
 def bread_crumb_context(question)
    html = "<div class='bread-crumb'> <a href='/'> Home </a><span> >> </span>  <a href='/#{question.sub_topic.topic.name_slug}'> #{question.sub_topic.topic.name} </a> <span> >> </span> <a href='/#{question.sub_topic.topic.name_slug}/#{question.sub_topic.name_slug}'> #{question.sub_topic.name} </a> </div>"
 end
  def verse_list_class(index,count)
    return "verse-last" if index == count
    "verse-context-color"
  end

   def verses_list_class(index,count)
   return "verses-last" if index == count || index == 10
   end

   def sub_topic_list_class(question)
   return "verses-last" if question.blank?
   end

  def formatted_verses_with_link(verses, translated_verses)
    content_tag :div, :class => "verse-background-pr-post" do
      get_content(verses, translated_verses, :link => true)
    end
  end

  def formatted_verses(verses, translated_verses)
    content_tag :div, :class => "verse-background-pr-post " do
      get_content(verses, translated_verses)
    end
  end

  def get_content(verses, translated_verses, opts = {})
    content = []
    verses.each_with_index do |v,i|
      content << numbered_verse_content(v)
      content  << clear_div
      content << verse_translation(v, translated_verses) if opts[:link].blank?
      content << verse_translation_with_link(v, translated_verses) unless opts[:link].blank?
      content  << verse_text(v)
      content << separator_div if verses.count-1 > i
      content  << clear_div
    end
    content
  end

  def numbered_verse_content(verse)
    content_tag :div, :class => "numbered-verse" do
      numbered_verse(verse)
    end
  end

  def clear_div()
    content_tag :div, :class => "clear" do
    end
  end


  def numbered_verse(verse)
    content_tag :div, :class => "show-verse-number-questionpage" do
      [verse.sura,verse.aya].join(' : ')
    end
  end

  def verse_text(verse)
    content_tag :div, :class => "arabic-post-pr-verse verse-margin",:dir => "rtl" do
      verse.text
    end
  end

  def verse_translation(verse, translated_verses)
    content_tag :div, :class => "verse-color " do
      [translated_verse_name_author(translated_verses[verse.id][:name],translated_verses[verse.id][:author]), translated_verse_translation(translated_verses[verse.id][:name], translated_verses[verse.id][:translation])].join
    end
  end

  def verse_translation_with_link(verse, translated_verses)
    translation = []
    translation << translated_verse_name_author(translated_verses[verse.id][:name],translated_verses[verse.id][:author])
    translation << translated_verse_translation(translated_verses[verse.id][:name], translated_verses[verse.id][:translation])
    translation << link_to("View Context", {:controller => "verse", :action => "single_verse", :id => verse.id, :prev => request.url} , { :class => 'show-verse-search'})
    content_tag :div, :class => "verse-color" do
      translation
    end
  end


  def translated_verse_name_author(name,author)
    content_tag :h4 do
      [name,author].join(':')
    end
  end

  def translated_verse_name(name)
    content_tag :h4 do
      name
    end
  end

  def translated_verse_translation(name, translation)
    content_tag :div, :class => name do
      translation
    end
  end

  def separator_div
    content_tag :div, :class => "separator-width" do
    end
  end

end
