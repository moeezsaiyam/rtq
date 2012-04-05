module HomeHelper
  def bread_crumb_search()
    html ="<div class='bread-crumb'> <a href='/'> Home </a>  </div> "
    return html
  end
  def questions_list_class(index,count)
    return "last" if index == count
  end
end

