module QuestionsHelper

  def bread_crumb_question(question)
    html = "<div class='bread-crumb'> <a href='/'> Home </a> <span> >> </span>  <a href='/#{question.sub_topic.topic.name_slug}'> #{question.sub_topic.topic.name} </a> <span> >> </span> <a href='/#{question.sub_topic.topic.name_slug}/#{question.sub_topic.name_slug}'> #{question.sub_topic.name} </a> </div>"
    return html
  end
  
  def bread_crumb_questions(question)
    html = "<div class='bread-crumb'> <a href='/'> Home </a> <span> >> </span>  <a href='/#{question.sub_topic.topic.name_slug}'> #{question.sub_topic.topic.name} </a> <span> >> </span> <a href='/#{question.sub_topic.topic.name_slug}/#{question.sub_topic.name_slug}'> #{question.sub_topic.name} </a></div>"
    return html
  end
end
  
 
