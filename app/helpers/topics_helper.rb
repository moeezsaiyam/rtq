module TopicsHelper

  def bread_crumb(topic)
    html ="<div class='bread-crumb'> <a href='/'> Home </a> <span> >> </span> <a href='/#{topic.name_slug}'> #{topic.name} </a></div>"
    return html
  end
  
  def questions_subject_class(index,count)
    return "last" if index == count
  end
end
