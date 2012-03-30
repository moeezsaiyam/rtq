module VerseHelper
 
 def bread_crumb_verse(question)
     html = "<div class='bread-crumb'> <a href='/'> Home </a> > <a href='/#{question.sub_topic.topic.name_slug}'> #{question.sub_topic.topic.name} </a> > <a href='/#{question.sub_topic.topic.name_slug}/#{question.sub_topic.name_slug}'> #{question.sub_topic.name} </a> > #{question.quest} > Verses </div>"
  end
 def bread_crumb_context(question)
    html = "<div class='bread-crumb'> <a href='/'> Home </a> > <a href='/#{question.sub_topic.topic.name_slug}'> #{question.sub_topic.topic.name} </a> > <a href='/#{question.sub_topic.topic.name_slug}/#{question.sub_topic.name_slug}'> #{question.sub_topic.name} </a> > #{question.quest} > Verses > Context </div>"
 end
end
