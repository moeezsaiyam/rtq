class MainController < ApplicationController
  def about
  end

  def duas
  end

  def contact
  end

  def credit
  end

  def faqs
  end
  
  def trans_setting
  @translation = Translation.all
  end

  def get_subtopics
    topic = Topic.find_by_id params[:id]
    @subtopics = topic.blank?? SubTopic.all : topic.sub_topics
    render :layout => false
  end

end
