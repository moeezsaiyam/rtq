class HomeController < ApplicationController

  def index
    @sub_topics = SubTopic.popular
    @questions = Question.popular.limited.all
  end

  def search
 if params[:search_terms].blank? || (params[:search_terms][:search_topic].blank? && params[:search_term][:search_sub_topic].blank?)
      @search = ThinkingSphinx.search params[:search_term], :classes => [Question, Topic, SubTopic]
      if @search.blank?
      @empty_search = "abc"
      end
    else
      search_terms = refactor_search_terms(params[:search_terms])
      @sub_topics_search = SubTopic.perform_search(params[:search_term], search_terms) unless params[:search_terms][:search_sub_topic].blank? && params[:search_term].blank?
      unless params[:search_terms][:search_sub_topic].blank? && params[:search_term].blank? && @sub_topics_search.blank?
      @empty_search = "abc"
      end 
       #@questions = @sub_topics.collect(&:questions).flatten!.paginate :per_page => 5, :page => params[:page] unless @sub_topics.blank?
        @questions_search = Question.search params[:search_term]
        @topics_search = Topic.perform_search(params[:search_term], search_terms) unless params[:search_terms][:search_topic].blank? && params[:search_term].blank?
        unless params[:search_terms][:search_topic].blank? && params[:search_term].blank? && @topics_search.blank?
         @empty_search = "abc"
        end 
    end 
     end
  private

  def refactor_search_terms(search_terms)
    search_terms.delete_if{|h,i| i.blank? }
    search_terms.symbolize_keys!.merge(search_terms){|k, val| val.to_i }
  end
end
