module TopicsHelper

  def bread_crumb(topic)
    html ="<div class='bread-crumb'> <a href='/'> Home </a> > <a href='/#{topic.name_slug}'> #{topic.name} </a></div>"
    return html
  end
end
