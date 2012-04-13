module SubTopicsHelper

  def bread_crumb_sub_topic(sub_topic)
    html = "<div class='bread-crumb'> <a href='/'> Home </a> <span> >> </span>  <a href='/#{sub_topic.topic.name_slug}'> #{sub_topic.topic.name} </a><span> >> </span>  <a href='/#{sub_topic.topic.name_slug}/#{sub_topic.name_slug}'> #{sub_topic.name} </a></div>"
    return html
  end
  def bread_crumb_pop()
    html ="<div class='bread-crumb'> <a href='/'> Home </a></div>"
    return html
  end
end
