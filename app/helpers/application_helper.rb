# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def parse_tags(question)
    unless question.verse_ids.blank?
      html = Array.new
      verses_ids = question.verse_ids.split(",")
      tags = question.tags.split(",")
      verses_ids.each_with_index do |id,i|
        html.push("<a href='/verse/#{id}?prev=#{request.fullpath}'>Sura # #{tags[i].split(':')[0]}: Aya # #{tags[i].split(':')[1]}</a>")
      end
      html = html.join(" , ")
    end
  end

  def prev_aya(verse)
    id = verse.id-1
    return html = "<div class='left'><a href='/verse/#{id}'>Previous</a></div>" if id > 0
  end

  def nxt_aya(verse)
    id = verse.id+1
    return html = "<div class='right'><a href='/verse/#{id}'>Next</a></div>" if id < 6237
  end

  def addthis_widget
    addthis_html='
    <!-- AddThis Button BEGIN -->
    <a class="addthis_button right" href="http://www.addthis.com/bookmark.php?v=250&amp;pubid=xa-4f3ce9187e4e7a58"><img src="http://s7.addthis.com/static/btn/v2/lg-share-en.gif" width="150" height="16" alt="Bookmark and Share" style="border:0"/></a>
    <script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#pubid=xa-4f3ce9187e4e7a58"></script>
    <!-- AddThis Button END -->
    <div class="clear"></div>'
    return addthis_html
  end

  def list_topics
    topics = Topic.all
    html = ""
    topics.each do |topic|
      unless params[:topic_name_slug].blank?
        html = html + "<li><a href='/#{topic.name_slug}' class='slected'>#{topic.name}</a></li>" if params[:topic_name_slug] == topic.name_slug
        html = html + "<li><a href='/#{topic.name_slug}'>#{topic.name}</a></li>" unless params[:topic_name_slug] == topic.name_slug
      else
        unless params[:topic_id].blank?
          html = html + "<li><a href='/#{topic.name_slug}' class='slected'>#{topic.name}</a></li>" if params[:topic_id].to_i == topic.id
          html = html + "<li><a href='/#{topic.name_slug}'>#{topic.name}</a></li>" unless params[:topic_id].to_i == topic.id
        else
          html = html + "<li><a href='/#{topic.name_slug}'>#{topic.name}</a></li>"
        end
      end
    end
    return html
  end

end
