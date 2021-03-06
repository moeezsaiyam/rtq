class MainController < ApplicationController

  before_filter :get_static_content, :only => [:about, :quranic_resources, :contact, :credit, :faqs, :edit_content]

  def about
  end

  def quranic_resources
  end

  def contact
    if params[:contact_us].present? && params[:contact_us][:email] == params[:contact_us][:email_confirmation]
      ContactMailer.deliver_contact_us(params[:contact_us][:email], params[:contact_us][:full_name], params[:contact_us][:message])
    elsif params[:contact_us].present?
      flash[:error] = "Emails does not match"
      redirect_to '/main/contact'
    end
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

