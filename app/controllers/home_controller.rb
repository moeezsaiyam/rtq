class HomeController < ApplicationController

  def index
    @sub_topics = SubTopic.featured
    @questions = Question.popular.limited.all
  end

  def suggestions
    results = Array.new
    @search = ThinkingSphinx.search params[:search_terms], :min_infix_len => 1
    return if @search.blank?
    @search.each do |s|
      name = s.name unless s.class == Question
      name = s.quest if s.class == Question
      results << {:title => name}
    end
    render :text => results.to_json
  end

  def search
    if params[:search_terms].blank? || (params[:search_terms][:search_topic].blank? && params[:search_term][:search_sub_topic].blank?)
      @search = ThinkingSphinx.search params[:search_term], :per_page => 10, :page => params[:page]
      if @search.blank?
      @empty_search = "abc"
      end
     if params[:search_term] == 'Search'
     @blank_search = ThinkingSphinx.search :per_page => 10, :page => params[:page]
      end
      else
      search_terms = refactor_search_terms(params[:search_terms])
      @sub_topics_search = SubTopic.perform_search(params[:search_term], search_terms) unless params[:search_terms][:search_sub_topic].blank? && params[:search_term].blank?
      unless params[:search_terms][:search_sub_topic].blank? && params[:search_term].blank? && @sub_topics_search.blank?
      @empty_search = "abc"
      end 
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

