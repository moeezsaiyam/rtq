class HomeController < ApplicationController

  def search
    @topics = Topic.search params[:search_term]
    @sub_topics = SubTopic.search params[:search_term]
    @questions = Question.search params[:search_term]
  end

end
