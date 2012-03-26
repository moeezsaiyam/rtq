# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def parse_tags(q_from,q_to,q)
    unless q.verse_ids.blank?
      html = Array.new
      verses_ids = q.verse_ids.split(",")
      verses_ids_to = q.verse_ids_to.split(",")
      tags = q_from.split(":")
      tags1 = q_to.split(":")
      verses_ids_to.each_with_index do |id_to,ii|
       verses_ids.each_with_index do |id,i|
        html.push("<a href='/verse/#{id}/#{id_to}?prev=#{request.fullpath}'> #{tags[0]} : #{tags[1]} - #{tags1[0]} : #{tags1[1]}</a>")
      end
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
  def addthis_button
     addthis_html='
    <!-- AddThis Button BEGIN -->
    <div class="addthis_toolbox addthis_default_style ">
    <a class="addthis_button_preferred_1"></a>
    <a class="addthis_button_preferred_2"></a>
    <a class="addthis_button_preferred_3"></a>
    <a class="addthis_button_preferred_4"></a>
    <a class="addthis_button_compact"></a>
    <a class="addthis_counter addthis_bubble_style"></a>
    </div>
    <script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#pubid=xa-4f4df9774ac48f5f"></script>
     <!-- AddThis Button END -->
     <div class="clear"></div>'
     return addthis_html
  end
  
  def addthis_medium_button
     addthis_html='
     <div class="addthis_toolbox addthis_default_style addthis_32x32_style">
     <a class="addthis_button_preferred_1"></a>
     <a class="addthis_button_preferred_2"></a>
     <a class="addthis_button_preferred_3"></a>
     <a class="addthis_button_preferred_4"></a>
     <a class="addthis_button_compact"></a>
     <a class="addthis_counter addthis_bubble_style"></a>
     </div>
     <script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#pubid=xa-4f6b31ce48f3b3db"></script>
     <div class="clear"></div>'
     return addthis_html
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
  def nomargin_class(index)
    return "nomargin" if index.odd?
  end
end
