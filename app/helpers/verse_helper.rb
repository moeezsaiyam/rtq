module VerseHelper
 
 def bread_crumb_verse(question)
     html = "<div class='bread-crumb'> <a href='/'> Home </a> > <a href='/#{question.sub_topic.topic.name_slug}'> #{question.sub_topic.topic.name} </a> > <a href='/#{question.sub_topic.topic.name_slug}/#{question.sub_topic.name_slug}'> #{question.sub_topic.name} </a></div>"
  end
 def bread_crumb_context(question)
    html = "<div class='bread-crumb'> <a href='/'> Home </a> > <a href='/#{question.sub_topic.topic.name_slug}'> #{question.sub_topic.topic.name} </a> > <a href='/#{question.sub_topic.topic.name_slug}/#{question.sub_topic.name_slug}'> #{question.sub_topic.name} </a> </div>"
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
end
