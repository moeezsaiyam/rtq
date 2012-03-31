class HomeController < ApplicationController

  def index
    @sub_topics = SubTopic.popular
    @questions = Question.most_viewed
  end

  def search
    if params[:search_terms].blank? || (params[:search_terms][:search_topic].blank? && params[:search_term][:search_sub_topic].blank?)
      @topics = Topic.search params[:search_term]
      @sub_topics_search = SubTopic.search params[:search_term]
      @questions_search = Question.search params[:search_term]
      #@questions = @sub_topics.collect(&:questions).flatten!.paginate :per_page => 5, :page => params[:page] unless @sub_topics.blank?
    else
      search_terms = refactor_search_terms(params[:search_terms])
      @sub_topics_search = SubTopic.perform_search(params[:search_term], search_terms) unless params[:search_terms][:search_sub_topic].blank? && params[:search_term].blank?
       #@questions = @sub_topics.collect(&:questions).flatten!.paginate :per_page => 5, :page => params[:page] unless @sub_topics.blank?
        @questions_search = Question.search params[:search_term]
      @topics = Topic.perform_search(params[:search_term], search_terms) unless params[:search_terms][:search_topic].blank? && params[:search_term].blank?
    
    end
  end

  private

  def refactor_search_terms(search_terms)
    search_terms.delete_if{|h,i| i.blank? }
    search_terms.symbolize_keys!.merge(search_terms){|k, val| val.to_i }
  end
end
