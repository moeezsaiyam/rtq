module VerseHelper
 
 def bread_crumb_verse(question)
     html = "<div class='bread-crumb'> <a href='/'> Home </a> > <a href='/#{question.sub_topic.topic.name_slug}'> #{question.sub_topic.topic.name} </a> > <a href='/#{question.sub_topic.topic.name_slug}/#{question.sub_topic.name_slug}'> #{question.sub_topic.name} </a></div>"
  end
 def bread_crumb_context(question)
    html = "<div class='bread-crumb'> <a href='/'> Home </a> > <a href='/#{question.sub_topic.topic.name_slug}'> #{question.sub_topic.topic.name} </a> > <a href='/#{question.sub_topic.topic.name_slug}/#{question.sub_topic.name_slug}'> #{question.sub_topic.name} </a> </div>"
 end
  def verse_list_class(index,count)
  puts "/////////////////////"
  puts index.inspect
  puts count.inspect
    return "verse-last" if index == count
    "verse-color"
  end
end
