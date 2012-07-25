class MainController < ApplicationController

  before_filter :get_static_content, :only => [:about, :duas, :contact, :credit, :faqs, :edit_content]

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

  def edit_content
    session[:location] = request.referer
  end

  def trans_setting
    @translation = Translation.all
  end

  def get_subtopics
    topic = Topic.find_by_id params[:id]
    @subtopics = topic.blank?? SubTopic.all : topic.sub_topics.ordered
    render :layout => false
  end

  def update_content
    @static_content = StaticContent.first
    params[:static_contents].each do |key, value|
      @static_content.update_attribute(key, value)
    end
    @static_content.save
    path = session[:location]
    session[:location] = nil
    redirect_to path
  end

  private

  def get_static_content
    @content = StaticContent.get_static_content
  end
end

