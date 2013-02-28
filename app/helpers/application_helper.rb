# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def parse_tags(q_from,q_to,q)
    unless q.verse_ids.blank?
      html = Array.new
      verses_ids = q.verse_ids.split(",")
      verses_ids_to = q.verse_ids_to.split(",")
      @tags = q_from.split(":")
      @tags1 = q_to.split(":")
      verses_ids_to.each_with_index do |id_to,ii|
       verses_ids.each_with_index do |id,i|
        if @tags[0] == @tags1[0] and @tags[1] == @tags1[1]
          html.push("<a href='/verse/#{id}/#{id_to}?prev=#{request.fullpath}'> #{@tags[0]} : #{@tags[1]}</a>")
        else
          html.push("<a href='/verse/#{id}/#{id_to}?prev=#{request.fullpath}'> #{@tags[0]} : #{@tags[1]} - #{@tags1[0]} : #{@tags1[1]}</a>")
        end
      end
       end
      html = html.join(" , ")
    end
  end

  def previous_link(name)
    return unless params[:prev]
    content_tag :div, :class => "prev-link" do
      link_to("&lt;&lt; Back to #{name}", params[:prev])
    end
  end

  def parse_tags_detail(q_from,q_to,q)
    unless q.verse_ids.blank?
      html = Array.new
      verses_ids = q.verse_ids.split(",")
      verses_ids_to = q.verse_ids_to.split(",")
      @tags = q_from.split(":")
      @tags1 = q_to.split(":")
      verses_ids_to.each_with_index do |id_to,ii|
        verses_ids.each_with_index do |id,i|
          html.push("<a href='/verse/#{id}/#{id_to}?prev=#{request.fullpath}'> Read more</a>")
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
    </div>
    <script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#pubid=xa-4f4df9774ac48f5f"></script>
     <!-- AddThis Button END -->
     <div class="clear"></div>'
     return addthis_html
  end

  def addthis_medium_button
    addthis_html='
    <!-- AddThis Button BEGIN -->
    <div class="addthis_toolbox addthis_default_style ">
      <a class="addthis_button_facebook"></a>
      <a class="addthis_button_twitter"></a>
      <a class="addthis_button_email"></a>
      <a class="addthis_button_compact"></a>
    </div>
    <script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#pubid=xa-5017a6c4134c73b4"></script>
    <!-- AddThis Button END -->'
     return addthis_html
  end

  def twitter_adventure_sharer
    target_url = request.url

    link_to(image_tag("twt.png", :width => "32", :height => "32"), "#",:class => "social")
     end

   def popup_window_sharer
    target_url = request.url
    link_to(image_tag("fb.png", :width => "32", :height => "32", :alt => "facebook"), "#", :target => "_blank",:class => "social")
    end

   def rss_window_sharer
    target_url = request.url
    link_to(image_tag("rss.png", :width => "32", :height => "32", :alt => "facebook"), "#", :target => "_blank",:class => "social")
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

  def twitter_sharer
  target_url = request.url
    url = "https://twitter.com"
    link_to(image_tag("twt.png", :width => "32", :height => "32", :alt=>"Twiter"),  "http://www.twitter.com", :target => "_blank",:class => "social")
     end

   def popup_window_sharer
     html= "<a class='goog2 google-bg' displayText='Google +' href='#'></a>
            <a class='goog2' displayText='Facebook'></a>
            <a class='goog2' displayText='Tweet'></a>
           "
   end

   def rss_window_sharer_footer
   target_url = request.url
    link_to(image_tag("rss.png", :width => "32", :height => "32", :alt => "facebook"), "http://www.facebook.com/sharer/sharer.php?u=#{target_url}", :target => "_blank",:class => "social")
   end


  def list_topics
    topics = Topic.ordered.all
  end

  def nomargin_class(index)
    return "nomargin" if index.odd?
  end
  def menu_class()
  return 'last'
  end
  def sub_item_lastitem()
  return 'lastitem'
  end
  def home_class()
  return 'home_padding'
  end
  def sub_items_class()
  return 'sub_item'
  end

  def display_topics
    search_select("search_topic", Topic.ordered.all, "All Topics")
  end

 def display_subtopics
    search_select("search_sub_topic", SubTopic.all, "All Sub Topics")
  end

  def display_subtopics_in_searchbar
    search_select("search_sub_topic", @subtopics, "All Sub Topics")
  end

  def search_select(name, collection, blank_message)
    select("search_terms", name, collection.collect {|t| [ t.name, t.id ] }, { :include_blank => blank_message } ,:class => "list")
  end

  def display_errors(object)
   return "Error" unless object.errors.count > 1
   return "Errors"
  end

  def display_description(description)
    description.gsub('<p>',' ').gsub('</p>','<br />')
    description.gsub('<br>','')
  end

  def edit_link(name)
    link_to('Edit',:class => "editlink-margin", :controller => 'main', :action => 'edit_content', :name => name)
  end

  def description_edit_link(name,id)
    link_to('Edit', edit_description_topic_path(Topic.find(id)),:class => "editlink-margin")
  end

  def get_keywords(description)
    @description = strip_tags(description)
    @description = @description.gsub('.\r','')
    @description = @description.gsub('r','')
    words = English.extract_keywords(@description)
    @words = words.join(',')
  end

  def more_link
    link_to 'More', '#', :id => 'more', :onclick => "return toggleMe('full-text','truncated','more','less')"
  end

  def less_link
    link_to 'Less', '#', :id => 'less', :onclick => "return toggleMe('full-text','truncated','more','less')"
  end

  def display_full_text(description)
    description.gsub('<p>',' ').gsub('</p>','<br />')
    description.gsub('<br>','')
  end
end

