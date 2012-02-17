class HomeController < ApplicationController

  def search
    puts params.inspect
    if params[:search_terms][:search_topic].blank? && params[:search_terms][:search_sub_topic].blank?
      @topics = Topic.search params[:search_term]
      @sub_topics = SubTopic.search params[:search_term]
      @questions = Question.search params[:search_term]
    else
      if params[:search_terms][:search_sub_topic].blank?
        @sub_topics = SubTopic.search params[:search_term], :with => {:topic_id => params[:search_terms][:search_topic].to_i}
        @questions = Question.search params[:search_term]
      else
        @questions = Question.search params[:search_term], :with => {:sub_topic_id => params[:search_terms][:search_sub_topic].to_i}
      end
    end
  end

end
